<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="Imagenes/school.ico">
<title>Nuevo Estudiante</title>
<link rel="stylesheet" href="Styles/style_addEstudiante.css">
<script src="https://kit.fontawesome.com/dab6165ace.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
	String Id = request.getParameter("IdEstudiante");
	String Estudiante = request.getParameter("Estudiante");

	if (Id == null) {
		Id = "";
		Estudiante = "";
	}
	%>
	<section class="form-register">
	<h1>Registros de Estudiantes</h1>
		<form action="ControllerEstudiante" method="get">
		<input type="text" name="IdEstudiante" value=<%=Id%>> 
		<label>Nombre del Estudiante:</label>
		<br>
			<input class="controls" type="text" value="<%=Estudiante%>" name="estudiante"  required> 
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>
</body>
</html>