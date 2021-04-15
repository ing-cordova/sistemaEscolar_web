<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
%(document).ready(function(){
	$.post('ControllerDocente',{
		
	},function(response){
		let datos = JSON.parse(response);
		console.log(datos);
			
	});
	});
	</script>
	<h1>WELCOME</h1>
	
	<table class="table table-dark table-striped">
		<thead>
			<th>IdDocente</th>
			<th>IdPersona</th>
			<th>Correo Electronico</th>
			<th>Pass</th>
			<th>Especialidad</th>
			<th>Ultima modificacion</th>
			<th>Estado</th>		
		</thead>
	</table>
	
</body>
</html>