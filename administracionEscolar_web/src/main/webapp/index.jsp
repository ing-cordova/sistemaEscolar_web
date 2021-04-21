<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Inicio | Sistema Escolar</title>
        <link rel="icon" href="Imagenes/school.ico">
        <link rel="stylesheet" href="Styles/style_index.css">
        <script src="https://kit.fontawesome.com/dab6165ace.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    </head>

    <body>
        <img class="wave" src="Imagenes/wave.png">
        <div class="container">
            <div class="img">
                <img src="Imagenes/teaching.svg">
            </div>
            <div class="login-content">
                <form action="ControllerLogin" method="post">
                    <img src="Imagenes/male_avatar.svg">
                    <h2 class="title">Bienvenido</h2>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>E-mail</h5>
                            <input type="email" name="email" class="input">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password</h5>
                            <input type="password" name="password" class="input">
                        </div>
                    </div>
                    <input type="submit" class="btn" value="Iniciar Sesion">
                </form>
            </div>
        </div>
        <script type="text/javascript" src="Scripts/script_index.js"></script>
    </body>

    </html>