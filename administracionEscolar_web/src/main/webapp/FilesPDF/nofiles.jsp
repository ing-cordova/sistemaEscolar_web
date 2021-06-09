<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8">
    <title>Redireccionamiento...</title>
    <link rel="stylesheet" href="../Styles/style_error.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
  </head>

  <body onload="actualizarTimer()">

    <script type="text/javascript">
        var inicio = 5;

        function actualizarTimer(){
          document.getElementById('countdown').innerHTML = inicio;

          if(inicio == 0){
            window.close();
            //setTimeout('window.close()', 5000);
          }
          else{
            inicio -= 1;
            setTimeout(actualizarTimer, 1000);
          }
        }

        
    </script>

    <div class="container">
      <p class="pintro">
        <strong>¡NO ENCONTRAMOS NINGÚN ARCHIVO! </strong>  
      </p>
      <br>
      <p class="poutro">
        <strong>Usted será redirigido en <span id="countdown"></span> segundos</strong>
      </p>
      <br>
      <br>
    </div>
  </body>

  </html>