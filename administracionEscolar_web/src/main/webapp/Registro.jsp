<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<meta charset="utf-8">
		<link rel="icon" href="Imagenes/school.ico">
		<title>Formulario de Registro</title>
		<link rel="stylesheet" href="Styles/style_registro.css">
		<script src="https://kit.fontawesome.com/dab6165ace.js" crossorigin="anonymous"></script>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>

	<body>
		<script type="text/javascript">
			$(document).ready(function () {
				$.post('ControllerGradoAcademico', {
				}, function (response) {
					let datos = JSON.parse(response);
					console.log(datos);

					var tabla = document.getElementById('TipoSeleccionGrados');
					for (let item of datos) {
						tabla.innerHTML +=
							`
					<option value="${item.idGradoAcademico}">${item.Nombre_GradoAcad}</option>
					`
					}
				});
			});

			$(document).ready(function () {
				$("#EnviarInfo").click(function () {

					var nombres = $("#nombres").val();
					var nombres2 = nombres.replace(/\s+/g, " ").trim();

					var apellidos = $("#apellidos").val();
					var apellidos2 = apellidos.replace(/\s+/g, " ").trim();

					var sexo = $("#sexo").val();
					var carreras = $("#TipoSeleccionGrados").val();

					var birthdate = $("#birthdate").val();

					var dui = $("#dui").val();
					var dui2 = dui.replace(/\s+/g, " ").trim();

					var nit = $("#nit").val();
					var nit2 = nit.replace(/\s+/g, " ").trim();

					var email = $("#email").val();
					var email2 = email.replace(/\s+/g, " ").trim();

					var pass = $("#pass").val();
					var pass2 = pass.replace(/\s+/g, " ").trim();

					if (nombres2 == "" || nombres2 == null || apellidos2 == "" || apellidos2 == null ||
						sexo == 0 || sexo == "" || sexo == null || carreras == 0 || carreras == "" || carreras == null ||
						birthdate == null || birthdate == "" || dui2 == "" || dui2 == null || nit2 == "" || nit2 == null ||
						email2 == "" || email2 == null || pass2 == "" || pass2 == null) {
						swal('¡Por favor llene todos los campos!', 'Esto puede deberse a los campos que contengan espacios, por favor reviselos.', 'warning');
					}
					else if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(email2)) {
						$.get('ControllerRegistroEstudiante', {
							nombres2, apellidos2, sexo, carreras, birthdate, dui2, nit2, email2, pass2
						}, function (response) {

							let datos = JSON.parse(response);

							if (datos == "Registrado") {
								swal('¡Estudiante registrado con éxito!', '', 'success');
								setTimeout("location.href='index.jsp'", 1000);
							}
							else if (datos == "Error") {
								swal('¡Ha ocurrido un error!', '', 'error');
							}
						});
					}
					else {
						swal('¡Correo electrónico inválido!', 'Por favor verifique que el correo esté escrito correctamente', 'error');
					}
				});
			});

			//Función de Javascript que nos válida el ingreso de solo letras
			function check(e) {
				tecla = (document.all) ? e.keyCode : e.which;

				//Tecla de retroceso para borrar, siempre la permite
				if (tecla == 8) {
					return true;
				}

				// Patron de entrada, en este caso solo acepta letras, ñ y tildes.
				patron = /[A-Za-z\u00F1\u00D1\u00B4\u00C1\u00E1\u00E9\u00ED\u00F3\u00FA\u0020]/;
				tecla_final = String.fromCharCode(tecla);
				return patron.test(tecla_final);
			}

			//Función de Javascript que nos válida el ingreso de solo números
			function checknumber(e) {
				tecla = (document.all) ? e.keyCode : e.which;

				//Tecla de retroceso para borrar, siempre la permite
				if (tecla == 8) {
					return true;
				}

				// Patron de entrada, en este caso solo acepta números y guión medio
				patron = /[0-9-]/;
				tecla_final = String.fromCharCode(tecla);
				return patron.test(tecla_final);
			}

			//Jquery que nos valida el NO copiado ni pegado de un texto
			$(document).ready(function () {
				$("#nombres").on('paste', function (e) {
					e.preventDefault();
					swal('¡Acción Pegar está prohibida!', '', 'error');
				})

				$("#nombres").on('copy', function (e) {
					e.preventDefault();
					swal('¡Acción Copiar está prohibida!', '', 'error');
				})

				$("#apellidos").on('paste', function (e) {
					e.preventDefault();
					swal('¡Acción Pegar está prohibida!', '', 'error');
				})

				$("#apellidos").on('copy', function (e) {
					e.preventDefault();
					swal('¡Acción Copiar está prohibida!', '', 'error');
				})

				$("#dui").on('paste', function (e) {
					e.preventDefault();
					swal('¡Acción Pegar está prohibida!', '', 'error');
				})

				$("#dui").on('copy', function (e) {
					e.preventDefault();
					swal('¡Acción Copiar está prohibida!', '', 'error');
				})

				$("#nit").on('paste', function (e) {
					e.preventDefault();
					swal('¡Acción Pegar está prohibida!', '', 'error');
				})

				$("#nit").on('copy', function (e) {
					e.preventDefault();
					swal('¡Acción Copiar está prohibida!', '', 'error');
				})

				$("#pass").on('paste', function (e) {
					e.preventDefault();
					swal('¡Acción Pegar está prohibida!', '', 'error');
				})

				$("#pass").on('copy', function (e) {
					e.preventDefault();
					swal('¡Acción Copiar está prohibida!', '', 'error');
				})
			})

		</script>
		<section class="form-register">
			<h1>Formulario de Registro de Estudiantes</h1>
			<label>Nombres:</label>
			<br>
			<input class="controls" type="text" id="nombres" maxlength="100" onkeypress="return check(event)"
				placeholder="Julio David" required>
			<label>Apellidos:</label>
			<br>
			<input class="controls" type="text" id="apellidos" maxlength="100" onkeypress="return check(event)"
				placeholder="Julio David" placeholder="Lopez Mejia" required>
			<label>Sexo:</label>
			<br>
			<select class="controls" id="sexo" required>
				<option>Seleccione una opcion</option>
				<option>M</option>
				<option>F</option>
			</select>
			<!-- Aqui va el combobox de Sexo -->
			<label>Grado Académico:</label>
			<br>
			<select class="controls" name="carreras" id="TipoSeleccionGrados" required>
				<option value="">Seleccione una opcion</option>
			</select>
			<label for="birthdate">Fecha de Nacimiento:</label>
			<br>
			<input class="controls" id="birthdate" type="date" placeholder="20XX-00-00" required>
			<label>DUI:</label>
			<br>
			<input class="controls" type="text" id="dui" maxlength="10" onkeypress="return checknumber(event)"
				placeholder="00000000-0" required>
			<label>NIT:</label>
			<br>
			<input class="controls" type="text" id="nit" maxlength="17" onkeypress="return checknumber(event)"
				placeholder="0000-000000-000-0" placeholder="0000-000000-000-0" required>
			<!-- Aqui va el combobox de GradoAcademico -->
			<label>E-mail:</label>
			<br>
			<input class="controls" type="email" id="email" placeholder="julio@unab.edu.sv" required>
			<label>Contraseña:</label>
			<br>
			<input class="controls" type="password" id="pass" placeholder="Contraseña" required>
			<!--<input class="boton" type="submit" onclick="EnviarDatos();" value="¡Registrar ahora!">-->
			<button class="boton" id="EnviarInfo">¡Registrar ahora!</button>
			<p>
				<a href="index.jsp">Ya tengo una cuenta...</a>
			</p>
		</section>
	</body>

	</html>