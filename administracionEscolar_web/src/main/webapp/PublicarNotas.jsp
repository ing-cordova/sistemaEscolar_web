<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="utf-8">
<title>Calificaciones | Docente</title>
<link rel="icon" href="Imagenes/school.ico">
<link rel="stylesheet" href="Styles/style_publicarnotas.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
</head>
</head>
<body>
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
	<header class="header">
		<div class="container">
			<div class="btn-menu">
				<img alt="" src="Imagenes/school.ico">
			</div>
			<div class="logo">
				<h1>Publicación de Calificaciones</h1>
			</div>
			<nav class="menu">
				<a href="DashboardDocente.jsp">Inicio</a> <a href="RegistroMateriasDocente.jsp">Materias</a>
				<a href="#">Actividades</a> <a href="#">Notas</a>
				<a href="#">Revisar Acts</a>
			</nav>
		</div>
		<div class="out-header">
			<!--Formulario que envía únicamente el id de la materia seleccionada-->
			<form action="" method="">
				<div class="componentes">
					<label>Materia:</label>
					<br>
					<select class="controls" name="materia"  id="TipoSelect" required>
						<option value="" selected>Seleccione...</option>
					</select>
					<input type="submit" name="enviaridMateria" class="btnEnviarID" value="Mostrar notas">
				</div>
			</form>

			<!--Formulario que envía los datos para ser actualizados.-->
			<form action="ControllerPublicarNotas" method="post">
				<div class="componentes">
					<label>E-mail:</label>
					<label>algoooooooooo@gmail.com</label>
					<br>
					<br>
					<label>Periodo 1</label>
					<input type="text" name="p1" class="controls2">
					<label>Periodo 2</label>
					<input type="text" name="p2" class="controls2">
					<label>Periodo 3</label>
					<input type="text" name="p3" class="controls2">
					<label>Final</label>
					<input type="text" name="pfinal" class="controls2">
					<label>Reposición</label>
					<input type="text" name="pRepo" class="controls2">
					<br>
					<div class="btEnvDa">
						<input type="submit" name="" class="btnEnviarNotas" value="Publicar notas">
					</div>
				</div>
			</form>
			<div class="tabla">
				<table>
					<thead>
						<th>ID_NOTA</th>
						<th>E-MAIL</th>
						<th>P1</th>
						<th>P2</th>
						<th>P3</th>
						<th>FINAL</th>
						<th>REPO</th>
					</thead>
					<tbody id="tablaNotasxMateria">
					<!-- DATOS SOLO DE PRUEBA, ELIMINAR CUANDO YA SE TRAIGAN DATOS REALES -->
						<tr>
							<td>1</td>
							<td style="display:none;">10</td>
							<td>esteesunejemplo@gmail.com</td>
							<td>10</td>
							<td>9.5</td>
							<td>7.6</td>
							<td>8.8</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td style="display:none;">10</td>
							<td>esteesunejemplo@gmail.com</td>
							<td>10</td>
							<td>9.5</td>
							<td>7.6</td>
							<td>8.8</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td style="display:none;">10</td>
							<td>esteesunejemplo@gmail.com</td>
							<td>10</td>
							<td>9.5</td>
							<td>7.6</td>
							<td>8.8</td>
							<td>0</td>
						</tr>
					</tbody>					
				</table>
			</div>
		</div>
	</header>
</body>
</html>