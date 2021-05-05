<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="utf-8">
<title>Estudiante | Notas</title>
<link rel="icon" href="Imagenes/school.ico">
<link rel="stylesheet" href="Styles/style_notasestudiante.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
<%
	HttpSession sesion = (HttpSession) request.getSession();
 	String fullname = String.valueOf(sesion.getAttribute("fullnameEst"));
%>
<script type="text/javascript">
		$(document).ready(function () {
			$.post('ControllerNotasEstudiante', {}, function (response) {
				let datos = JSON.parse(response);
				console.log(datos);
				
				var tabla = document.getElementById('tablaNotas');
				for (let item of datos) {
					tabla.innerHTML +=
					`
					<tr>
						<td>${item.Nombre_Materia}</td>
						<td>${item.Periodo1}</td>
						<td>${item.Periodo2}</td>
						<td>${item.Periodo3}</td>
						<td>${item.NotaFinal}</td>
						<td>${item.Recuperacion}</td>
					</tr>
					`
					
				}
			});
		});
	</script>
<header class="header">
		<div class="container">
			<div class="logo">
				<h1>Notas del Estudiante</h1>
			</div>
			<nav class="menu">
				<a href="DashboardEstudiante.jsp">Inicio</a> <a href="#">Materias</a>
				<a href="#">Tareas</a> <a href="#">Ver. Actividades</a>
				<a href="NotasEstudiante.jsp">Notas</a>
			</nav>
		</div>
		<div class="out-header">
			<br>
			<h2>> <%=fullname%></h2>
			<div class="tabla">
				<table  id="tablaNotas">
					<thead>
						<th>MATERIA</th>
						<th>P1</th>
						<th>P2</th>
						<th>P3</th>
						<th>FINAL</th>
						<th>REPO</th>
					</thead>
				</table>
			</div>
		</div>
	</header>
</body>
</html>