<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <meta charset="ISO-8859-1">
        <title>Materias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js&quot; integrity="
            sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>

    <body>
        <script type="text/javascript">
            $(document).ready(function () {
                $.post('ControllerMateria', {
                }, function (response) {
                    let datos = JSON.parse(response);
                    console.log(datos);
                    
                    var tabla = document.getElementById('tablaDatos');
                    for (let item of datos) {
                        tabla.innerHTML +=
                            `
                        <td>${item.idMateria}</td>
                        <td>${item.Nombre_Materia}</td>
                        <td>${item.Nombre_GradoAcad}</td>
                        <td>${item.mtrUltima_Modificacion}</td>
                        <td>${item.mtrEstado}</td>
                        `
                    }
                });
            });
        </script>
        <h1 align="center">Materias existentes</h1>
        <table class="table table-dark table-striped" id="tablaDatos">
            <thead>
                <th>ID_MATERIA</th>
                <th>NOMBRE MATERIA</th>
                <th>GRADO ACADEMICO</th>
                <th>ULTIMA MODIFICACION</th>
                <th>ESTADO</th>
            </thead>
        </table>
    </body>

    </html>