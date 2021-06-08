<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="utf-8">
	<title>Actividades | CRUD</title>
	<link rel="icon" href="Imagenes/school.ico">
	<link rel="stylesheet" href="Styles/style_addactividadesdocente.css">
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
	<%
		String IdAct = request.getParameter("IdAct");
		String IdMat = request.getParameter("IdMat");
		String SubjectName = request.getParameter("SubjectName");
		String ActivitieName = request.getParameter("ActivitieName");
		String Porcent = request.getParameter("Porcent");
		String LimitDate = request.getParameter("LimitDate");

		String PorcentC = "";
		//System.out.println("Porcentaje convertido: " + PorcentC);

		if (IdAct == null || IdAct == "" || Porcent == null) {
			IdAct = "";
			IdMat = "";
			SubjectName = "Seleccione una opcion...";
			ActivitieName = "";
			PorcentC = "";
			LimitDate = "";
		}
		else{
			PorcentC = String.valueOf(Math.round(Double.parseDouble(Porcent) * 100));
		}
	%>
	<script type="text/javascript">

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

		$(function(){
			$('#Porcent').keypress(function(e) {
			if(isNaN(this.value + String.fromCharCode(e.charCode))) 
				return false;
			}).on("cut copy paste",function(e){
			e.preventDefault();
			});
		});

		function ENVIAR(){
			$(document).ready(function(){
				var btna = $("#btna").val();

				var IdAct = $("#IdAct").val();
				var SubjectName = $("#TipoSelect").val();
				var ActivitieName = $("#ActivitieName").val();
				var ActivitieName2 = ActivitieName.replace(/\s+/g, " ").trim();
				var Porcent = $("#Porcent").val();
				var LimitDate = $("#LimitDate").val();

				if(SubjectName == "" || SubjectName == null || ActivitieName2 == "" || ActivitieName2 == null ||
					Porcent == "" || Porcent == null || LimitDate == "" || LimitDate == null){
						swal('¡Por favor rellene todos los campos!', '', 'warning');
					}
				else{
					if(Porcent > 100 || Porcent < 1){
						swal("¡Solo porcentajes del 1 al 100!", "", "error");
					}
					else{
						$.get('ControllerActividadesDocente', {

							btna,IdAct,SubjectName,ActivitieName2,Porcent,LimitDate
							}, function(response){

							let mensaje = JSON.parse(response);

							if(mensaje == "Guardado"){
								swal({
									title: "¡Actividad guardada con éxito!",
									text: "",
									icon: "success",
									timer: 2000,
								})
								.then(() => {
									location.href = 'http://localhost:8080/administracionEscolar_web/ActividadesDocente.jsp';
								})		
							}
							else if(mensaje == "Actualizado"){
								swal({
									title: "¡Actividad actualizada con éxito!",
									text: "",
									icon: "success",
									timer: 2000,
								})
								.then(() => {
									location.href = 'http://localhost:8080/administracionEscolar_web/ActividadesDocente.jsp';
								})	
							}
						});
					}
				}
				
			});
		}
		
	</script>

<section class="form-register">
	<h1>Crear/Editar Actividad</h1>
		<input type="hidden" id="IdAct" value="<%=IdAct%>">
		<label>Materia:</label>
		<br>
		<select class="controls"  id="TipoSelect" required>
			<option value="<%=IdMat%>" selected><%=SubjectName%></option>
		</select>
		<br> 
		<label>Nombre de la actividad:</label>
		<input class="controls" type="text" value="<%=ActivitieName%>" id="ActivitieName" required> 
		<br>
		<label>Porcentaje (%):</label>
		<input class="controls" type="number" id="Porcent" value="<%=PorcentC%>" maxlength="3" onkeypress="return checknumber(event)" min="1" max="100" required> 
		<br>
		<label>Fecha de Entrega:</label>
		<br>
		<input class="controls" value="<%=LimitDate%>" id="LimitDate" type="date" required>
		<br>
		<button id="btna" value="Guardar" class="boton" onclick="ENVIAR();">¡Procesar ahora!</button>
		<p>
			<a href="ActividadesDocente.jsp">CANCELAR</a>
		</p>
</section>
</body>
</html>