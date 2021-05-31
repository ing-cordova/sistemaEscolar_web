<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Ver Actividades | Estudiantes</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_veractividades.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<script type="text/javascript">
	//jQuery que nos devuelve el arreglo de la etiqueta select
	$(document).ready(function () {
		$.post('ControllerVerActividades', {
		}, function (response) {

			let datos = JSON.parse(response);
			console.log(datos);

			var tabla = document.getElementById('tablaVerActividades');
			for(let iterar of datos){
				tabla.innerHTML += 
				`
				<tr>
				<td>${iterar.idActividadEstudiante}</td>
				<td style="display: none;">${iterar.idEstudiante}</td>
				<td>${iterar.Nombre_Materia}</td>
				<td>${iterar.Nombre_Actividad}</td>
				<td>${iterar.Porcentaje}</td>
				<td>${iterar.Nota_Obtenida}</td>
				<td>${iterar.Estado_Actividad}</td>
				<td style="text-align: center"><a href="FilesPDF/${iterar.Archivo}" class="btnAjuntar" target="_blank"><i class="fa fa-file-pdf"></i> VER PDF</a>
				<a href="ControllerEditarAnularTarea?btne=Anular&vaIdActividad=${iterar.idActividadEstudiante}&vaIdEstudiante=${iterar.idEstudiante}&vaEstadoActividad=${iterar.Estado_Actividad}" class="btnEliminar"><i class="fa fa-ban"></i> ¡ANULAR!</a></td>
				</tr>
				`
			}
		});
	});

	//Función que limpiará la tabla
	function LimpiarTabla(){			
		$("#tablaNotasxMateria tr").remove(); 
	}

		//Función que cargará los datos que seleccionemos en la tabla 1.
		function CargarDatos(){

			//Declaración de variables recolectoras.
			var RowIdx;
			var idAct, idstudent, materia, actividad, pocent, notaObte, Estado;
			
			var tabla = document.getElementById('tablaVerActividades');
			
			var rows = tabla.getElementsByTagName('tr');
			var selectedRow;
			var rowCellValue;

			//Ciclo de iteración de datos recogidos.
			for(i = 0; i < rows.length ; i++){
				rows[i].onclick = function(){
					RowIdx = this.rowIndex;
					selectedRow = this.cells;
					var contador = 1;
					for(j = 0; j < selectedRow.length; j++){
						if(contador == 1){
							idAct = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 2){
							idstudent = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 3){
							materia = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 4){
							actividad = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 5){
							pocent = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 6){
							notaObte = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 7){
							Estado = selectedRow[j].innerText;
							contador++;
						}
					}

					if(idAct > 0){
						console.log(idAct);
						console.log(idstudent);
						console.log(materia);
						console.log(actividad);
						console.log(pocent);
						console.log(notaObte);
						console.log(Estado);

						document.getElementById('idactividad').value = idAct;
						document.getElementById('idestudiante').value = idstudent;
						document.getElementById('idestadoactividad').value = Estado;

						document.getElementById('Activ').innerText = actividad;
						document.getElementById('Mater').innerText = materia;
					}
				}
			}
		}
	</script>
	<body>
		<header class="header">
			<div class="container">
				<div class="logo">
					<h1>Mis asignaciones enviadas</h1>
				</div>
				<nav class="menu">
					<a href="DashboardEstudiante.jsp">Inicio</a> <a href="RegistroMateriasEstudiante.jsp">Materias</a>
					<a href="TareasEstudiante.jsp">Tareas</a> <a href="#">Ver. Actividades</a>
					<a href="NotasEstudiante.jsp">Notas</a>
				</nav>
			</div>
		</header>
		<div class="out-header">
			<br>
			<form action="ControllerEditarAnularTarea" method="post" enctype="multipart/form-data">
				<div class="componentes">
					<!--Inputs que están para envíar datos al servidor sin que lo vea el cliente.-->
					<input type="hidden" name="vaIdActividad" id="idactividad">
					<input type="hidden" name="vaIdEstudiante" id="idestudiante">
					<input type="hidden" name="vaEstadoAct" id="idestadoactividad">

					<label>> Nombre de la Actividad:</label>
					<label id="Activ"></label>
					<br>
					<label>> Materia:</label>
					<label id="Mater"></label>
					<br>
					<label>> Archivo (Solo se permiten pdf):</label>
					<br>
					<br>
					<input type="file" name="archivoAgain" class="controls" accept="application/pdf" required>
					<br>
					<div class="botonesss">				
						<button name="btnSendAgain" value="SendAgain" class="btnVolverEntregar"><i class="fa fa-paper-plane"></i> VOLVER A ENTREGAR</button>
					</div>
				</div>
			</form>
			<br>
			<div class="tabla">
				<table>
					<thead>
						<th>CÓDIGO</th>
						<th>MATERIA</th>
						<th>ACTIVIDAD</th>
						<th>(%)</th>
						<th>NOTA</th>
						<th>ESTADO</th>
						<th style="text-align: center">ACCIONES</th>
					</thead>
					<tbody id="tablaVerActividades" onclick="CargarDatos();">
						
					</tbody>					
				</table>
			</div>
		</div>
		<br>
	</body>
	</html>