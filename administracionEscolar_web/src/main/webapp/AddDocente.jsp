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
	String Id2 = request.getParameter("Id2");
	String Correo_Electronico = request.getParameter("Correo_Electronico");
	String Pass = request.getParameter("Pass");
	String Especialidad = request.getParameter("Especialidad");
	

	if (Id == null || Id2 == null) {
		Id = "";
		Id2 = "";
		Correo_Electronico = "";
		Pass = "";
		Especialidad = "";
	}
	%>
		<section class="form-register">
		<h1>Registro de Docente</h1>
		<form action="ControllerDocente" method="get">
		<input type="hidden" name="Id" value=<%=Id%>>
		<input type="hidden" name="Id2" value=<%=Id2%>>
		<label>Correo Electronico del Docente:</label>
		<br>
		<input class="controls" type="text" value="<%=Correo_Electronico%>" name="Correo_Electronico"  required>		 
		<br>
		<label>Contraseña del Docente:</label>
		<br>
		<input class="controls" type="text" value="<%=Pass%>" name="Pass"  required>
		<br>
		<label>Especialidad del Docente:</label>
		<br>
		<input class="controls" type="text" value="<%=Especialidad%>" name="Especialidad"  required>
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>

</body>
</html>