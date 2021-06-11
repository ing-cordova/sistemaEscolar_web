<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Dashboard | Estudiante</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_dashestudiante.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboardEst"));
	String fullname = String.valueOf(sesion.getAttribute("fullnameEst"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
	}
	
	Date date = new Date();
	SimpleDateFormat formateadorFecha = new SimpleDateFormat("yyyy");
	System.out.println("Año desde JSP: " + formateadorFecha.format(date));
	
	String fechaC = formateadorFecha.format(date);
%>
<header class="header">
	<div class="container">
		<div class="btn-menu">
			<img alt="" src="Imagenes/school.ico">
		</div>
		<div class="logo">
			<h1>Portal Estudiantil <%=fechaC%> </h1>
		</div>
		<nav class="menu">
			<a href="#">Inicio</a> <a href="RegistroMateriasEstudiante.jsp">Materias</a>
			<a href="TareasEstudiante.jsp">Tareas</a> <a href="VerActividades.jsp">Ver. Actividades</a>
			<a href="NotasEstudiante.jsp">Notas</a>
		</nav>
	</div>
	<div class="out-header">
		<img alt="" src="Imagenes/graduated.png" class="img-intro">
		<p class="intro">
			<strong>Bienvenido Estudiante: <br> <%=fullname%>
			</strong>
		</p>
		<br>
		<p class="outro">
			Puedes navegar por el sitio web a traves de la barra de arriba, ahí
			te puedes dirigir <br> por todo el sistema web.
		</p>
	</div>
	<br>
	<form action="ControllerLogin" method="post">
		<input type="submit" name="salir" value="Cerrar la sesión"
		class="regresar">
	</form>
</header>
</body>
</html>