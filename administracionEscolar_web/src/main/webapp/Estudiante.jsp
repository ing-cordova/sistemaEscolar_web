<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
        <meta charset="utf-8">
        <title>Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
            <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js&quot; integrity="
            sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>
<body>
<script type="text/javascript">
            $(document).ready(function () {
                $.post('ControllerEstudiante', {
                }, function (response) {
                    let datos = JSON.parse(response);
                    console.log(datos);

                    var tabla = document.getElementById('tablaDatos');
                    for (let item of datos) {
                        tabla.innerHTML +=
                            `
                    <tr>
                        <td>${item.idEstudiante}</td>
                        <td>${item.Nombre}</td>
                        <td>${item.Apellido}</td>
                        <td>${item.Correo_Electronico}</td>
                        <td>${item.Nombre_GradoAcad}</td>
                        <td>${item.estUltima_Modificacion}</td>
                        <td>${item.estEstado}</td>
                        <td><a href="ControllerEstudiante?IdEstudiante=${item.idEstudiante}&Eliminar=btne" class="btn btn-danger"><i class="fa fa-trash-alt"></i></a>
						<a href="AddEstudiante.jsp?IdEstudiante=${item.idEstudiante}&Estudiante=${item.Nombre_Estudiante}" class="btn btn-warning"><i class="fa fa-edit"></i></a>
                    </tr>
                    `
                        console.log(item.idEstudiante);
                    }
                });
            });
        </script>
        <h1 align="center">Estudiantes existentes</h1>
        <div class="botones">
        	<a href="Administrador.jsp" class="btn btn-secondary btn-lg">Regresar al menú principal</a>
        	<a href="AddEstudiante.jsp" class="btn btn-success btn-lg">Agregar nuevo</a>
        </div>
        <table class="table table-dark table-striped" id="tablaDatos">
            <thead>
                <th>ID_ESTUDIANTE</th>
                <th>NOMBRES</th>
                <th>APELLIDOS</th>
                <th>E-MAIL</th>
                <th>GRADO ACAD.</th>
                <th>ULTIMA MODIFICACION</th>
                <th>ESTADO</th>
            </thead>
        </table>

</body>
</html>