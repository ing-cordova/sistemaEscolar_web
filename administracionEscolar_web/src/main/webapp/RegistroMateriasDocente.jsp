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
		
		//Función que cargará los datos que seleccionemos en la tabla 1.
		function CargarDatos(){

			//Declaración de variables recolectoras.
			var RowIdx;
			var id, Materia;
			
			var tabla = document.getElementById('tablaMateriasAIscribir');
			
			var rows = tabla.getElementsByTagName('tr');
			var selectedRow;
			var rowCellValue;

			//Ciclo de iteración de datos recogidos.
			for(i = 0; i < rows.length ; i++){
				rows[i].onclick = function(){
					RowIdx = this.rowIndex;
					selectedRow = this.cells;
					var contador = 1;
					for(j = 0; j < selectedRow.length; j++){
						if(contador == 1){
							id = selectedRow[j].innerText;
							contador++;
						}
						else if(contador == 2){
							Materia = selectedRow[j].innerText;
							contador++;
						}
					}

					if(id > 0){
						console.log(id);
						console.log(Materia);
						//Creando el botón de eliminar cada fila que se seleccione.
						var boton = "<button class='borrar' style='padding: 8px; color: #ffff; background: red; border-radius: 9px;'><i class='fas fa-trash-alt'></i> ELIMINAR</button>";
						//Pasando los datos de la tabla anterior a una fila en la nueva tabla.
						var fila="<tr><td>"+id+"</td><input type = 'hidden' name = 'idMateria' value = "+id+"><td>"+Materia+"</td><td>"+boton+"</td></tr>";
						//Creando una nueva tableRow (tr) dentro de la tabla.
						var btn = document.createElement("TR");
						//Añadiendo los datos a la fila.
					   	btn.innerHTML = fila;
					  	//Agregando los datos en la tabla.
					    document.getElementById("tablaMateriasSeleccionadas").appendChild(btn);
					}
				}
			}
		}
		
		//JQuery que nos permite eliminar la fila seleccionada.
		$(document).on('click', '.borrar', function (event) {
		    event.preventDefault();
		    $(this).closest('tr').remove();
		});
		
		
</script>
	<header class="header">
		<div class="container">
			<div class="logo">
				<h1>Inscripcion de Materias</h1>
			</div>
			<nav class="menu">
				<a href="DashboardDocente.jsp">Inicio</a> <a href="#">Materias</a>
				<a href="ActividadesDocente.jsp">Actividades</a> <a href="PublicarNotas.jsp">Notas</a>
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