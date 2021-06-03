<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<link rel="icon" href="Imagenes/school.ico">
	<title>NUEVA MATERIA</title>
	<link rel="stylesheet" href="Styles/style_addMateria.css">
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
	<script type="text/javascript">
		$(document).ready(function () {
			$.post('ControllerRegistroEstudiante', {
			}, function (response) {
				let datos = JSON.parse(response);
				console.log(datos);
				
				var combo = document.getElementById('TipoSelect');
				for (let item of datos) {
					combo.innerHTML +=
					`
					<option value ="${item.idGradoAcademico}">${item.Nombre_GradoAcad}</option>
					
					`
				}
			});
		});
	</script>


	<%
	String Id = request.getParameter("Id");
	String Materia = request.getParameter("Materia");
	String GradoAcad = request.getParameter("GradoAcad");
	String IdGrado = request.getParameter("IdGrado");
	

	if (Id == null || IdGrado == null) {
	Id = "";
	Materia = "";
	GradoAcad = "Seleccione una opcion";
	IdGrado = "";
}
%>
<section class="form-register">
	<h1>Registros de Materias</h1>
	<form action="ControllerMateria" method="get">
		<input type="hidden" name="Id" value=<%=Id%>> 
		<label>Nombre de la Materia:</label>
		<br>
		<input class="controls" type="text" value="<%=Materia%>" name="Materia"  required> 
		<br>
		<label>Seleccione el Grado Academico</label>
		<br>
		<select class="controls" name="GradoAcad"  id="TipoSelect" required>
			<option value="<%=IdGrado%>" selected><%=GradoAcad%></option>
		</select>
		<br>
		<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
	</form>
</section>
</body>
</html>