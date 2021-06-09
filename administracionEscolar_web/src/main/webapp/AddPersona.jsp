<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<meta charset="utf-8">
		<link rel="icon" href="Imagenes/school.ico">
		<title>Nueva Persona</title>
		<link rel="stylesheet" href="Styles/style_addPersona.css">
		<script src="https://kit.fontawesome.com/dab6165ace.js" crossorigin="anonymous"></script>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>

	<body>
		<% HttpSession sesion=(HttpSession) request.getSession(); String
					usuSession=String.valueOf(sesion.getAttribute("dashboard")); String
					fullname=String.valueOf(sesion.getAttribute("fullname")); if (usuSession.equals(null) ||
					usuSession.equals("null")) { response.sendRedirect("index.jsp"); } %>
					<% String Id=request.getParameter("Id"); String Persona=request.getParameter("Persona"); String
						Apellido=request.getParameter("Apellido"); String Sexo=request.getParameter("Sexo"); String
						DUI=request.getParameter("DUI"); String NIT=request.getParameter("NIT"); String
						Fecha_Nacimiento=request.getParameter("Fecha_Nacimiento"); System.out.println(Fecha_Nacimiento);
						if (Id==null) { Id="" ; Persona="" ; Apellido="" ; Sexo="Seleccione una Opcion" ; DUI="" ;
						NIT="" ; Fecha_Nacimiento="" ; } %>
		<script type="text/javascript">

			$(document).ready(function () {
				$("#Guardar").click(function (){
					var Guardar = $("#Guardar").val();

					var Id = $("#Id").val();

					var Persona = $("#Persona").val();
					var Persona2 = Persona.replace(/\s+/g, " ").trim();

					var Apellido = $("#Apellido").val();
					var Apellido2 = Apellido.replace(/\s+/g, " ").trim();

					var Sexo = $("#Sexo").val();

					var DUI = $("#DUI").val();
					var DUI2 = DUI.replace(/\s+/g, " ").trim();

					var NIT = $("#NIT").val();
					var NIT2 = NIT.replace(/\s+/g, " ").trim();

					var Fecha_Nacimiento = $("#Fecha_Nacimiento").val();

					if (Persona2 == "" || Persona2 == null || Apellido2 == "" || Apellido2 == null ||
						Sexo == 0 || Sexo == "Seleccione una Opcion" || Sexo == null || DUI2 == "" || DUI2 == null ||
						NIT2 == "" || NIT2 == null || Fecha_Nacimiento == "" || Fecha_Nacimiento == null) {
						swal('¡Por favor llene todos los campos!', 'Esto puede deberse a los campos que contengan espacios, por favor reviselos.', 'warning');
					}
					else{
						$.get('ControllerPersona', {
							Guardar, Id, Persona2, Apellido2, Sexo, DUI2, NIT2, Fecha_Nacimiento
						}, function(response){
							let mensaje = JSON.parse(response);

							if (mensaje == "Registrado") {
								swal({
									title: "¡Persona guardada con éxito!",
									text: "",
									icon: "success",
									timer: 3000,
								}).then(() => {
										location.href = 'http://localhost:8080/administracionEscolar_web/Persona.jsp';
								})
							}
							else if (mensaje == "Actualizado") {
								swal({
									title: "¡Persona actualizada con éxito!",
									text: "",
									icon: "success",
									timer: 3000,
								})
									.then(() => {
										location.href = 'http://localhost:8080/administracionEscolar_web/Persona.jsp';
									})
							}
						});
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

		$(document).ready(function (){
			$("#Persona").on('paste', function (e) {
				e.preventDefault();
				swal('¡Acción Pegar está prohibida!', '', 'error');
			})

			$("#Persona").on('copy', function (e) {
				e.preventDefault();
				swal('¡Acción Copiar está prohibida!', '', 'error');
			})

			$("#Apellido").on('paste', function (e) {
				e.preventDefault();
				swal('¡Acción Pegar está prohibida!', '', 'error');
			})

			$("#Apellido").on('copy', function (e) {
				e.preventDefault();
				swal('¡Acción Copiar está prohibida!', '', 'error');
			})

			$("#DUI").on('paste', function (e) {
				e.preventDefault();
				swal('¡Acción Pegar está prohibida!', '', 'error');
			})

			$("#DUI").on('copy', function (e) {
				e.preventDefault();
				swal('¡Acción Copiar está prohibida!', '', 'error');
			})

			$("#NIT").on('paste', function (e) {
				e.preventDefault();
				swal('¡Acción Pegar está prohibida!', '', 'error');
			})

			$("#NIT").on('copy', function (e) {
				e.preventDefault();
				swal('¡Acción Copiar está prohibida!', '', 'error');
			})
		});
		</script>		

		<section class="form-register">
			<h1>Registros de Personas</h1>
				<!--<form action="ControllerPersona" method="get">-->
				<input type="hidden" id="Id" value="<%=Id%>"> <label>Nombres:</label>
				<br> <input class="controls" type="text" value="<%=Persona%>" id="Persona" required
					maxlength="100" onkeypress="return check(event)"> <br> <label>Apellidos:</label>
				<input class="controls" type="text" value="<%=Apellido%>" id="Apellido" required
					maxlength="100" onkeypress="return check(event)"> <br> <label>Sexo:</label>
				<select class="controls" id="Sexo" required>
					<option selected>
						<%=Sexo%>
					</option>
					<option>M</option>
					<option>F</option>
				</select> <br> <label>DUI:</label> <input class="controls" type="text" value="<%=DUI%>"
					id="DUI" required maxlength="10" onkeypress="return checknumber(event)"> <br>
				<label>NIT:</label>
				<input class="controls" type="text" value="<%=NIT%>" id="NIT" required maxlength="17"
					onkeypress="return checknumber(event)"> <br>
				<label>Fecha_Nacimiento:</label> <input class="controls" type="date"
					value="<%=Fecha_Nacimiento%>" id="Fecha_Nacimiento" required>
				<br>
				<button id="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
				<!--</form>-->
		</section>
	</body>
</html>