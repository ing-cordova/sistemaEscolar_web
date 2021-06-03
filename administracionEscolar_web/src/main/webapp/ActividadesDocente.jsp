<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Actividades | Docente</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_actividadesdocente.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboardDoc"));
	String fullname = String.valueOf(sesion.getAttribute("fullnameDoc"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
}
%>
	<script type="text/javascript">
		$(document).ready(function() {
			$.post('ControllerActividadesDocente', {
			}, function(response){

				let datos = JSON.parse(response);
				console.log(datos);
				
				var tabla = document.getElementById('tablaActividades');
				for(let iterar of datos){

					tabla.innerHTML += `

					<tr>
					<td>${iterar.idActividad}</td>
					<td style="display:none;">${iterar.idMateria}</td>
					<td>${iterar.Nombre_Materia}</td>
					<td>${iterar.Nombre_Actividad}</td>
					<td>${iterar.Porcentaje}</td>
					<td>${iterar.Fecha_Entrega}</td>
					<td><a href="ControllerActividadesDocente?btne=Eliminar&IdAct=${iterar.idActividad}" class="btnAccionDelete"><i class="fa fa-trash-alt"></i></a>
					<a href="AddActividadesDocente.jsp?IdAct=${iterar.idActividad}&IdMat=${iterar.idMateria}&SubjectName=${iterar.Nombre_Materia}&ActivitieName=${iterar.Nombre_Actividad}&Porcent=${iterar.Porcentaje}&LimitDate=${iterar.Fecha_Entrega}" class="btnAccionUpdate"><i class="fa fa-marker"></i></a></td>
					</tr>

					`
				}
			});
		});
	</script>
	<header class="header">
		<div class="container">
			<div class="btn-menu">
				<img alt="" src="Imagenes/school.ico">
			</div>
			<div class="logo">
				<h1>Publicar Actividades</h1>
			</div>
			<nav class="menu">
				<a href="DashboardDocente.jsp">Inicio</a> <a href="RegistroMateriasDocente.jsp">Materias</a>
				<a href="#">Actividades</a> <a href="PublicarNotas.jsp">Notas</a>
				<a href="RevisarActividadesEstudiante.jsp">Revisar Acts</a>
			</nav>
		</div>
	</header>
	<div class="out-header">
		<div class="tabla">
			<table>
				<thead>
					<th>CÓDIGO</th>
					<th>MATERIA</th>
					<th>ACTIVIDAD</th>
					<th>(%)</th>
					<th>FECHA LÍMITE</th>
					<th>ACCIONES</th>
				</thead>
				<tbody id="tablaActividades">

				</tbody>					
			</table>
		</div>
		<br>
		<a href="AddActividadesDocente.jsp" class="btnEnviarDatos">Agregar nuevo</a>
	</div>
	<br>
</body>
</html>