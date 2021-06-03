<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboard"));
	String fullname = String.valueOf(sesion.getAttribute("fullname"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
}
%>
	<%
	String Id = request.getParameter("Id");
	String Id2 = request.getParameter("Id2");
	String Nombres = request.getParameter("Nombres");
	String Apellidos = request.getParameter("Apellidos");
	String Sexo = request.getParameter("Sexo");
	String DUI = request.getParameter("Dui");
	String NIT = request.getParameter("Nit");
	String FechaNacimiento = request.getParameter("birthdate");
	String Correo_Electronico = request.getParameter("Correo_Electronico");
	String Pass = request.getParameter("Pass");
	String Especialidad = request.getParameter("Especialidad");
	System.out.println(FechaNacimiento);
	

	if (Id == null || Id2 == null) {
	Id = "";
	Id2 = "";
	Nombres = "";
	Apellidos = "";
	Sexo = "Seleccione una Opcion";
	DUI = "";
	NIT = "";
	FechaNacimiento = "";
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
		<label>Nombres:</label>
		<br>
		<input class="controls" type="text" value ="<%=Nombres%>" name="nombres" placeholder="Julio David" required> 
		<label>Apellidos:</label>
		<br>
		<input class="controls" type="text" value ="<%=Apellidos%>" name="apellidos" placeholder="Lopez Mejia" required>
		<br>
		<label>Sexo:</label>
		<br>
		<select class="controls" name="sexo" required>
			<option selected ><%=Sexo%></option>
			<option>M</option>
			<option>F</option>
		</select>
		<!-- Aqui va el combobox de Sexo -->
		<br>
		<label>DUI:</label>
		<br> 
		<input class="controls" type="text" value ="<%=DUI%>" name="Dui" placeholder="00000000-0" required>
		<br>
		<label>NIT:</label>
		<br>
		<input class="controls" type="text" value ="<%=NIT%>" name="Nit" placeholder="0000-000000-000-0" required>
		<br>
		<label for="birthdate">Fecha de Nacimiento:</label>
		<br>
		<input class="controls" value ="<%=FechaNacimiento%>" name="birthdate" type="date" placeholder="20XX-00-00" required>
		<br>
		<label>Correo Electronico del Docente:</label>
		<br>
		<input class="controls" type="text" value="<%=Correo_Electronico%>" name="Correo_Electronico"  required>		 
		<br>
		<label>Contraseña del Docente:</label>
		<br>
		<input class="controls" type="password" value="<%=Pass%>" name="Pass"  required>
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