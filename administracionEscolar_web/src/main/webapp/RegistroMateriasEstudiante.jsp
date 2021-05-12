<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="utf-8">
<title>Materias | Estudiantes</title>
<link rel="icon" href="Imagenes/school.ico">
<link rel="stylesheet" href="Styles/style_registromateriasEst.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
</head>
<body>
<script type="text/javascript">
		$(document).ready(function () {
			$.post('ControllerRegistroMateriasEstudiante', {}, function (response) {
				let datos = JSON.parse(response);
				console.log(datos);
					
				var tabla = document.getElementById('tablaMateriasAIscribir');
				for(let item of datos){
					tabla.innerHTML +=
                        `      
                    <td>${item.idMateria}</td>
                    <td>${item.Nombre_Materia}</td>
                    
                    `
				}
			});
		});
	</script>
<header class="header">
		<div class="container">
			<div class="logo">
				<h1>Inscripción de Materias</h1>
			</div>
			<nav class="menu">
				<a href="DashboardEstudiante.jsp">Inicio</a> <a href="#">Materias</a>
				<a href="#">Tareas</a> <a href="#">Ver. Actividades</a>
				<a href="NotasEstudiante.jsp">Notas</a>
			</nav>
		</div>
		<div class="out-header">
			<br>
			<h2>> Materias para inscribir</h2>
			<div class="tabla">
				<table  id="tablaMateriasAIscribir">
					<thead>
						<th>CÓDIGO MATERIA</th>
						<th>NOMBRE MATERIA</th>
					</thead>					
				</table>
			</div>
			<br>
			<h2>> Materias Seleccionadas</h2>
			<div class="tabla">
				<table  id="tablaMateriasSeleccionadas">
					<thead>
						<th>CÓDIGO MATERIA</th>
						<th>NOMBRE MATERIA</th>
					</thead>
					<tr>
					<td>0001</td>
					<td>Pruebaa</td>
					</tr>
					
				</table>
			</div>
		</div>
	</header>
</body>
</html>