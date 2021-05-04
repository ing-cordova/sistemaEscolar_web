<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <meta charset="ISO-8859-1">
        <title>Personas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js&quot; integrity="
            sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
            <link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
	rel="stylesheet">
    </head>

    <body>
        <script type="text/javascript">
            $(document).ready(function () {
                $.post('ControllerPersona', {
                }, function (response) {
                    let datos = JSON.parse(response);
                    console.log(datos);

                    var tabla = document.getElementById('tablaDatos');
                    for (let item of datos) {
                        tabla.innerHTML +=
                            `
                        <td>${item.idPersona}</td>
                        <td>${item.Nombre}</td>
                        <td>${item.Apellido}</td>
                        <td>${item.Sexo}</td>
                        <td>${item.DUI}</td>
                        <td>${item.NIT}</td>
                        <td>${item.Fecha_Nacimiento}</td>
                        <td>${item.Ultima_Modificacion}</td>
                        <td>${item.Estado}</td>
                        <td><a href="ControllerPersona?Id=${item.idPersona}&Eliminar=btne" class="btn btn-danger"><i class="fa fa-trash-alt"></i></a>
						<a href="AddPersona.jsp?Id=${item.idPersona}&Persona=${item.Nombre}&Apellido=${item.Apellido}&Sexo=${item.Sexo}&DUI=${item.DUI}&NIT=${item.NIT}&Fecha_Nacimiento=${item.Fecha_Nacimiento}" class="btn btn-warning"><i class="fa fa-edit"></i></a>
						</td>
                        `
                    }
                });
            });
        </script>
         <div class="container-table">
        <h1 align="center">Personas existentes</h1>
        <div class="botones">
        	<a href="Administrador.jsp" class="btn btn-secondary btn-lg">Regresar al menú principal</a>
        	<a href="AddPersona.jsp" class="btn btn-success btn-lg">Agregar nuevo</a>
        </div>
        
        <table class="table table-dark table-striped" id="tablaDatos">
            <thead>
                <th>ID_PERSONA</th>
                <th>NOMBRES</th>
                <th>APELLIDOS</th>
                <th>SEXO</th>
                <th>DUI</th>
                <th>NIT</th>
                <th>FECHA DE NACIMIENTO</th>
                <th>ULTIMA MODIFICACION</th>
                <th>ESTADO</th>
                <th>ACCIONES</th>
            </thead>
        </table>
        </div>
        </form>
    </body>

    </html>