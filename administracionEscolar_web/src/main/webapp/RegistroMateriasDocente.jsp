<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<meta charset="utf-8">
		<title>Materias | Docente</title>
		<link rel="icon" href="Imagenes/school.ico">
		<link rel="stylesheet" href="Styles/style_registromateriasDoc.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
			integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>

	<body>
		<% HttpSession sesion=(HttpSession) request.getSession(); String
			usuSession=String.valueOf(sesion.getAttribute("dashboardDoc")); String
			fullname=String.valueOf(sesion.getAttribute("fullnameDoc")); if (usuSession.equals(null) ||
			usuSession.equals("null")) { response.sendRedirect("index.jsp"); } %>
			<script type="text/javascript">

				//JQuery que nos devuelve todos las materias por GradoAcdemico especifico.
				$(document).ready(function () {
					$.post('ControllerRegistroMateriasDocente', {}, function (response) {
						let datos = JSON.parse(response);
						console.log(datos);

						var tabla = document.getElementById('tablaMateriasAIscribir');
						for (let item of datos) {
							//innerando tabla.
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
				
			</script>
			<header class="header">
				<div class="container">
					<div class="btn-menu">
						<img alt="" src="Imagenes/school.ico">
					</div>
					<div class="logo">
						<h1>Inscripción de Materias</h1>
					</div>
					<nav class="menu">
						<a href="DashboardDocente.jsp">Inicio</a> <a href="#">Materias</a>
						<a href="ActividadesDocente.jsp">Actividades</a> <a href="PublicarNotas.jsp">Notas</a>
						<a href="RevisarActividadesEstudiante.jsp">Revisar Acts.</a>
					</nav>
				</div>
			</header>
			<div class="out-header">
				<br>
				<h2>> Materias para inscribir</h2>
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
				<form action="ControllerRegistroMateriasDocente" method="get">
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
					<input type="submit" value="¡Estoy listo para inscribir!" class="btnEnviarDatos">
					<br>
				</form>
			</div>
			<br>

	</body>

	</html>