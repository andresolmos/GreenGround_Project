
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/user.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/products.css" />' rel="stylesheet">   
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <link href='<c:url value="../css/perfiles.css" />' rel="stylesheet">   
        

        <title>Comprador || GreenGround</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
   
        
        
        <title>JSP Page</title>
  

    </head>
    <header>

                <div class="topnav" id="myTopnav">
                <a href="segcar.htm?idusu=${id}&rol=Vendedor" >Regresar <i class="fas fa-arrow-circle-left"></i></a>
                <a class="activeOff" target="central" style="float:right" onclick="myFunction()">Cerrar Sesion  <i class="fas fa-power-off"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
 
            </header>
    <body>
        <div class="container" style="width: 100%;" >
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                <br><br><br><br>
                <CENTER><h1><b>¡Productos Vendidos!</b></h1></CENTER>
                <br><br>
                    </div>
                <div class="wrap-user">
                        <table align="center" border="1px" >
                            <tr id="firstrow">
                                    
                                <th> Nombre</th>
                                <th> Foto</th>
                                <th> Precio</th>
                                <th>Cantidad</th>
                                <th > Fecha de compra</th>
                                <th>Estado</th>
                                <th>Comprado por</th>
                                <th>Precio total</th>
                            </tr>
                            <tr>   
                            <c:forEach var="dato" items="${shop}" > 

                                <td><c:out value="${dato.Pro_Nombre}"></c:out> </td>
                                <td><c:out value="${dato.Pro_Foto}"></c:out> </td>
                                <td><c:out value="${dato.Pro_Precio}"></c:out> 
                                </td>
                                <td><c:out value="${dato.shop_cantidad}"></c:out> </td>
                                <td><c:out value="${dato.Shop_fecha}"></c:out> </td>
                                <td><c:out value="${dato.shop_Estado}"></c:out> </td>
                                <td><c:out value="${dato.usu_nombre}"></c:out> 
                                <c:out value="${dato.usu_apellido}"></c:out></td>   
                                <td><c:out value="${dato.Shop_monto}"></c:out> </td>
                            </tr>
           
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script>
                function myFunction()
                {
                  if (confirm("Seguro que desea salir?")) 
                  {
                    window.location="../index.htm" ;
                  } 
                  else { }
                }
            </script>
         <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>