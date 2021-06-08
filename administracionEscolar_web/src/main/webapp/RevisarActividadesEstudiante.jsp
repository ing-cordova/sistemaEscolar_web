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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		//Función de jQuery que nos devuelve el arreglo de la etiqueta select
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
		//Función de jQuery que envía el idMateria el servidor por método get
		//y nos devuelve el arreglo mediante el response.
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
		//Función de jQuery que nos ayuda para limpiar todos los elementos del
		//select TipoSelect2(Actividades por Materia).
		$(document).ready(function () {
			$("#TipoSelect").change(function (){
				$("#TipoSelect2 option").remove(); 

			});
		});

		//Función para limpiar todos los datos de la tabla.
		function LimpiarTabla(){			
			$("#tablaMostrarActividades tr").remove(); 
		}

		//Función para limpiar todos los controles.
		function LimpiarComponentes(){		

			$("#rvidActividadEstudiante").val('');
			$("#rvidEstudiante").val('');
			$("#rvPorcentaje").val('');
			$("#rvNotaObt").val('');
			document.getElementById('lblCorreo').innerText = '';
			document.getElementById('lblNombreActividad').innerText = '';
			document.getElementById('lblPorcentaje').innerText = '';
		}

		//Función para cargar los datos que vienen del response mediante las etiquetas
		//de tipo Select que envían idMateria y idActividad.
		function cargarDatosTabla(){

			LimpiarTabla();

			$(document).ready(function () {

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

						if(item.Archivo == null || item.Archivo == ""){
							item.Archivo = "nofiles.jsp";
						}

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
						<td style="text-align: center"><a href="FilesPDF/${item.Archivo}" class="btnAjuntar" target="_blank"><i class="fa fa-file-pdf"></i>  ABRIR PDF</a><a href="FilesPDF/${item.Archivo}" download="${item.Nombre_Actividad}-${item.Correo_Electronico}.pdf" class="btnDownload"><i class="fa fa-cloud-download-alt"></i></a></td>
						</tr>
						`
					}
				});
			});
		}
		
		//Jquery que cargará los datos que seleccionemos en la tabla 1 a los input
		$(document).on("click", "#tablaMostrarActividades tr", function () {
			var idactividadestudiante, idestudiante, email, nombreactividad, porcenteje, notaobtenida, estadoactividad;

			idactividadestudiante = $(this).find('td:first-child').html();
			idestudiante = $(this).find('td:nth-child(2)').html();
			email = $(this).find('td:nth-child(3)').html();
			nombreactividad = $(this).find('td:nth-child(4)').html();
			porcenteje = $(this).find('td:nth-child(5)').html();
			notaobtenida = $(this).find('td:nth-child(6)').html();
			estadoactividad = $(this).find('td:nth-child(7)').html();

			//Innerencia en los labels.
			document.getElementById('lblCorreo').innerText = email;
			document.getElementById('lblNombreActividad').innerText = nombreactividad;
			document.getElementById('lblPorcentaje').innerText = porcenteje;
			//Innerencia para los input type hidden.
			document.getElementById('rvidActividadEstudiante').value = idactividadestudiante;
			document.getElementById('rvidEstudiante').value = idestudiante;
			document.getElementById('rvPorcentaje').value = porcenteje;
		});

		function checknumber(e) {
			tecla = (document.all) ? e.keyCode : e.which;

			//Tecla de retroceso para borrar, siempre la permite
			if (tecla == 8) {
				return true;
			}

			// Patron de entrada, en este caso solo acepta números y guión medio
			patron = /[0-9.]/;
			tecla_final = String.fromCharCode(tecla);
			return patron.test(tecla_final);
		}

		$(function(){
			$('#rvNotaObt').keypress(function(e) {
			if(isNaN(this.value + String.fromCharCode(e.charCode))) 
				return false;
			}).on("cut copy paste",function(e){
				e.preventDefault();
			});
		});

		//Función por AJAX que nos permite envíar todos los datos hacia nuestro Back-end.
		$(document).ready(function () {
			$("#EnvioGET").click(function (){

				var ajaxIdActividadEstudiante = $("#rvidActividadEstudiante").val();
				var ajaxIdEstudiante = $("#rvidEstudiante").val();
				var ajaxPorcenteje = $("#rvPorcentaje").val();
				var ajaxNota = $("#rvNotaObt").val();

				if(ajaxIdActividadEstudiante ==  null || ajaxIdActividadEstudiante == ""){
					swal('¡Alerta!', 'Tiene que seleccionar una materia, actividad o estudiante para comenzar', 'warning');
				}
				else{
					if(ajaxNota == null || ajaxNota == ""){
						swal('¡No se permiten campos vacios!', '', 'warning');
					}
					else{
						if(ajaxNota > 10){
							swal('No se permiten notas mayores a 10.0!', '', 'error');
						}
						else{
							$.get('ControllerRevisarActividades', {
								ajaxIdActividadEstudiante, ajaxIdEstudiante, ajaxPorcenteje, ajaxNota
							}, function(response){
								let datos = JSON.parse(response);
								console.log(datos);
							});
						}
					}
				}	
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
			<button class="btnEnviarID" id="idMatAct" onclick="cargarDatosTabla();">> Mostrar actividades</button>

			<div class="componentes2">
				<label>E-mail:</label>
				<label id="lblCorreo"></label>
				<br>
				<label>Actividad:</label>
				<label id="lblNombreActividad"></label>
				<br>
				<label>Porcentaje:</label>
				<label id="lblPorcentaje"></label>
				<br>
				<input type="hidden" name="idActividadEstudiante" id="rvidActividadEstudiante">
				<input type="hidden" name="idEstudiante" id="rvidEstudiante">
				<input type="hidden" name="Porcentaje" id="rvPorcentaje">
				<label>NOTA OBTENIDA</label>
				<input type="number" name="rvNotaObtenida" class="controls2" id="rvNotaObt" maxlength="5" onkeypress="return checknumber(event)" min="0" max="10" required>
				<button id="EnvioGET" class="btnEnviarNotas" onclick="cargarDatosTabla();">Actualizar nota</button>
				<button class="btnLimpio" onclick="LimpiarComponentes();">Limpiar</button>
			</div>
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

			</tbody>					
		</table>
	</div>
</body>
</html>