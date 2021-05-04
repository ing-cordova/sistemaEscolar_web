<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="Imagenes/school.ico">
<title>Nuevo Docente</title>
<link rel="stylesheet" href="Styles/style_addDocente.css">
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
	String Nombre = request.getParameter("nombre");
	String Apellido = request.getParameter("apellido");
	String Correo_Electronico = request.getParameter("correo_electronico");
	String Especialidad = request.getParameter("especialidad");
	

	if (Id == null) {
		Id = "";
		Nombre = "";
		Apellido = "";
		Correo_Electronico = "";
		Especialidad = "";
	}
	%>
		<section class="form-register">
		<h1>Registro de Docente</h1>
		<form action="ControllerDocente" method="get">
		<input type="hidden" name="Id" value=<%=Id%>> 
		<label>Nombre de Docente:</label>
		<br>
			<input class="controls" type="text" value="<%=Nombre%>" name="nombre"  required>
			<input class="controls" type="text" value="<%=Apellido%>" name="apellido"  required>
			<input class="controls" type="text" value="<%=Correo_Electronico%>" name="correo_electronico"  required>
			<input class="controls" type="text" value="<%=Especialidad%>" name="especialidad"  required> 
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>

</body>
</html>