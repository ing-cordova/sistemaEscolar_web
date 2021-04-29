<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Dashboard | Administrador</title>
<link rel="icon" href="Imagenes/school.ico">
<link rel="stylesheet" href="Styles/style_administrador.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" />
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
	<header class="header">
		<div class="container">
			<div class="btn-menu">
				<img alt="" src="Imagenes/school.ico">
			</div>
			<div class="logo">
				<h1>Administración Escolar Web</h1>
			</div>
			<nav class="menu">
				<a href="Docente.jsp">Docentes</a> <a href="Estudiante.jsp">Estudiantes</a>
				<a href="Materia.jsp">Materias</a> <a href="Persona.jsp">Personas</a>
				<a href="GradoAcademico.jsp">Grados Académicos</a>
			</nav>
		</div>
	</header>
	<div class="out-header">
		<img alt="" src="Imagenes/head.png" class="img-intro">
		<p class="intro">
			<strong>Bienvenido Administrador/a: <br> <%=fullname%>
			</strong>
		</p>
		<br>
		<p class="outro">
			Puedes navegar por el sitio web a traves de la barra de arriba, ahí
			te puedes dirigir <br> por todo el sistema web.
		</p>
	</div>
	<br>
	<br>
	<form action="ControllerLogin" method="post">
		<input type="submit" name="salir" value="Cerrar la sesión"
			class="regresar">
	</form>
</body>
</html>