<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="Imagenes/school.ico">
<title>Add Persona</title>
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
	String Persona = request.getParameter("Persona");
	String Apellido = request.getParameter("Apellido");
	String Sexo = request.getParameter("Sexo");
	String DUI = request.getParameter("DUI");
	String NIT = request.getParameter("NIT");
	String Fecha_Nacimiento = request.getParameter("Fecha_Nacimiento");

	if (Id == null) {
		Id = "";
		Persona = "";
		Apellido = "";
		Sexo = "";
		DUI = "";
		NIT = "";
		Fecha_Nacimiento = "";
	}
	%>
	<section class="form-register">
		<h1>Registros de Persona</h1>
		<form action="ControllerPersona" method="get">
		<input type="hidden" name="Id" value=<%=Id%>> 
		<label>Nombres:</label>
		<br>
			<input class="controls" type="text" value="<%=Persona%>" name="Persona"  required> 
		<br>
		<label>Apellidos:</label>
		<input class="controls" type="text" value="<%=Apellido%>" name="Apellido"  required> 
		<br>
		<label>Sexo:</label>
		<select class="controls" name="Sexo" required>
					<option>Seleccione una opcion</option>
					<option>M</option>
					<option>F</option>
				</select>
		<br>
		<label>DUI:</label>
		<input class="controls" type="text" value="<%=DUI%>" name="DUI"  required> 
		<br>
		<label>NIT:</label>
		<input class="controls" type="text" value="<%=NIT%>" name="NIT"  required> 
		<br>
		<label>Fecha_Nacimiento:</label>
		<input class="controls" type="date" value="<%=Fecha_Nacimiento%>" name="Fecha_Nacimiento"  required> 
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>
</body>
</html>