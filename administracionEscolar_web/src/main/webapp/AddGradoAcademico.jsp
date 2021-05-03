<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="Imagenes/school.ico">
<title>Nuevo Grado Académico</title>
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
	String GradoAcad = request.getParameter("GradoAcad");

	if (Id == null) {
		Id = "";
		GradoAcad = "";
	}
	%>
	<section class="form-register">
		<h1>Registros de Grados Académicos</h1>
		<form action="ControllerGradoAcademico" method="get">
		<input type="hidden" name="Id" value=<%=Id%>> 
		<label>Nombre del Grado académico:</label>
		<br>
			<input class="controls" type="text" value="<%=GradoAcad%>" name="GradoAcad"  required> 
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>
</body>
</html>