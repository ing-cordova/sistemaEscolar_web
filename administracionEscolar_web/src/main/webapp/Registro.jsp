<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="Imagenes/school.ico">
<title>Formulario de Registro</title>
<link rel="stylesheet" href="Styles/style_registro.css">
<script src="https://kit.fontawesome.com/dab6165ace.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<section class="form-register">
	<h1>Formulario de Registro de Estudiantes</h1>
		<form action="ControllerEstudiante" method="get">
			<label>Nombres:</label>
			<br>
				<input class="controls" type="text" name="nombres" placeholder="Julio David" required> 
				<label>Apellidos:</label>
			<br>
				<input class="controls" type="text" name="apellidos" placeholder="Lopez Mejia" required>
				<label>Sexo:</label>
			<br>
				<select class="controls" name="sexo" required>
					<option>Seleccione una opcion</option>
					<option>M</option>
					<option>F</option>
				</select>
				<!-- Aqui va el combobox de Sexo -->
				<label>Grado Académico:</label>
			<br>
				<select class="controls" name="carreras" id="Grados" >
					<option value="">Seleccione una opcion</option>
				</select>
				<label for="birthdate">Fecha de Nacimiento:</label>
				<br>
				<input class="controls" name="birthdate" type="date" placeholder="20XX-00-00" required>
				<label>DUI:</label>
			<br> 
				<input class="controls" type="text" name="dui" placeholder="00000000-0" required> 
				<label>NIT:</label>
			<br>
				<input class="controls" type="text" name="nit" placeholder="0000-000000-000-0" required>
				<!-- Aqui va el combobox de GradoAcademico -->
				<label>E-mail:</label>
			<br>
				<input class="controls" type="email" placeholder="julio@unab.edu.sv" required> 
				<label>Contraseña:</label>
			<br>
				<input class="controls" type="password" placeholder="Contraseña" required> 
				<input class="boton" type="submit" value="¡Registrar ahora!">
				<p>
					<a href="index.jsp">Ya tengo una cuenta...</a>
				</p>
		</form>
	</section>
</body>
</html>