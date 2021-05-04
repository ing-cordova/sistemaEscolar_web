<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Nueva Materia</title>
<link rel="stylesheet" href="Styles/style_addgradocademico.css">
<script src="https://kit.fontawesome.com/dab6165ace.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
	String Id = request.getParameter("Id");
	String Materia = request.getParameter("Materia");

	if (Id == null) {
		Id = "";
		Materia = "";
	}
	%>
	<section class="form-register">
		<h1>Registros de Materias</h1>
		<form action="ControllerMateria" method="get">
		<input type="hidden" name="Id" value=<%=Id%>> 
		<label>Nombre de la Materia:</label>
		<br>
			<input class="controls" type="text" value="<%=Materia%>" name="Materia"  required> 
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>
</body>
</html>