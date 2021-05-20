<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="utf-8">
<title>Materias | Docente</title>
<link rel="icon" href="Imagenes/school.ico">
<link rel="stylesheet" href="Styles/style_registromateriasEst.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<script type="text/javascript">

		//JQuery que nos devuelve todos las materias por GradoAcdemico específico.
		$(document).ready(function () {
			$.post('ControllerRegistroMateriasDocente', {}, function (response) {
				let datos = JSON.parse(response);
				console.log(datos);
					
				var tabla = document.getElementById('tablaMateriasAIscribir');
				for(let item of datos){
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
		
</script>
	<header class="header">
		<div class="container">
			<div class="logo">
				<h1>Inscripcion de Materias</h1>
			</div>
			<nav class="menu">
				<a href="DashboardDocente.jsp">Inicio</a> <a href="RegistroMateriasDocente.jsp">Materias</a>
				<a href="#">Actividades</a> <a href="#">Notas</a>
				<a href="#">Revisar Acts.</a>
			</nav>
		</div>
	</header>
	<div class="out-header">
			<br>
			<h2>> Materias para inscribir</h2>
			<div class="tabla">
				<table onclick='CargarDatos()'>
					<thead>
						<th>CÓDIGO MATERIA</th>
						<th>NOMBRE MATERIA</th>
					</thead>
					<tbody id="tablaMateriasAIscribir">
					
					</tbody>					
				</table>
			</div>
			<form action="" method="">
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