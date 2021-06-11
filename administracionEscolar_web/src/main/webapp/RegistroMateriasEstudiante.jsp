<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<meta charset="utf-8">
		<title>Materias | Estudiantes</title>
		<link rel="icon" href="Imagenes/school.ico">
		<link rel="stylesheet" href="Styles/style_registromateriasEst.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
			integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>
	</head>

	<body>
		<% HttpSession sesion=(HttpSession) request.getSession(); String
			usuSession=String.valueOf(sesion.getAttribute("dashboardEst")); String
			fullname=String.valueOf(sesion.getAttribute("fullnameEst")); if (usuSession.equals(null) ||
			usuSession.equals("null")) { response.sendRedirect("index.jsp"); } %>
			<script type="text/javascript">

				//JQuery que nos devuelve todos las materias por GradoAcdemico específico.
				$(document).ready(function () {
					$.post('ControllerRegistroMateriasEstudiante', {}, function (response) {
						let datos = JSON.parse(response);
						console.log(datos);

						var tabla = document.getElementById('tablaMateriasAIscribir');
						for (let item of datos) {
							tabla.innerHTML +=
								`
					<tr>
					<td>${item.idMateria}</td>
					<td>${item.Nombre_Materia}</td>
					</tr>
					`
						}
					});
				});

				//Jquery que cargará los datos que seleccionemos en la tabla 1 a tabla 2.
				$(document).on("click", "#tablaMateriasAIscribir tr", function () {
					var id, Materia;

					id = $(this).find('td:first-child').html();
					Materia = $(this).find('td:nth-child(2)').html();

					//Creando el botón de eliminar cada fila que se seleccione.
					var boton = "<button class='borrar' style='padding: 8px; color: #ffff; background: red; border-radius: 9px;'><i class='fas fa-trash-alt'></i> ELIMINAR</button>";
					//Pasando los datos de la tabla anterior a una fila en la nueva tabla.
					var fila = "<tr><td>" + id + "</td><input type = 'hidden' name = 'idMateria' value = " + id + "><td>" + Materia + "</td><td>" + boton + "</td></tr>";
					//Creando una nueva tableRow (tr) dentro de la tabla.
					var btn = document.createElement("TR");
					//Añadiendo los datos a la fila.
					btn.innerHTML = fila;

					//------------------------------------------------------------------------------------
					var countone = 1;
					var counttwo = 1;

					if ($('#tablaMateriasSeleccionadas tr').length > 0) {

						$('#tablaMateriasSeleccionadas tr').each(function () {

							$(this).find('td:first-child').each(function () {

								if (parseInt($(this).html()) == parseInt(id)) {
									countone++;
								}
								else {
									countone++;
									counttwo++;
								}
							});
						});

						if (countone == counttwo) {

							document.getElementById("tablaMateriasSeleccionadas").appendChild(btn);
						}
						else {
							swal('¡Ya ha seleccionado esta materia!', '', 'warning');
						}
					}
					else {

						document.getElementById("tablaMateriasSeleccionadas").appendChild(btn);
					}
				});

				//JQuery que nos permite eliminar la fila seleccionada.
				$(document).on('click', '.borrar', function (event) {
					event.preventDefault();
					$(this).closest('tr').remove();
				});

				//Función para buscar dentro de la tabla.
				function doSearch()
				{
					const tableReg = document.getElementById('tablaMateriasAIscribir');
					const searchText = document.getElementById('searchTerm').value.toLowerCase();
					let total = 0;
		
					// Recorremos todas las filas con contenido de la tabla
					for (let i = 0; i < tableReg.rows.length; i++) {
		
						let found = false;
						const cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
						// Recorremos todas las celdas
						for (let j = 0; j < cellsOfRow.length && !found; j++) {
							const compareWith = cellsOfRow[j].innerHTML.toLowerCase();
							// Buscamos el texto en el contenido de la celda
							if (searchText.length == 0 || compareWith.indexOf(searchText) > -1) {
								found = true;
								total++;
							}
						}
						if (found) {
							tableReg.rows[i].style.display = '';
						} else {
							// si no ha encontrado ninguna coincidencia, esconde la
							// fila de la tabla
							tableReg.rows[i].style.display = 'none';
						}
					}

					console.log(total);
				}

			</script>
			<header class="header">
				<div class="container">
					<div class="logo">
						<h1>Inscripción de Materias</h1>
					</div>
					<nav class="menu">
						<a href="DashboardEstudiante.jsp">Inicio</a> <a href="#">Materias</a>
						<a href="TareasEstudiante.jsp">Tareas</a> <a href="VerActividades.jsp">Ver. Actividades</a>
						<a href="NotasEstudiante.jsp">Notas</a>
					</nav>
				</div>
			</header>
			<div class="out-header">
				<br>
				<h2>> Materias para inscribir</h2>
				<input id="searchTerm" class="cajabusca" type="text" onkeyup="doSearch()" placeholder="Escribe aquí para buscar"/>
				<div class="tabla">
					<table>
						<thead>
							<th>CÓDIGO MATERIA</th>
							<th>NOMBRE MATERIA</th>
						</thead>
						<tbody id="tablaMateriasAIscribir">

						</tbody>
					</table>
				</div>
				<form action="ControllerRegistroMateriasEstudiante" method="get">
					<br>
					<h2>> Materias Seleccionadas</h2>
					<div class="tabla">
						<table class="tableFixed">
							<thead>
								<th>CÓDIGO MATERIA</th>
								<th>NOMBRE MATERIA</th>
								<th>ACCIÓN</th>
							</thead>
							<tbody id="tablaMateriasSeleccionadas">

							</tbody>
						</table>
					</div>
					<br>
					<input type="submit" value="¡Estoy listo para inscribir!" class="btnEnviarDatos" id="enviar">
					<br>
			</div>
			<br>
	</body>

	</html>