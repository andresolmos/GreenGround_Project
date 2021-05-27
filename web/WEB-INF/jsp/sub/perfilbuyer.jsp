<!DOCTYPE html>
<html>
    <head>
        <title>GreenGround</title>
        <link rel="stylesheet" href="../css/gg.css">
        <style>
            table#t01, th#t01, td#t01 {
              border: 1px solid rgb(172, 185, 176);
              border-collapse: collapse;
            }
            th#t01, td#t01 {
              padding: 8px;
              text-align: left;
            }
            table#t01 {
              width: 60%;    
              background-color: #b5fa66;
            }
        </style>
    </head>
    <body>
        <hr><font color='#1E8449' style="font-family:Century;"> <CENTER><font size="6"><b>COMPRADOR</b></CENTER><hr></font>
        <table align="center">
            <tr>
                <td> <center><img src="../img/usuario.png" width="160" height="160"></center></td>
                <td>
                    <button class="boton1" name="bot2" type="submit" style="margin:0px auto; " onclick="myFunctionC2()">
                        CONFIGURACION
                    </button><hr>
                    <button class="boton1" name="bot2" type="submit" style="margin:0px auto; " onclick="myFunction()">
                        CERRAR SESION
                    </button>
                </td>
            </tr>
        </table>
        <font size="5">
        <table align="center" id="t01" border="1px">
            <tr>
                <td><b>NOMBRE</b></td>
                <td>Jefferson Pulido</td>
            </tr>
            <tr>
                <td><b>UBICACION</b></td>
                <td>Facatativa, Cundinamarca</td>
            </tr>
            <tr>
                <td><b>NUMERO CELULAR</b></td>
                <td>310 215 6205</td>
            </tr>
            <tr>
                <td><b>DIRECCION</b></td>
                <td>Calle 2 E #4-24 Sur</td>
            </tr>
            <tr>
                <td><b>EMAIL</b></td>
                <td>Jeffersonpulido55@gmail.com</td>
            </tr>
        </table>
    </font>
    <script>
        function myFunction()
        {
          if (confirm("Seguro que desea salir?")) 
          {
            window.location="principal.html";
          } 
          else { }
        }
    </script>
    <script>
        function myFunctionC2()
        {
            window.location="settings.html";
        }
    </script>
    </body>    
</html>