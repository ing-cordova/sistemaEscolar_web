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
	</script>
	<%
	String IdAct = request.getParameter("IdAct");
	String IdMat = request.getParameter("IdMat");
	String SubjectName = request.getParameter("SubjectName");
	String ActivitieName = request.getParameter("ActivitieName");
	String Porcent = request.getParameter("Porcent");
	
		//Double PorcentC = Double.parseDouble(Porcent) * 100;
	String LimitDate = request.getParameter("LimitDate");
	
	if (IdAct == null || IdAct == "") {
	IdAct = "";
	IdMat = "";
	SubjectName = "Seleccione una opcion...";
	ActivitieName = "";
	Porcent = "";
	LimitDate = "";
}
%>
<section class="form-register">
	<h1>Crear/Editar Actividad</h1>
	<form action="ControllerActividadesDocente" method="get">
		<input type="hidden" name="IdAct" value="<%=IdAct%>">
		<label>Materia:</label>
		<br>
		<select class="controls" name="SubjectName" id="TipoSelect" required>
			<option value="<%=IdMat%>" selected><%=SubjectName%></option>
		</select>
		<br> 
		<label>Nombre de la actividad:</label>
		<input class="controls" type="text" value="<%=ActivitieName%>" name="ActivitieName" required> 
		<br>
		<label>Porcentaje (%):</label>
		<input class="controls" type="text" name="Porcent" value="<%=Porcent%>" required> 
		<br>
		<label>Fecha de Entrega:</label>
		<br>
		<input class="controls" value="<%=LimitDate%>" name="LimitDate" type="date" required>
		<br>
		<button name="btna" value="Guardar" class="boton">¡Procesar ahora!</button>
		<p>
			<a href="ActividadesDocente.jsp">CANCELAR</a>
		</p>
	</form>
</section>
</body>
</html>