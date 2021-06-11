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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script type="text/javascript">
	//jQuery que nos devuelve el arreglo de la etiqueta select
	$(document).ready(function () {
		$.post('ControllerVerActividades', {
		}, function (response) {

			//Consumir el API rest que nos envio el server.
			let datos = JSON.parse(response);
			console.log(datos);

			var tabla = document.getElementById('tablaVerActividades');
			for(let iterar of datos){

				if(iterar.Archivo == null || iterar.Archivo == ""){
					iterar.Archivo = "DontFiles/nofiles.jsp";
				}

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

	//jQuery para seleccionar los datos de la fila que queramos.
	$(document).on("click", "#tablaVerActividades tr", function () {
		// variables recolectoras
		var idAct, idstudent, materia, actividad, pocent, notaObte, Estado;

		// Les asignamos los datos que recogimos de la tabla 
		idAct = $(this).find('td:first-child').html();
		idstudent = $(this).find('td:nth-child(2)').html();
		materia = $(this).find('td:nth-child(3)').html();
		actividad = $(this).find('td:nth-child(4)').html();
		pocent = $(this).find('td:nth-child(5)').html();
		notaObte = $(this).find('td:nth-child(6)').html();
		Estado = $(this).find('td:nth-child(7)').html();

		if(Estado == "Calificada"){
			swal('¡Ya ha sido calificada, nota: '+notaObte+'!','No puedes modificar más tú tarea', 'error');
		}
		else{
			swal({
			title: "¡Atención!",
			text: "¿Desea modificar la tarea?",
			icon: "warning",
			buttons: true,
			dangerMode: true,
			})
			.then((willDelete) => {
			if (willDelete) {
				document.getElementById('idactividad').value = idAct;
				document.getElementById('idestudiante').value = idstudent;
				document.getElementById('idestadoactividad').value = Estado;

				document.getElementById('Activ').innerText = actividad;
				document.getElementById('Mater').innerText = materia;
			} else {
				swal("¡No se editará nada!");
				Limpiar();
			}
			});
		}
	});

	function fileValidation(){
		var fileInput = document.getElementById('file');
		var filePath = fileInput.value;
		var allowedExtensions = /(.pdf)$/i;
		if(!allowedExtensions.exec(filePath)){
			swal('¡Esta extensión es inválida!','Solo permitimos el envío de documentos PDF', 'error');
			fileInput.value = '';
			return false;
		}
		else{
			swal('¡DOCUMENTO VÁLIDO!','', 'success');
		}
	}

	function Limpiar(){
		document.getElementById('Activ').innerText = '';
		document.getElementById('Mater').innerText = '';

		$("#idactividad").val('');
		$("#idestudiante").val('');
		$("#idestadoactividad").val('');
	}
	</script>
	<body>
	<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboardEst"));
	String fullname = String.valueOf(sesion.getAttribute("fullnameEst"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
}
%>
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
					<input type="file" name="archivoAgain" class="controls" id="file" onchange="return fileValidation()" accept="application/pdf" required>
					<br>
					<div class="botonesss">
						<button class="btnLimpio" onclick="Limpiar();">LIMPIAR <i class="fa fa-backspace"></i></button>
						<button name="btnSendAgain" value="SendAgain" class="btnVolverEntregar" onclick="comprobar();"><i class="fa fa-paper-plane"></i> VOLVER A ENTREGAR</button>
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
					<tbody id="tablaVerActividades">
						
					</tbody>					
				</table>
			</div>
		</div>
		<br>
	</body>
	</html>