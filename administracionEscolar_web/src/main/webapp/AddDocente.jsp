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
	<title>Nuevo Docente</title>
	<link rel="stylesheet" href="Styles/style_addDocente.css">
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
	$("#Guardar").click(function () {

		var Guardar = $("#Guardar").val();
		var Id = $("#Id").val();
		var Id2 = $("#Id2").val();
		
		var Nombres = $("#Nombres").val();
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
		
		var Especialidad = $("#Especialidad").val();
		var Especialidad = Especialidad.replace(/\s+/g, " ").trim();
		

		if (Nombres2 == "" || Nombres2 == null || Apellidos2 == "" || Apellidos2 == null ||
			Sexo == 0 || Sexo == "" || Sexo == null || Especialidad == "" ||
			Especialidad == null ||
			birthdate == null || birthdate == "" || dui2 == "" || dui2 == null || nit2 == "" || nit2 == null ||
			Email2 == "" || Email2 == null || Pass2 == "" || Pass2 == null) {
			swal('¡Por favor llene todos los campos!', 'Esto puede deberse a los campos que contengan espacios, por favor reviselos.', 'warning');
		}
		else if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(Email2)) {
			$.get('ControllerDocente', {
				Id, Id2, Nombres2, Apellidos2, Sexo, dui2, nit2, birthdate, Email2, Pass2, Especialidad, Guardar
			}, function (response) {

				let datos = JSON.parse(response);

				if (datos == "Actualizado") {
					swal({
						title: "¡ Docente actualizado con éxito!",
						text: "",
						icon: "success",
						timer: 3000,
					}).then(() => {
							location.href = 'http://localhost:8080/administracionEscolar_web/Docente.jsp';
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
	$("#Especialidad").on('paste copy cut', function (e) {
		e.preventDefault();
		swal('¡Esta accion está prohibida!', '', 'error');
	})
	
	
})

</script>
	<%
	String Id = request.getParameter("Id");
	String Id2 = request.getParameter("Id2");
	String Nombres = request.getParameter("Nombres");
	String Apellidos = request.getParameter("Apellidos");
	String Sexo = request.getParameter("Sexo");
	String dui = request.getParameter("dui");
	String nit = request.getParameter("nit");
	String FechaNacimiento = request.getParameter("birthdate");
	String Email = request.getParameter("Email");
	String Pass = request.getParameter("Pass");
	String Especialidad = request.getParameter("Especialidad");
	System.out.println(FechaNacimiento);
	

	if (Id == null || Id2 == null) {
	Id = "";
	Id2 = "";
	Nombres = "";
	Apellidos = "";
	Sexo = "Seleccione una Opcion";
	dui = "";
	nit = "";
	FechaNacimiento = "";
	Email = "";
	Pass = "";
	Especialidad = "";
}
%>
<section class="form-register">
	<h1>Registro de Docente</h1>
	<!-- <form action="ControllerDocente" method="get"> -->
		<input type="hidden" id="Id" value=<%=Id%>>
		<input type="hidden" id="Id2" value=<%=Id2%>>
		<label>Nombres:</label>
		<br>
		<input class="controls" type="text" value ="<%=Nombres%>" id="Nombres" placeholder="Julio David" onkeypress="return check(event)" required> 
		<label>Apellidos:</label>
		<br>
		<input class="controls" type="text" value ="<%=Apellidos%>" id="Apellidos" placeholder="Lopez Mejia" onkeypress="return check(event)" required>
		<br>
		<label>Sexo:</label>
		<br>
		<select class="controls" id="Sexo" required>
			<option selected ><%=Sexo%></option>
			<option>M</option>
			<option>F</option>
		</select>
		<!-- Aqui va el combobox de Sexo -->
		<br>
		<label>DUI:</label>
		<br> 
		<input class="controls" type="text" value ="<%=dui%>" id="dui" placeholder="00000000-0" maxlength="10" onkeypress="return checknumber(event)" required>
		<br>
		<label>NIT:</label>
		<br>
		<input class="controls" type="text" value ="<%=nit%>" id="nit" placeholder="0000-000000-000-0" maxlength="17" onkeypress="return checknumber(event)" required>
		<br>
		<label for="birthdate">Fecha de Nacimiento:</label>
		<br>
		<input class="controls" value ="<%=FechaNacimiento%>" id="birthdate" type="date" placeholder="20XX-00-00" required>
		<br>
		<label>Correo Electronico del Docente:</label>
		<br>
		<input class="controls" type="text" value="<%=Email%>" id="Email"  required>		 
		<br>
		<label>Contraseña del Docente:</label>
		<br>
		<input class="controls" type="password" value="<%=Pass%>" id="Pass"  required>
		<br>
		<label>Especialidad del Docente:</label>
		<br>
		<input class="controls" type="text" value="<%=Especialidad%>" id="Especialidad" onkeypress="return check(event)" required>
		<br>
		<button id="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
	<!-- </form> -->
</section>

</body>
</html>