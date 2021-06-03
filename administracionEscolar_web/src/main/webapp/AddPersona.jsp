<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<link rel="icon" href="Imagenes/school.ico">
	<title>Nueva Persona</title>
	<link rel="stylesheet" href="Styles/style_addPersona.css">
	<script src="https://kit.fontawesome.com/dab6165ace.js"
	crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
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
	<%
	String Id = request.getParameter("Id");
	String Persona = request.getParameter("Persona");
	String Apellido = request.getParameter("Apellido");
	String Sexo = request.getParameter("Sexo");
	String DUI = request.getParameter("DUI");
	String NIT = request.getParameter("NIT");
	String Fecha_Nacimiento = request.getParameter("Fecha_Nacimiento");
	System.out.println(Fecha_Nacimiento);

	if (Id == null) {
	Id = "";
	Persona = "";
	Apellido = "";
	Sexo = "Seleccione una Opcion";
	DUI = "";
	NIT = "";
	Fecha_Nacimiento = "";
}
%>

<section class="form-register">
	<h1>Registros de Personas</h1>
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
			<option selected><%=Sexo%></option>
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
		<input class="controls" type="date" value="<%=Fecha_Nacimiento%>" name="Fecha_Nacimiento"  id="idfechaa" required> 
		<br>
		<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
	</form>
</section>
</body>
</html>