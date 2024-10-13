CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(20) NOT NULL
);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    usuario VARCHAR(20) NOT NULL UNIQUE,
    clave VARCHAR(20) NOT NULL,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES rol (id_rol) ON UPDATE NO ACTION ON DELETE NO ACTION
);

insert into rol(nombre_rol) values ('Usuario');

insert into usuario(usuario, clave, id_rol) values ('admin_dani', 'septiembre', 1);


CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    usuario_cliente VARCHAR(20) NOT NULL UNIQUE,
    clave VARCHAR(20) NOT NULL,
    id_rol INT DEFAULT 1 REFERENCES rol (id_rol),
    nombre VARCHAR(50) NOT NULL,
    calle VARCHAR(100),
    numero VARCHAR(100),
    colonia VARCHAR(100),
    ciudad VARCHAR(100),
    edad INT CHECK (edad > 15),
    telefono VARCHAR(15),
    correo VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE servicio (
    id_servicio SERIAL PRIMARY KEY,
    nombre_servicio VARCHAR(50) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL
);
CREATE TABLE cita (
    id_cita SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(20) NOT NULL REFERENCES cliente (usuario_cliente),
    fecha DATE NOT NULL,
    hora_reserva TIME NOT NULL, 
    hora_termino TIME, 
    metodo_pago VARCHAR(20),
    costo_total NUMERIC(10, 2) DEFAULT 0.00,
    nombre_barbero VARCHAR(20),
    anticipo NUMERIC(10, 2) DEFAULT 0.00
);
CREATE TABLE cita_servicio (
    id_cita INT REFERENCES cita (id_cita),
    id_servicio INT REFERENCES servicio (id_servicio),
    cantidad INT DEFAULT 1 CHECK (cantidad > 0), 
    costo NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (id_cita, id_servicio)
);
CREATE TABLE barbero (
    id_barbero SERIAL PRIMARY KEY,
    usuario_barbero VARCHAR(20) NOT NULL UNIQUE,
    clave VARCHAR(20) NOT NULL,
    id_rol INT DEFAULT 1 REFERENCES rol (id_rol),
    nombre VARCHAR(50) NOT NULL,
    calle VARCHAR(100),
    numero VARCHAR(100),
    colonia VARCHAR(100),
    ciudad VARCHAR(100),
    edad INT CHECK (edad > 18), 
    telefono VARCHAR(15),
    correo VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE metodo_pago (
    id_metodo_pago SERIAL PRIMARY KEY,
    nombre_metodo VARCHAR(50) NOT NULL
);

-- Inserciones de Barberos
INSERT INTO barbero (usuario_barbero, clave, id_rol, nombre, calle, numero, colonia, ciudad, edad, telefono, correo) VALUES
('barbero1', 'clave123', 2, 'Juan Martínez', 'Calle 1', '101', 'Colonia A', 'Ciudad X', 30, '555-1234', 'juan.martinez@example.com'),
('barbero2', 'clave123', 2, 'Luis Rodríguez', 'Calle 2', '102', 'Colonia B', 'Ciudad Y', 28, '555-5678', 'luis.rodriguez@example.com'),
('barbero3', 'clave123', 2, 'Carlos Fernández', 'Calle 3', '103', 'Colonia C', 'Ciudad Z', 35, '555-8765', 'carlos.fernandez@example.com'),
('barbero4', 'clave123', 2, 'Pedro Gómez', 'Calle 4', '104', 'Colonia D', 'Ciudad W', 40, '555-4321', 'pedro.gomez@example.com'),
('barbero5', 'clave123', 2, 'Sofía López', 'Calle 5', '105', 'Colonia E', 'Ciudad V', 25, '555-9876', 'sofia.lopez@example.com');

-- Inserciones de Clientes
INSERT INTO cliente (usuario_cliente, clave, id_rol, nombre, calle, numero, colonia, ciudad, edad, telefono, correo) VALUES
('client1', '321654', 1, 'Ana Torres', 'Calle 3', '103', 'Colonia C', 'Ciudad Z', 25, '555-8765', 'ana.torres@example.com'),
('client2', '321654', 1, 'Carlos Ruiz', 'Calle 4', '104', 'Colonia D', 'Ciudad W', 35, '555-4321', 'carlos.ruiz@example.com'),
('client3', '321654', 1, 'María López', 'Calle 5', '105', 'Colonia E', 'Ciudad V', 40, '555-9876','maria.lopez@example.com'),
('client4','321654' ,1,'Pedro Sánchez','Calle 6','106','Colonia F','Ciudad U' ,22,'555-3456','pedro.sanchez@example.com');

-- Inserciones de Servicios
INSERT INTO servicio (nombre_servicio, precio) VALUES
('Corte de cabello básico' ,15.00),
('Afeitado' ,10.00),
('Corte y afeitado' ,20.00),
('Lavado de cabello' ,5.00),
('Corte de cabello con diseño' ,25.00);

--
--
--

CREATE OR REPLACE FUNCTION Cantidad_Servicios_Cita(p_id_cita INT)
RETURNS INT AS $$
DECLARE
    v_cantidad_total INT;
BEGIN
    -- Calcular la cantidad total de servicios para la cita especificada
    SELECT SUM(cantidad) INTO v_cantidad_total
    FROM cita_servicio
    WHERE id_cita = p_id_cita;

    -- Si no hay servicios, retornar 0
    IF v_cantidad_total IS NULL THEN
        RETURN 0;
    END IF;

    RETURN v_cantidad_total; -- Retornar la cantidad total
END;
$$
 LANGUAGE plpgsql;
--SELECT Cantidad_Servicios_Cita(6);

-- Crear la tabla temporal para almacenar los servicios seleccionados
CREATE TEMP TABLE Seleccionar_Servicios (id_servicio INT, cantidad INT, costo NUMERIC(10, 2) NOT NULL);

-- Función para agregar un servicio a la tabla temporal
CREATE OR REPLACE FUNCTION Agregar_Servicio_Cita(
   p_id_servicio INT,
   p_cantidad INT
) RETURNS VOID AS $$
DECLARE
   v_precio NUMERIC(10, 2);
   v_costo NUMERIC(10, 2);
BEGIN
   -- Verificar si el servicio existe
   IF NOT EXISTS (SELECT 1 FROM servicio WHERE id_servicio = p_id_servicio) THEN
       RAISE EXCEPTION 'El servicio con ID % no existe', p_id_servicio;
   END IF;

   -- Obtener el precio del servicio correspondiente
   SELECT precio INTO v_precio
   FROM servicio
   WHERE id_servicio = p_id_servicio;

   -- Calcular el costo total para la cantidad de servicios
   v_costo := v_precio * p_cantidad;

   -- Insertar en la tabla temporal
   INSERT INTO Seleccionar_Servicios (id_servicio, cantidad, costo)
   VALUES (p_id_servicio, p_cantidad, v_costo);
END;
$$
 LANGUAGE plpgsql;

--
--
--

-- Función para registrar una cita
CREATE OR REPLACE FUNCTION Registrar_Cita(
    p_usuario_cliente VARCHAR(20), 
    p_fecha DATE,
    p_hora_reserva TIME,
    p_metodo_pago VARCHAR(50),
    p_usuario_barbero VARCHAR(20)  -- Nuevo parámetro para el barbero seleccionado
) RETURNS TEXT AS $$  -- Cambiar el tipo de retorno a TEXT
DECLARE
    v_costo_total NUMERIC(10, 2);
    v_id_cita INT;
    v_hora_termino TIME; -- Variable para almacenar la hora de término
    v_cantidad_servicios INT; -- Variable para almacenar la cantidad de servicios
BEGIN
    -- Verificar si hay servicios seleccionados
    IF NOT EXISTS (SELECT 1 FROM Seleccionar_Servicios) THEN
        RAISE EXCEPTION 'No hay servicios seleccionados para registrar la cita';
    END IF;

    -- Validar que la hora de reserva esté dentro del horario de la barbería
    IF p_hora_reserva < '10:00:00' THEN
        RETURN 'Hora no válida: antes de las 10:00'; -- Mensaje si la hora es antes de las 10:00:00
    ELSIF p_hora_reserva > '20:00:00' THEN
        RETURN 'Hora no válida: después de las 20:00'; -- Mensaje si la hora es después de las 20:00:00
    END IF;

    -- Calcular el costo total de los servicios seleccionados
    SELECT SUM(costo) INTO v_costo_total FROM Seleccionar_Servicios;

    -- Verificar si el cliente ya tiene una cita en la misma fecha y hora
    IF EXISTS (
        SELECT 1 
        FROM cita 
        WHERE nombre_cliente = p_usuario_cliente 
        AND fecha = p_fecha 
        AND (
            (p_hora_reserva BETWEEN hora_reserva AND hora_termino) OR
            (p_hora_reserva + INTERVAL '30 minutes' * Cantidad_Servicios_Cita(v_id_cita) BETWEEN hora_reserva AND hora_termino)
        )
    ) THEN
        RETURN 'Conflicto en citas: ya tiene una cita en este horario'; -- Mensaje si hay un empalme en las citas
    END IF;

    -- Verificar si el barbero seleccionado está disponible
    IF EXISTS (
        SELECT 1 
        FROM cita c 
        WHERE c.nombre_barbero = p_usuario_barbero 
        AND c.fecha = p_fecha 
        AND c.hora_reserva = p_hora_reserva
    ) THEN
        RETURN 'Barbero ocupado'; -- El barbero está ocupado en ese horario, retornar mensaje específico
    END IF;

    -- Insertar la nueva cita en la tabla cita sin hora_termino inicialmente
    INSERT INTO cita (nombre_cliente, fecha, hora_reserva, costo_total, nombre_barbero, metodo_pago, anticipo)
    VALUES (p_usuario_cliente, p_fecha, p_hora_reserva, v_costo_total, p_usuario_barbero, p_metodo_pago, v_costo_total / 2)
    RETURNING id_cita INTO v_id_cita;

    -- Insertar los servicios seleccionados en la tabla cita_servicio
    INSERT INTO cita_servicio (id_cita, id_servicio, cantidad, costo)
    SELECT v_id_cita, id_servicio, cantidad, costo
    FROM Seleccionar_Servicios;

    -- Obtener la cantidad total de servicios para calcular hora_termino
    v_cantidad_servicios := Cantidad_Servicios_Cita(v_id_cita); 

    -- Calcular la hora de término como 30 minutos multiplicado por la cantidad de servicios
    v_hora_termino := (p_hora_reserva + (INTERVAL '30 minutes' * v_cantidad_servicios))::TIME;

    -- Asegurarse de que la hora de término no exceda las 20:00:00
    IF v_hora_termino > '20:00:00' THEN
        RETURN 'Hora no válida: excede las 20:00'; -- Mensaje si excede las 20:00:00.
    END IF;

    -- Actualizar la cita con el nuevo valor de hora_termino
    UPDATE cita SET hora_termino = v_hora_termino WHERE id_cita = v_id_cita;

    -- Limpiar la tabla temporal después de registrar la cita
    DELETE FROM Seleccionar_Servicios;

    RETURN 'Cita registrada con éxito. ID de cita: ' || v_id_cita; -- Mensaje confirmando el registro exitoso con el ID de la cita creada.
END;
$$
 LANGUAGE plpgsql;
--
--
SELECT Agregar_Servicio_Cita(1, 1); SELECT Registrar_Cita('client1', '2024-09-27', '13:40:00', 'Tarjeta', 'barbero1'); 
--
SELECT Agregar_Servicio_Cita(2, 1); SELECT Registrar_Cita('client2', '2024-09-27', '13:41:00', 'Tarjeta', 'barbero2'); 
--
SELECT Agregar_Servicio_Cita(3, 1); SELECT Registrar_Cita('client3', '2024-09-27', '13:42:00', 'Tarjeta', 'barbero3'); 
--
SELECT Agregar_Servicio_Cita(3, 1); SELECT Registrar_Cita('client4', '2024-09-27', '13:43:00', 'Tarjeta', 'barbero4'); 
--
SELECT Agregar_Servicio_Cita(1, 2); SELECT Registrar_Cita('client1', '2024-09-27', '14:50:00', 'Tarjeta', 'barbero1'); 
--
SELECT Agregar_Servicio_Cita(1, 3); SELECT Agregar_Servicio_Cita(2, 4); SELECT Agregar_Servicio_Cita(3, 2); 
SELECT registrar_cita('client3', '2024-09-27', '14:50:00', 'Tarjeta', 'barbero5');
--select * from cita
--select id_cita, cantidad from cita_servicio

--
--
--

/*Para terminar la cita y acabar el registro, completando el anticipo.*/
CREATE OR REPLACE FUNCTION Terminar_Cita(p_id_cita INT)
RETURNS TABLE(
    fecha_actual DATE,
    hora_actual TIME,
    minutos_actual INT,
    segundos_actual INT,
    fecha_cita DATE,
    hora_reserva_cita TIME, -- Renombrada para evitar ambigüedad
    anticipo NUMERIC(10, 2)
) AS $$
DECLARE
    v_fecha_cita DATE;
    v_hora_reserva TIME; -- Variable para almacenar hora_reserva
    v_costo_total NUMERIC(10, 2);
BEGIN
    -- Obtener la fecha y hora actuales
    SELECT CURRENT_DATE, CURRENT_TIME, 
           EXTRACT(MINUTE FROM CURRENT_TIMESTAMP), 
           EXTRACT(SECOND FROM CURRENT_TIMESTAMP)
    INTO fecha_actual, hora_actual, minutos_actual, segundos_actual;

    -- Obtener la fecha y hora de la cita especificada
    SELECT fecha, hora_reserva, costo_total INTO v_fecha_cita, v_hora_reserva, v_costo_total
    FROM cita
    WHERE id_cita = p_id_cita;

    -- Verificar si la cita existe
    IF v_fecha_cita IS NULL THEN
        RETURN;
    END IF;

    -- Comprobar si la fecha y hora actuales son mayores que la fecha y hora de la cita
    IF (fecha_actual > v_fecha_cita) OR (fecha_actual = v_fecha_cita AND hora_actual > v_hora_reserva) THEN
        -- Actualizar el anticipo con el costo total de la cita
        UPDATE cita
        SET anticipo = v_costo_total
        WHERE id_cita = p_id_cita;
    END IF;

    -- Devolver los valores finales
    RETURN QUERY SELECT fecha_actual, hora_actual, minutos_actual, segundos_actual,
                         v_fecha_cita, v_hora_reserva, v_costo_total;
END;
$$
 LANGUAGE plpgsql;

SELECT * FROM Terminar_Cita(1);
SELECT * FROM Terminar_Cita(2);
SELECT * FROM Terminar_Cita(3);
SELECT * FROM Terminar_Cita(4);
SELECT * FROM Terminar_Cita(5);
SELECT * FROM Terminar_Cita(6);

--
--
--

/*CONSULTA PARA VER LOS SERVICIOS QUE TIENE RESERVADOS UN USUARIO CON SU NOMBRE_USUARIO*/
CREATE OR REPLACE FUNCTION Servicios_Cita_Cliente(p_nombre_usuario VARCHAR)
RETURNS TABLE (
    id_cita INT,
    fecha DATE,
    hora_reserva TIME,
    hora_termino TIME,
    nombre_barbero VARCHAR(20),
    nombre_servicio VARCHAR(50),
    cantidad INT,
    costo NUMERIC(10, 2)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id_cita,
        c.fecha,
        c.hora_reserva,
        c.hora_termino,
        c.nombre_barbero,
        s.nombre_servicio,
        cs.cantidad,
        cs.costo
    FROM 
        cita c
    JOIN 
        cita_servicio cs ON c.id_cita = cs.id_cita
    JOIN 
        servicio s ON cs.id_servicio = s.id_servicio
    WHERE 
        c.nombre_cliente = p_nombre_usuario;
END;
$$
 LANGUAGE plpgsql;
--SELECT * FROM Servicios_Cita_Cliente('client1');

/*CONSULTA PARA QUE UN BARBERO VEA SUS CITAS PROGRAMADAS*/
CREATE OR REPLACE FUNCTION Citas_Barbero(p_usuario_barbero VARCHAR)
RETURNS TABLE (
    id_cita INT,
    nombre_cliente VARCHAR(20),
    fecha DATE,
    hora_reserva TIME,
    hora_termino TIME,
    costo_total NUMERIC(10, 2),
    metodo_pago VARCHAR(20)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id_cita,
        c.nombre_cliente,
        c.fecha,
        c.hora_reserva,
        c.hora_termino,
        c.costo_total,
        c.metodo_pago
    FROM 
        cita c
    WHERE 
        c.nombre_barbero = p_usuario_barbero
    ORDER BY 
        c.fecha, c.hora_reserva; 
END;
$$
 LANGUAGE plpgsql;
--SELECT * FROM Citas_Barbero('barbero1');


/*AGENDAR ANTES Y DESPUÉS DE LA HORA*/
--SELECT Agregar_Servicio_Cita(1, 1); SELECT Registrar_Cita('client4', '2024-09-27', '09:00:00', 'Tarjeta'); 
--SELECT Agregar_Servicio_Cita(1, 1); SELECT Registrar_Cita('client4', '2024-09-27', '20:00:00', 'Tarjeta'); 

/*AGENDAR A LA MISMA HORA*/
--SELECT Agregar_Servicio_Cita(2, 10); SELECT Registrar_Cita('client4', '2024-09-28', '15:00:00', 'Tarjeta'); 
--SELECT Agregar_Servicio_Cita(1, 1); SELECT Registrar_Cita('client4', '2024-09-28', '15:00:00', 'Tarjeta'); 



/*CONSULTA PARA OBTENER FECHA, HORA, MINUTO Y SEGUNDO ACTUAL*/
/*SELECT 
    CURRENT_DATE AS fecha,
    CURRENT_TIME AS hora,
    EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) AS minutos,
    EXTRACT(SECOND FROM CURRENT_TIMESTAMP) AS segundos;*/

/*
Registramos servicios y barberos.
Usuario se puede registrar.

Usuario elige su servicio y la cantidad de servicios que quiere.

Usuario elige fecha, se toma un anticipo.

Barbero Marca Terminada la Cita y el anticipo se iguala al costo total.
*/