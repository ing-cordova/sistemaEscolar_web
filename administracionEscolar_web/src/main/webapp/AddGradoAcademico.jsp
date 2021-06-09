<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<link rel="icon" href="Imagenes/school.ico">
	<title>Nuevo Grado Académico</title>
	<link rel="stylesheet" href="Styles/style_addgradocademico.css">
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
	<%
	String Id = request.getParameter("Id");
	String GradoAcad = request.getParameter("GradoAcad");

	if (Id == null) {
	Id = "";
	GradoAcad = "";
}
%>
<script type="text/javascript">
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

	$(document).ready(function () {
		$("#GradoAcad").on('paste copy cut', function (e) {
			e.preventDefault();
			swal('¡Acción prohibida!', '', 'error');
		});
	});

	$(document).ready(function (){
		$("#Guardar").click(function (){

			var Guardar = $("#Guardar").val();
			var Id = $("#Id").val();
			var GradoAcad = $("#GradoAcad").val();
			var GradoAcad2 = GradoAcad.replace(/\s+/g, " ").trim();

			if(GradoAcad2 == "" || GradoAcad2 == null){
				swal('¡Por favor llene todos los campos!', 'Esto puede deberse a los campos que contengan espacios, por favor reviselos.', 'warning');
			}
			else{
				$.get('ControllerGradoAcademico', {
					Guardar,Id,GradoAcad2 
				}, function(response){

					let respuesta = JSON.parse(response);

					if(respuesta == "Guardado"){
						swal({
							title: "¡Grado académico guardado con éxito!",
							text: "",
							icon: "success",
							timer: 2000,
						})
						.then(() => {
							location.href = 'http://localhost:8080/administracionEscolar_web/GradoAcademico.jsp';
						})		
					}
					else if(respuesta == "Actualizado"){
						swal({
							title: "¡Grado académico actualizado con éxito!",
							text: "",
							icon: "success",
							timer: 2000,
						})
						.then(() => {
							location.href = 'http://localhost:8080/administracionEscolar_web/GradoAcademico.jsp';
						})	
					}
				});
			}
		});
	});

</script>
<section class="form-register">
	<h1>Registros de Grados Académicos</h1>
	<!-- <form action="ControllerGradoAcademico" method="get"> -->
		<input type="hidden" id="Id" value=<%=Id%>> 
		<label>Nombre del Grado académico:</label>
		<br>
		<input class="controls" type="text" value="<%=GradoAcad%>" id="GradoAcad"  maxlength="200" onkeypress="return check(event)" required> 
		<br>
		<button id="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
	<!-- </form> -->
</section>
</body>
</html>