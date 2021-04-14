<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Personas Existentes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js&quot; integrity="
	sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>

<body>
	<script type="text/javascript">
            $(document).ready(function () {
                $.post('ControllerPersona', {
                }, function (response) {
                    let datos = JSON.parse(response);
                    console.log(datos);

                    var tabla = document.getElementById('tablaDatos');
                    for (let item of datos) {
                        tabla.innerHTML +=
                            `
                    <tr>
                        <td>${item.idPersona}</td>
                        <td>${item.Nombre}</td>
                        <td>${item.Apellido}</td>
                        <td>${item.Sexo}</td>
                        <td>${item.DUI}</td>
                        <td>${item.NIT}</td>
                        <td>${item.Fecha_Nacimiento}</td>
                        <td>${item.Ultima_Modificacion}</td>
                        <td>${item.Estado}</td>
                    </tr>
                    `
                        console.log(item.idPersona);
                    }
                });
            });
        </script>

	<h1 align="center">Personas Existentes</h1>
	<table class="table table-dark table-striped" id="tablaDatos">
		<thead>
			<th>ID_PERSONA</th>
			<th>NOMBRE</th>
			<th>APELLIDO</th>
			<th>SEXO</th>
			<th>DUI</th>
			<th>NIT</th>
			<th>FECHA_NACIMIENTO</th>
			<th>ULTIMA_MODIFICACION</th>
			<th>ESTADO</th>
		</thead>
	</table>
</body>

</html>