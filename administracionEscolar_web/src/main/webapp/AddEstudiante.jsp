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
	String Id = request.getParameter("Id");
	String Id2 = request.getParameter("Id2");	
	String Correo_Electronico = request.getParameter("Correo_Electronico");
	String Pass = request.getParameter("Pass");
	String Nombre_GradoAcad = request.getParameter("Nombre_GradoAcad");
	

	if (Id == null || Id2 == null) {
		Id = "";
		Id2 = "";
		Correo_Electronico = "";
		Pass = "";
		Nombre_GradoAcad = "";
	}

	%>
	<section class="form-register">
	<h1>Registros de Estudiantes</h1>
		<form action="ControllerEstudiante" method="get">
		<input type="hidden" name="Id" value=<%=Id%>>
		<input type="hidden" name="Id2" value=<%=Id2%>>
		<label>Correo Electronico del Estudiante:</label>
		<br>
		<input class="controls" type="text" value="<%=Correo_Electronico%>" name="Correo_Electronico"  required>		 
		<br>
		<label>Contraseña del Estudiante:</label>
		<br>
		<input class="controls" type="text" value="<%=Pass%>" name="Pass"  required>
		<br>
		<label>Nombre del Grado Academico:</label>
		<br>
		<input class="controls" type="text" value="<%=Nombre_GradoAcad%>" name="Nombre_GradoAcad"  required>
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>
</body>
</html>