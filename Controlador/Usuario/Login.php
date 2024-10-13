<?php
session_start();
require '../../Modelo/Conexion/Conexion.php';

// Activar la visualización de errores para depuración
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (!empty($_POST['usuario']) && !empty($_POST['clave'])) {
    $usuario = $_POST['usuario'];
    $clave = $_POST['clave'];

    // Consulta para verificar usuario y clave en una sola operación
    $query = $conn->prepare('SELECT id_usuario, usuario, clave, id_rol FROM usuario WHERE usuario = :usuario');
    $query->bindParam(':usuario', $usuario);
    $query->execute();

    $user = $query->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // Cambiar de password_verify a una comparación directa por ahora
        if ($clave === $user['clave']) {
            // Usuario autenticado correctamente
            $_SESSION['user_id'] = $user['id_usuario'];
            $_SESSION['user_role'] = $user['id_rol'];

            if ($user['id_rol'] == 1) {
                // Rol de administrador
                header("Location: ../../index.php");
            } elseif ($user['id_rol'] == 2) {
                // Rol de usuario normal
                header("Location: ../../buggy.php");
            } else {
                // Rol no reconocido
                header("Location: ../../buggy.php");
            }
        } else {
            // Contraseña incorrecta
            header("Location: ../../login.php");
        }
    } else {
        // Usuario no encontrado
        header("Location: ../../login.php");
    }
} else {
    // Campos vacíos
    header("Location: ../../login.php");
}
// exit();
?>