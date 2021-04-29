<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Error.</title>
<link rel="icon" href="Imagenes/errorIcono.ico">
<link rel="stylesheet" href="Styles/style_error.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("errorLogin"));
	System.out.println("Tipo usuario: " + usuSession);

	if (usuSession.equals(null) || usuSession.equals("null")) {
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="container">
		<p class="pintro">
			<strong>Ops, ¡Lo sentimos pero este sítio web no responde! </strong>
		</p>
		<br>
		<h1>404</h1>
		<br>
		<p class="poutro">
			<strong>No pudimos encontrar la página que usted está
				buscando, <br> o hubo un problema con el servidor.
			</strong>
		</p>
		<br>
		<br>
		<form action="ControllerLogin" method="post">
			<input type="submit" name="error" value="Llévame al inicio"
				class="regresar">
		</form>
	</div>
</body>
</html>