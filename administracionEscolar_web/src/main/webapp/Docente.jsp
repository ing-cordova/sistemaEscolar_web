<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Docentes</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_docente.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js&quot; integrity="
	sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboard"));
	String fullname = String.valueOf(sesion.getAttribute("fullname"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
}
%>
	<script type="text/javascript">
		$(document).ready(function () {
			$.post('ControllerDocente', {}, function (response) {
				let datos = JSON.parse(response);
				console.log(datos);

				var tabla = document.getElementById('tablaDatos');
				for (let item of datos) {
					tabla.innerHTML +=
					`
					<tr>
					<td>${item.idDocente}</td>
					<td style="display:none;">${item.idPersona}</td>
					<td>${item.Nombre}</td>
					<td>${item.Apellido}</td>
					<td style="display:none;">${item.Sexo}</td>
					<td>${item.DUI}</td>
					<td>${item.NIT}</td>
					<td style="display:none;">${item.Fecha_Nacimiento}</td>                        
					<td>${item.Correo_Electronico}</td>
					<td style="display:none;">${item.Pass}</td>
					<td>${item.Especialidad}</td>
					<td style="display:none;">${item.docUltima_Modificacion}</td>
					<td style="display:none;">${item.docEstado}</td>
					<td><a href="ControllerDocente?Id=${item.idDocente}&Eliminar=btne" class="btn btn-danger"><i class="fa fa-trash-alt"></i></a>
					<a href="AddDocente.jsp?Id=${item.idDocente}&Id2=${item.idPersona}&Nombres=${item.Nombre}&Apellidos=${item.Apellido}&Sexo=${item.Sexo}&dui=${item.DUI}&nit=${item.NIT}&birthdate=${item.Fecha_Nacimiento}&Email=${item.Correo_Electronico}&Pass=${item.Pass}&Especialidad=${item.Especialidad}" class="btn btn-warning"><i class="fa fa-edit"></i></a>
					</td>
					</tr>
					`
					console.log(item.idDocente);
				}
			});
		});
	</script>
	<div class="container-table">
		<h1 align="center">Docentes existentes</h1>
		<div class="botones">
			<a href="Administrador.jsp" class="btn btn-secondary btn-lg">Regresar al menú principal</a>
			<a href="AddDocente.jsp" class="btn btn-success btn-lg">Agregar nuevo</a>
		</div>
		<table class="table table-dark table-striped" id="tablaDatos">
			<thead>
				<th>ID</th>
				<th>NOMBRE</th>
				<th>APELLIDO</th>
				<th>DUI</th>
				<th>NIT</th>
				<th>E-MAIL</th>
				<th>ESPECIALIDAD</th>
				<th>ACCIONES</th>
			</thead>
		</table>
	</div>
</body>

</html>