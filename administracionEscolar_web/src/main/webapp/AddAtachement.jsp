<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Ajuntar Tarea</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_addatachement.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

	<%		
		String IdActi = request.getParameter("IdActi");
		String idMateeee = request.getParameter("idMateeee");
		String NombreActi = request.getParameter("NombreActi");
		String Porcent = request.getParameter("Porcent");
		String FechaEntrega = request.getParameter("FechaEntrega");
		String EstadoActiv = request.getParameter("EstadoActiv");
		
		if(IdActi == null || IdActi == ""){
			IdActi = "";
			NombreActi = "";
			Porcent = "";
			FechaEntrega = "";
			EstadoActiv = "";
		}
	%>
	<section class="form-register">
		<h1>ADJUNTAR TAREA</h1>
		<form action="ControllerEnviarArchivo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="IdActi" value="<%=IdActi%>">
			<input type="hidden" name="idMateeee" value="<%=idMateeee%>">
			<label>Nombre de la actividad:</label>
			<input class="controls" type="text" value="<%=NombreActi%>" name="NombreActi" readonly> 
			<br>
			<label>Porcentaje (%):</label>
			<input class="controls" type="text" name="Porcent" value="<%=Porcent%>" readonly> 
			<br>
			<label>Fecha de Entrega:</label>
			<br>
			<input class="controls" value="<%=FechaEntrega%>" name="FechaEntrega" type="date" readonly>
			<br>
			<label>Estado Actividad:</label>
			<input class="controls" type="text" name="EstadoActiv" value="<%=EstadoActiv%>" readonly> 
			<br>
			<label>Archivo:</label>
			<input class="controls" type="file" name="archivo" accept="application/pdf" required> 
			<br>
			<!-- <button name="btna" value="Guardar" class="boton">¡Procesar ahora!</button> -->
			<input type="submit" class="boton" value="¡Procesar ahora">
			<p>
				<a href="TareasEstudiante.jsp">CANCELAR</a>
			</p>
		</form>
	</section>
</body>
</html>