<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Asignaciones | Estudiantes</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_tareasestudiante.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboardEst"));
	String fullname = String.valueOf(sesion.getAttribute("fullnameEst"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
}
%>
	<script type="text/javascript">
		//jQuery que nos devuelve el arreglo de la etiqueta select
		$(document).ready(function () {
			$.post('ControllerMateriasEstudiante', {
			}, function (response) {
				
				//Consumiendo API rest (json) enviada por el server.
				let datos = JSON.parse(response);
				console.log(datos);
				
				var combo = document.getElementById('TipoSelect');
				for (let item of datos) {
					combo.innerHTML +=
					`
					<option value ="${item.idMateria}">${item.Nombre_Materia}</option>
					
					`
				}
			});
		});

		//AJAX que envía el idMateria, y retorna la tabla con los datos. Todo
		//esto de forma asíncrona al servidor.
		$(document).ready(function () {
			//id del botón MostrarDatos
			$("#idMat").click(function (){
				
				//Recogiendo el value del combo
				var comboID = $("#TipoSelect").val();

				if(comboID == 0 || comboID == null || comboID == ""){
					swal('¡Seleccione una materia para comenzar!', '', 'warning');
				}
				else{
					$.post('ControllerSendAndShow_AssignmentsStudents', {
						//Enviando variable al controlador.
						comboID
					}, function (response) {
						
						//Consumiendo API rest (json) enviada por el server.
						let datos = JSON.parse(response);
						console.log(datos);
						console.log("idMateria: " + comboID);

						var tabla = document.getElementById('tablaActividades');
						for(let iterar of datos){
							tabla.innerHTML += 
							`
							<tr>
							<td>${iterar.idActividad}</td>
							<td>${iterar.Nombre_Actividad}</td>
							<td>${iterar.Porcentaje}</td>
							<td>${iterar.Fecha_Entrega}</td>
							<td>${iterar.Estado_Actividad}</td>
							<td><a href="AddAtachement.jsp?IdActi=${iterar.idActividad}&NombreActi=${iterar.Nombre_Actividad}&Porcent=${iterar.Porcentaje}&FechaEntrega=${iterar.Fecha_Entrega}&EstadoActiv=${iterar.Estado_Actividad}&idMateeee=${comboID}" class="btnAjuntar">AJUNTAR +</a>
							</td>
							</tr>
							`
						}
					});
				}
			});
		});

		//Función que limpiará la tabla
		function LimpiarTabla(){			
			$("#tablaActividades tr").remove(); 
		}
	</script>
	<header class="header">
		<div class="container">
			<div class="logo">
				<h1>Actividades del Estudiante</h1>
			</div>
			<nav class="menu">
				<a href="DashboardEstudiante.jsp">Inicio</a> <a href="RegistroMateriasEstudiante.jsp">Materias</a>
				<a href="#">Tareas</a> <a href="VerActividades.jsp">Ver. Actividades</a>
				<a href="NotasEstudiante.jsp">Notas</a>
			</nav>
		</div>
	</header>
	<div class="out-header">
		<div class="componentes">
			<label>> Seleccione una materia para visualizar las tareas.</label>
			<br>
			<select class="controls" name="idmateria"  id="TipoSelect" required>
				<option value="" selected>Seleccione...</option>
			</select>
			<button class="btnEnviarID" id="idMat" onclick="LimpiarTabla();">> Mostrar Actividades</button>
		</div>

		<div class="tabla">
			<table>
				<thead>
					<th>CÓDIGO</th>
					<th>ACTIVIDAD</th>
					<th>PORCENTAJE</th>
					<th>FECHA LÍMITE</th>
					<th>ESTADO</th>
					<th>ACCIÓN</th>
				</thead>
				<tbody id="tablaActividades" onclick="CargarDatos();">
					
				</tbody>					
			</table>
		</div>
	</div>
	<br>
</body>
</html>