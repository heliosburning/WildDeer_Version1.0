<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WILD DEER</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">   
    <link rel="stylesheet" href="Vista/CSS/login.css"> 
</head>

<body onload="setTimeout(carga, 500)">
    <div id="preloader">
        <div class="loader"></div>
    </div>

    <div class="wrapper">
        <div class="auth-content">
            <div class="card">
                <div class="card-body">
                    <div class="mb-4">
                        <p class="titulo">BIENVENIDO</p>
                    </div>
                    <form action="Controlador/Usuario/Login.php" method="POST" autocomplete="on">
                        
                        <div class="form-group">
                            <label for="usuario">Usuario:</label>
                            <input type="text" class="form-control" name="usuario" required>
                        </div>

                        <div class="form-group">
                            <label for="clave">Clave:</label>
                            <input type="password" class="form-control" name="clave" required>
                        </div>

                        <input class="btn shadow-2 col-md-12 text-uppercase mt-4" type="submit" name="accion" value="Ingresar">
                    </form>
                    
                    <hr>
                    
                    <div class="mt-1">
                        <div class="row">
                            <p style="display: inline; margin: 0;">¿No tienes una cuenta?</p>
                            <a href="URL_DE_REGISTRO" class="registro-link"> Regístrate</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Vista/JavaScript/preloader.js"></script>
</body>
</html>