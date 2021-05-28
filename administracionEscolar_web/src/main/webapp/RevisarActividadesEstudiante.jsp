<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Revisar Actividades | Docente</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_revisaractividadesestudiante.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<script type="text/javascript">
		//jQuery que nos devuelve el arreglo de la etiqueta select
		$(document).ready(function () {
			$.post('ControllerPublicarNotas', {
			}, function (response) {
				
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

		$(document).ready(function () {
			$("#TipoSelect").change(function (){

				console.log("IdCombo1: " + $("#TipoSelect").val());
				var combo1 = $("#TipoSelect").val();

				$.post('ControllerRecibirCombo1Acts', {
					combo1
				}, function(response){

					let datos = JSON.parse(response);
					console.log(datos);

					var comboActividad = document.getElementById('TipoSelect2');
					for(let item of datos){
						comboActividad.innerHTML += 
						`
						<option value ="${item.idActividad}">${item.Nombre_Actividad}</option>
						`
					}
				});
			});
		});

		$(document).ready(function () {
			$("#TipoSelect").change(function (){
				$("#TipoSelect2 option").remove(); 

			});
		});

		$(document).ready(function () {
			$("#idMatAct").click(function (){

				console.log("IdCombo1: " + $("#TipoSelect").val());
				console.log("IdCombo2: " + $("#TipoSelect2").val());

				var combo1 = $("#TipoSelect").val();
				var combo2 = $("#TipoSelect2").val();

				$.post('ControllerRevisarActividades', {
					combo1, combo2
				}, function(response){

					let datos = JSON.parse(response);
					console.log(datos);

					var tabla = document.getElementById('tablaMostrarActividades');
					for(let item of datos){
						tabla.innerHTML += 
						`
							<tr>
								<td>${item.idActividadEstudiante}</td>
								<td style="display: none;">${item.idEstudiante}</td>
								<td>${item.Correo_Electronico}</td>
								<td>${item.Nombre_Actividad}</td>
								<td>${item.Porcentaje}</td>
								<td>${item.Nota_Obtenida}</td>
								<td>${item.Estado_Actividad}</td>
								<td style="text-align: center"><a href="FilesPDF/${item.Archivo}" class="btnAjuntar" target="_blank"><i class="fa fa-file-pdf"></i>  ABRIR PDF</a></td>
							</tr>
						`
					}
				});
			});
		});

		$(document).ready(function () {
			$("#EnvioGET").click(function (){

				var envio = "vengo de ajax por get :3";

				$.get('ControllerRevisarActividades', {
					envio
				}, function(response){

				
				});
			});
		});
	</script>
	<header class="header">
		<div class="container">
			<div class="logo">
				<h1>Revisar Actividades Estudiantes</h1>
			</div>
			<nav class="menu">
				<a href="DashboardDocente.jsp">Inicio</a> <a href="RegistroMateriasDocente.jsp">Materias</a>
				<a href="ActividadesDocente.jsp">Actividades</a> <a href="PublicarNotas.jsp">Notas</a>
				<a href="#">Revisar Acts</a>
			</nav>
		</div>
	</header>
	<div class="out-header">
		<!--Formulario que envía únicamente el id de la materia seleccionada-->
		<div class="componentes">
			<label>Materia:</label>
			<select class="controls" name="idmateria"  id="TipoSelect" required>
				<option value="" selected>Seleccione...</option>
			</select>
			<label>Actividad por materia:</label>
			<select class="controls" name="idactividad"  id="TipoSelect2" required>
				<option value="" selected>Seleccione...</option>
			</select>
			<!-- <input type="submit" name="enviaridMateria" class="btnEnviarID" value="Mostrar notas"> -->
			<button class="btnEnviarID" id="idMatAct">> Mostrar actividades</button>
		</div>
	</div>
	<div class="tabla">
		<table>
			<thead>
				<th>CÓDIGO</th>
				<th>E-MAIL</th>
				<th>ACTIVIDAD</th>
				<th>(%)</th>
				<th>NOTA</th>
				<th>ESTADO</th>
				<th style="text-align: center">ARCHIVO</th>
			</thead>
			<tbody id="tablaMostrarActividades">
				<!-- DATOS SOLO DE PRUEBA, ELIMINAR CUANDO YA SE TRAIGAN DATOS REALES -->

			</tbody>					
		</table>
	</div>

	<button id="EnvioGET">enviar por get AJAX</button>
</body>
</html>