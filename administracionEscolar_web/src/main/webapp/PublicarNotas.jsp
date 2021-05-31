<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Calificaciones | Docente</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_publicarnotas.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
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

		//AJAX que envía el idMateria, y retorna la tabla con los datos. Todo
		//esto de forma asíncrona al servidor.
		$(document).ready(function () {
			//id del botón MostrarDatos
			$("#idMat").click(function (){
				
				//Recogiendo el value del combo
				var comboID = $("#TipoSelect").val();
				
				$.post('ControllerSendAndShow_GradesTeacher', {
					//Enviando variable al controlador.
					comboID
				}, function (response) {
					
					let datos = JSON.parse(response);
					console.log(datos);

					//validar();
					
					var tabla = document.getElementById('tablaNotasxMateria');
					for(let iterar of datos){
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
			var idnota, idstudent, correo, p1, p2, p3, pfinal, repo;
			
			var tabla = document.getElementById('tablaNotasxMateria');
			
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
							idnota = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 2){
							idstudent = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 3){
							correo = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 4){
							p1 = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 5){
							p2 = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 6){
							p3 = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 7){
							pfinal = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 8){
							repo = selectedRow[j].innerText;
							contador++;
						}
					}

					if(idnota > 0){
						console.log(idnota);
						console.log(idstudent);
						console.log(correo);
						console.log(p1);
						console.log(p2);
						console.log(p3);
						console.log(pfinal);
						console.log(repo);
						
						document.getElementById('NidNota').value = idnota;
						document.getElementById('NidEstudiante').value = idstudent;
						document.getElementById('Ncorreo1').innerText = correo;

						document.getElementById('Ncorreo').value = correo;
						document.getElementById('Np1').value = (p1/0.33).toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
						document.getElementById('Np2').value = (p2/0.33).toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
						document.getElementById('Np3').value = (p3/0.33).toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
						document.getElementById('Npfinal').value = pfinal;
						document.getElementById('NpRepo').value = repo;
					}
				}
			}
		}
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
		<div class="out-header">
			<!--Formulario que envía únicamente el id de la materia seleccionada-->
			<div class="componentes">
				<label>Materia:</label>
				<br>
				<select class="controls" name="idmateria"  id="TipoSelect" required>
					<option value="" selected>Seleccione...</option>
				</select>
				<!-- <input type="submit" name="enviaridMateria" class="btnEnviarID" value="Mostrar notas"> -->
				<button class="btnEnviarID" id="idMat" onclick="LimpiarTabla();">Mostrar notas</button>
			</div>

			<!--Formulario que envía los datos para ser actualizados.-->
			<form action="ControllerPublicarNotas" method="get">
				<div class="componentes">
					<label>E-mail:</label>
					<label for="correoo" id="Ncorreo1"></label>
					<br>
					<br>
					<input type="hidden" name="correoo" id="Ncorreo">
					<input type="hidden" name="idNotaaa" id="NidNota">
					<input type="hidden" name="idEstudianteeee" id="NidEstudiante">
					<label>Periodo 1</label>
					<input type="text" name="p1" class="controls2" id="Np1">
					<label>Periodo 2</label>
					<input type="text" name="p2" class="controls2" id="Np2">
					<label>Periodo 3</label>
					<input type="text" name="p3" class="controls2" id="Np3">
					<label>Final</label>
					<input type="text" name="pfinal" class="controls2" id="Npfinal" readonly>
					<label>Reposición</label>
					<input type="text" name="pRepo" class="controls2" id="NpRepo" readonly>
					<br>
					<div class="btEnvDa">
						<input type="submit" name="" class="btnEnviarNotas" value="Publicar notas">
					</div>
				</div>
			</form>
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
				<tbody id="tablaNotasxMateria" onclick="CargarDatos();">
					<!-- DATOS SOLO DE PRUEBA, ELIMINAR CUANDO YA SE TRAIGAN DATOS REALES -->
					
				</tbody>					
			</table>
		</div>
	</header>
</body>
</html>