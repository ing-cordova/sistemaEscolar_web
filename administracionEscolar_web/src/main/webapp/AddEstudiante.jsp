<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<link rel="icon" href="Imagenes/school.ico">
	<title>Nuevo Estudiante</title>
	<link rel="stylesheet" href="Styles/style_addEstudiante.css">
	<script src="https://kit.fontawesome.com/dab6165ace.js"
	crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%
	HttpSession sesion = (HttpSession) request.getSession();
	String usuSession = String.valueOf(sesion.getAttribute("dashboard"));
	String fullname = String.valueOf(sesion.getAttribute("fullname"));

	if (usuSession.equals(null) || usuSession.equals("null")) {
	response.sendRedirect("index.jsp");
}
%>
<script type="text/javascript">
		$(document).ready(function () {
			$.post('ControllerRegistroEstudiante', {
			}, function (response) {
				let datos = JSON.parse(response);
				console.log(datos);
				
				var combo = document.getElementById('TipoSelect');
				for (let item of datos) {
					combo.innerHTML +=
					`
					<option value ="${item.idGradoAcademico}">${item.Nombre_GradoAcad}</option>
					
					`
				}
			});
		});
		
		//jQuery que envía la información al servidor, y nos devuelve una respuesta.
		$(document).ready(function () {
			$("#Guardar").click(function () {

				var Guardar = $("#Guardar").val();
				var Id = $("#Id").val();
				var Id2 = $("#Id2").val();
				
				var Nombres = $("#Nombres").val();
				//función que nos elimina los espacios que hay al inicio y al final .trim().
				var Nombres2 = Nombres.replace(/\s+/g, " ").trim();

				var Apellidos = $("#Apellidos").val();
				var Apellidos2 = Apellidos.replace(/\s+/g, " ").trim();

				var Sexo = $("#Sexo").val();

				var birthdate = $("#birthdate").val();

				var dui = $("#dui").val();
				var dui2 = dui.replace(/\s+/g, " ").trim();

				var nit = $("#nit").val();
				var nit2 = nit.replace(/\s+/g, " ").trim();

				var Email = $("#Email").val();
				var Email2 = Email.replace(/\s+/g, " ").trim();

				var Pass = $("#Pass").val();
				var Pass2 = Pass.replace(/\s+/g, " ").trim();
				
				var GradoAcad = $("#TipoSelect").val();
				

				if (Nombres2 == "" || Nombres2 == null || Apellidos2 == "" || Apellidos2 == null ||
					Sexo == 0 || Sexo == "" || Sexo == null || GradoAcad == 0 || GradoAcad == "" ||
					GradoAcad == null ||
					birthdate == null || birthdate == "" || dui2 == "" || dui2 == null || nit2 == "" || nit2 == null ||
					Email2 == "" || Email2 == null || Pass2 == "" || Pass2 == null) {
					swal('¡Por favor llene todos los campos!', 'Esto puede deberse a los campos que contengan espacios, por favor reviselos.', 'warning');
				}
				//Validación para el correo electrónico que contenga @-subdominio-dominio.
				else if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(Email2)) {
					$.get('ControllerEstudiante', {
						//Variables que serán enviadas al servidor.
						Id, Id2, Nombres2, Apellidos2, Sexo, birthdate, dui2, nit2, Email2, Pass2, GradoAcad, Guardar
					}, function (response) {

						let datos = JSON.parse(response);

						if (datos == "Actualizado") {
							swal({
								title: "¡Estudiante actualizado con éxito!",
								text: "",
								icon: "success",
								timer: 3000,
							}).then(() => {
									location.href = 'http://localhost:8080/administracionEscolar_web/Estudiante.jsp';
							})
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
		$(document).ready(function(){

			$("#Nombres").on('paste copy cut', function (e) {
				e.preventDefault();
				swal('¡Esta accion está prohibida!', '', 'error');
			})
			$("#Apellidos").on('paste copy cut', function (e) {
				e.preventDefault();
				swal('¡Esta accion está prohibida!', '', 'error');
			})
			$("#Email").on('paste copy cut', function (e) {
				e.preventDefault();
				swal('¡Esta accion está prohibida!', '', 'error');
			})
			$("#Pass").on('paste copy cut', function (e) {
				e.preventDefault();
				swal('¡Esta accion está prohibida!', '', 'error');
			})
			$("#dui").on('paste copy cut', function (e) {
				e.preventDefault();
				swal('¡Esta accion está prohibida!', '', 'error');
			})
			$("#nit").on('paste copy cut', function (e) {
				e.preventDefault();
				swal('¡Esta accion está prohibida!', '', 'error');
			})
			
			
		})

	</script>
	
	<%
	SimpleDateFormat formato = new SimpleDateFormat("dd/mm/aaaa");
	Date castfecha = new Date();
	
	//Variables que recolectamos/traemos del controlador.
	//--------------------------------------------------------------
	String Id = request.getParameter("Id");
	String Id2 = request.getParameter("Id2");
	String Nombres = request.getParameter("Nombres");
	String Apellidos = request.getParameter("Apellidos");
	String Email = request.getParameter("Email");
	String Pass = request.getParameter("Pass");
	String Sexo = request.getParameter("Sexo");
	String dui = request.getParameter("dui");
	String nit = request.getParameter("nit");
	String GradoAcad = request.getParameter("GradoAcad");
	String IdGrado = request.getParameter("IdGrado");
	//String GradoAcademico = request.getParameter("GradoAcademico");
	String FechaNacimiento = request.getParameter("birthdate");
	System.out.println(FechaNacimiento);

	if (Id == null || Id2 == null) {
		Id = "";
		Id2 = "";
		Nombres = "";
		Apellidos = "";
		Email ="";
		Pass = "";
		GradoAcad = "Seleccione una opcion";
		IdGrado = "";
		Sexo = "Seleccione una opcion";
		dui = "";
		nit = "";
		FechaNacimiento = "";
	}

%>
<section class="form-register">
	<h1>Registros de Estudiantes</h1>
	<!-- <form action="ControllerEstudiante" method="get"> -->
		<input type="hidden" id ="Id" value=<%=Id%>>
		<input type="hidden" id="Id2" value=<%=Id2%>>
		<label>Nombres:</label>
		<br>
		<input class="controls" type="text" value="<%=Nombres%>" id="Nombres"  maxlength="100" onkeypress="return check(event)" required> 
		<br>
		<label>Apellidos:</label>
		<input class="controls" type="text" value="<%=Apellidos%>" id="Apellidos" maxlength="100" onkeypress="return check(event)" required> 
		<br>
		<label>Correo Electronico del Estudiante:</label>
		<br>
		<input class="controls" type="text" value="<%=Email%>" id="Email"  required>		 
		<br>
		<label>Contraseña del Estudiante:</label>
		<br>
		<input class="controls" type="password" value="<%=Pass%>" id="Pass"  required>
		<br>
		<label>Nombre del Grado Academico:</label>
		<br>
		
		<select class="controls" name="GradoAcad"  id="TipoSelect"  required>
			<option value="<%=IdGrado%>" selected><%=GradoAcad%></option>
		</select>
		<br>
		<label>Sexo:</label>
		<select class="controls" id="Sexo" required>
			<option selected><%=Sexo%></option>
			<option>M</option>
			<option>F</option>
		</select>
		<br>
		<label>DUI:</label>
		<input class="controls" type="text" value="<%=dui%>" id="dui"  maxlength="10" onkeypress="return checknumber(event)"
		placeholder="00000000-0" required> 
		<br>
		<label>NIT:</label>
		<input class="controls" type="text" value="<%=nit%>" id="nit"  maxlength="17" onkeypress="return checknumber(event)"
		placeholder="0000-000000-000-0" required> 
		<br>
		<label for="birthdate">Fecha de Nacimiento:</label>

		<input class="controls" value ="<%=FechaNacimiento%>" id="birthdate" type="date" placeholder="20XX-00-00" required>
		<br>
		<br>
		<button id="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
	<!-- </form> -->
</section>
</body>
</html>