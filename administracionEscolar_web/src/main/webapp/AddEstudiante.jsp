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
</head>
<body>
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
        </script>
	<%
	SimpleDateFormat formato = new SimpleDateFormat("dd/mm/aaaa");
	Date castfecha = new Date();
	
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
	String birthdate = request.getParameter("fecha");

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
		//birthdate = "";
	}

	%>
	<section class="form-register">
	<h1>Registros de Estudiantes</h1>
		<form action="ControllerEstudiante" method="get">
		<input type="hidden" name="Id" value=<%=Id%>>
		<input type="hidden" name="Id2" value=<%=Id2%>>
		<label>Nombres:</label>
		<br>
			<input class="controls" type="text" value="<%=Nombres%>" name="Nombres"  required> 
		<br>
		<label>Apellidos:</label>
		<input class="controls" type="text" value="<%=Apellidos%>" name="Apellidos"  required> 
		<br>
		<label>Correo Electronico del Estudiante:</label>
		<br>
		<input class="controls" type="text" value="<%=Email%>" name="Email"  required>		 
		<br>
		<label>Contraseña del Estudiante:</label>
		<br>
		<input class="controls" type="password" value="<%=Pass%>" name="Pass"  required>
		<br>
		<label>Nombre del Grado Academico:</label>
		<br>
		
		<select class="controls" name="GradoAcad"  id="TipoSelect" required>
					<option value="<%=IdGrado%>" selected><%=GradoAcad%></option>
				</select>
		<br>
		<label>Sexo:</label>
				<select class="controls" name="Sexo" required>
					<option selected><%=Sexo%></option>
					<option>M</option>
					<option>F</option>
				</select>
		<br>
		<label>DUI:</label>
		<input class="controls" type="text" value="<%=dui%>" name="dui" placeholder="00000000-0" required> 
		<br>
		<label>NIT:</label>
		<input class="controls" type="text" value="<%=nit%>" name="nit" placeholder="0000-000000-000-0" required> 
		<br>
		<label for="birthdate">Fecha_Nacimiento:</label>

		<input class="controls" value ="<%=birthdate%>" name="birthdate" type="date" placeholder="20XX-00-00" required>
		<br>
		<br>
			<button name="Guardar" value="btna" class="boton">Guardar/Actualizar</button>
		</form>
	</section>
</body>
</html>