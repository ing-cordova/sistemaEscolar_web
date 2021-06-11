<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<meta charset="utf-8">
		<title>Calificaciones | Docente</title>
		<link rel="icon" href="Imagenes/school.ico">
		<link rel="stylesheet" href="Styles/style_publicarnotas.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>
	</head>

	<body>
		<% HttpSession sesion=(HttpSession) request.getSession(); String
			usuSession=String.valueOf(sesion.getAttribute("dashboardDoc")); String
			fullname=String.valueOf(sesion.getAttribute("fullnameDoc")); if (usuSession.equals(null) ||
			usuSession.equals("null")) { response.sendRedirect("index.jsp"); } %>
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

				//AJAX que envía el idMateria, y retorna la tabla con los datos. Todo
				//esto de forma asíncrona al servidor.

				function MostrarInformacion() {

					LimpiarTabla();
					//LimpiarComponentes();

					$(document).ready(function () {
						//id del botón MostrarDatos
						//Recogiendo el value del combo
						var comboID = $("#TipoSelect").val();

						if(comboID == 0 || comboID ==  null || comboID == ""){
							swal('¡Seleccione una materia para comenzar!', '', 'warning');
						}
						else{
							$.post('ControllerSendAndShow_GradesTeacher', {
								//Enviando variable al controlador.
								comboID
							}, function (response) {

								let datos = JSON.parse(response);
								console.log(datos);

								//validar();

								var tabla = document.getElementById('tablaNotasxMateria');
								for (let iterar of datos) {
									tabla.innerHTML +=
										`
								<tr>
								<td>${iterar.idNota}</td>
								<td style="display:none;">${iterar.idEstudiante}</td>
								<td>${iterar.Correo_Electronico}</td>
								<td>${iterar.Periodo1}</td>
								<td>${iterar.Periodo2}</td>
								<td>${iterar.Periodo3}</td>
								<td>${iterar.NotaFinal}</td>
								<td>${iterar.Recuperacion}</td>
								</tr>
								`
								}
							});
						}
					});
				}

				//Función que limpiará la tabla
				function LimpiarTabla() {
					$("#tablaNotasxMateria tr").remove();
				}

				function LimpiarComponentes(){
					$("#NidNota").val('');
					$("#Ncorreo1").val('');
					document.getElementById('Ncorreo1').innerText = '';
					$("#NidEstudiante").val('');
					$("#Np1").val('');
					$("#Np2").val('');
					$("#Np3").val('');
					$("#Npfinal").val('');
					$("#NpRepo").val('');
				}


				//Jquery que cargará los datos que seleccionemos en la tabla 1 a los input
				$(document).on("click", "#tablaNotasxMateria tr", function () {
					var idnota, idstudent, correo, p1, p2, p3, pfinal, repo;

					idnota = $(this).find('td:first-child').html();
					idstudent = $(this).find('td:nth-child(2)').html();
					correo = $(this).find('td:nth-child(3)').html();
					p1 = $(this).find('td:nth-child(4)').html();
					p2 = $(this).find('td:nth-child(5)').html();
					p3 = $(this).find('td:nth-child(6)').html();
					pfinal = $(this).find('td:nth-child(7)').html();
					repo = $(this).find('td:nth-child(8)').html();

					document.getElementById('NidNota').value = idnota;
					document.getElementById('NidEstudiante').value = idstudent;
					document.getElementById('Ncorreo1').innerText = correo;

					document.getElementById('Ncorreo').value = correo;
					document.getElementById('Np1').value = (p1 / 0.33).toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
					document.getElementById('Np2').value = (p2 / 0.33).toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
					document.getElementById('Np3').value = (p3 / 0.33).toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
					document.getElementById('Npfinal').value = pfinal;
					document.getElementById('NpRepo').value = repo;
				});

				$(document).ready(function () {

					$("#EnvioGet").click(function () {

						var idNotaaa = $("#NidNota").val();
						var correoo = $("#Ncorreo1").val();
						var idEstudianteeee = $("#NidEstudiante").val();
						var p1 = $("#Np1").val();
						var p2 = $("#Np2").val();
						var p3 = $("#Np3").val();
						var pfinal = $("#Npfinal").val();
						var pRepo = $("#NpRepo").val();

						if(idNotaaa == null || idNotaaa == ""){
							swal('Seleccione una materia y un estudiante!', '', 'warning');
						}
						else{
							if(p1 ==  null || p1 == "" || p2 ==  null || p2 == "" || p3 ==  null || p3 == ""){
								swal('No se permiten campos vacíos!', '', 'warning');
							}
							else{
								if(p1 > 10 || p2 > 10 || p3 > 10){
									swal('No se permiten notas mayores a 10.0!', '', 'error');
								}
								else{
									$.get('ControllerPublicarNotas', {
										idNotaaa, correoo, idEstudianteeee, p1, p2, p3, pfinal, pRepo
								
									}, function (response) {
									
									});
								}
							}
						}
					});
				});

				function checknumber(e) {
					tecla = (document.all) ? e.keyCode : e.which;

					//Tecla de retroceso para borrar, siempre la permite
					if (tecla == 8) {
						return true;
					}

					// Patron de entrada, en este caso solo acepta números y punto
					patron = /[0-9.]/;
					tecla_final = String.fromCharCode(tecla);
					return patron.test(tecla_final);
				}

				$(function(){
					$('#Np1').keypress(function(e) {
					if(isNaN(this.value + String.fromCharCode(e.charCode))) 
						return false;
					}).on("cut copy paste",function(e){
						e.preventDefault();
					});
				});

				$(function(){
					$('#Np2').keypress(function(e) {
					if(isNaN(this.value + String.fromCharCode(e.charCode))) 
						return false;
					}).on("cut copy paste",function(e){
						e.preventDefault();
					});
				});

				$(function(){
					$('#Np3').keypress(function(e) {
					if(isNaN(this.value + String.fromCharCode(e.charCode))) 
						return false;
					}).on("cut copy paste",function(e){
						e.preventDefault();
					});
				});
			</script>
			<header class="header">
				<div class="container">
					<div class="btn-menu">
						<img alt="" src="Imagenes/school.ico">
					</div>
					<div class="logo">
						<h1>Publicación de Calificaciones</h1>
					</div>
					<nav class="menu">
						<a href="DashboardDocente.jsp">Inicio</a> <a href="RegistroMateriasDocente.jsp">Materias</a>
						<a href="ActividadesDocente.jsp">Actividades</a> <a href="#">Notas</a>
						<a href="RevisarActividadesEstudiante.jsp">Revisar Acts</a>
					</nav>
				</div>
			</header>
			<div class="out-header">
				<!--Formulario que envía únicamente el id de la materia seleccionada-->
				<div class="componentes">
					<label>Materia:</label>
					<br>
					<select class="controls" name="idmateria" id="TipoSelect" required>
						<option value="" selected>Seleccione...</option>
					</select>
					<!-- <input type="submit" name="enviaridMateria" class="btnEnviarID" value="Mostrar notas"> -->
					<button class="btnEnviarID" id="idMat" onclick="MostrarInformacion();">Mostrar notas</button>
				</div>

				<!--Formulario que envía los datos para ser actualizados.-->
				<!-- <form action="ControllerPublicarNotas" method="get"> -->
				<div class="componentes">
					<label>E-mail:</label>
					<label for="correoo" id="Ncorreo1"></label>
					<br>
					<br>
					<input type="hidden" name="correoo" id="Ncorreo">
					<input type="hidden" name="idNotaaa" id="NidNota">
					<input type="hidden" name="idEstudianteeee" id="NidEstudiante">
					<label>Periodo 1</label>
					<input type="number" name="p1" class="controls2" id="Np1" maxlength="5" onkeypress="return checknumber(event)" min="0" max="10">
					<label>Periodo 2</label>
					<input type="number" name="p2" class="controls2" id="Np2" maxlength="5" onkeypress="return checknumber(event)" min="0" max="10">
					<label>Periodo 3</label>
					<input type="number" name="p3" class="controls2" id="Np3" maxlength="5" onkeypress="return checknumber(event)" min="0" max="10">
					<label>Final</label>
					<input type="text" name="pfinal" class="controls2" id="Npfinal" readonly>
					<label>Reposición</label>
					<input type="text" name="pRepo" class="controls2" id="NpRepo" readonly>
					<br>
					<div class="btEnvDa">
						<!-- <input type="submit" name="" class="btnEnviarNotas" value="Publicar notas"> -->
						<button class="btnLimpio" onclick="LimpiarComponentes()();">LIMPIAR</button>
						<button id="EnvioGet" class="btnEnviarNotas" onclick="MostrarInformacion();">Publicar notas</button>
					</div>
				</div>
				<!-- </form> -->
			</div>
			<div class="tabla">
				<table>
					<thead>
						<th>ID_NOTA</th>
						<th>E-MAIL</th>
						<th>P1</th>
						<th>P2</th>
						<th>P3</th>
						<th>FINAL</th>
						<th>REPO</th>
					</thead>
					<tbody id="tablaNotasxMateria">
						<!-- DATOS SOLO DE PRUEBA, ELIMINAR CUANDO YA SE TRAIGAN DATOS REALES -->

					</tbody>
				</table>
			</div>
	</body>

	</html>