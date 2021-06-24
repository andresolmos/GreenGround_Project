<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <%--
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        --%>
    </head>
    <body>
        <c:forEach var="data" items="${person}" > 
            <header>
               <%-- <ul> --%>
                    <div class="topnav" id="myTopnav">
                        <a class="active" href="shopcar.htm?id_usu=${data.usu_id_usuario}">Mi Carrito <i class="fas fa-shopping-cart"></i></a>
                        <a class="activeOff" target="central" style="float:right" onclick="myFunction()">Cerrar Sesion  <i class="fas fa-power-off"></i></a>
                        <a class="active1" style="float:right " href="config.htm?id=${data.usu_id_usuario}&rol=Comprador">Configuracion <i class="fas fa-users-cog"></i></a>
                        <a class="active1" href="segcar.htm?idusu=${data.usu_id_usuario}&rol=Vendedor" style="float:right " >Cambiar de rol</a>
                        <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
                    </div>
               <%-- </ul>  --%>
            </header>
            <section>
                <br><br><br><br>
                <CENTER><h1><b>¡Bienvenido, Comprador!</b></h1></CENTER>
                <br><br><br><br><br><br>
                <div align="center">
                    <img src="../img/usuario.png" width="180" height="180" class="user">
                </div>
                <br><br><br><br><br><br>
                <div class="wrap-user">
                    <table align="center" border="1px">
                        <tr id="firstrow">
                            <th>Nombre Completo</th>
                            <th>Ubicacion</th>
                            <th>Numero Celular</th>
                            <th>Correo Electronico</th>
                        </tr>
                        <tr>
                            <td><c:out value="${data.usu_nombre} ${data.usu_apellido}"></c:out></td>
                            <td><c:out value="${data.usu_dir}"></c:out></td>
                            <td><c:out value="${data.num_cel}"></c:out></td>
                            <td><c:out value="${data.usu_correo}"></c:out></td>
                        </tr>
                    </table>
                </div>

                </section>
                <br> <br> <br>
                <section class="pricing-section bg-3">
                    <div class="pricing pricing--jinpa">
                    <c:forEach var="dato" items="${product}" > 

                        <div class="pricing__item">
                            <h3 class="pricing__title"><c:out value="${dato.Pro_Nombre}"></c:out></h3>
                            <div class="pricing__price">$ <c:out value="${dato.Pro_Precio}"></c:out></div>
                                <!--<div><img src="../img/zan2.jpg" style="width:150px; height:150px;"></div><br><hr><br>-->
                                <p class="pricing__sentence"><c:out value="${dato.Pro_Descripcion}"></c:out></p>
                                <p class="pricing__sentence">Estado: DISPONIBLE</p>
                                <br>
                                <a href="car.htm?IdProducto=${dato.IdProducto}&id_usu=${data.usu_id_usuario}" name="enviar" class="pricing__action">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                        </div>&nbsp;&nbsp;&nbsp;
                    </c:forEach>
                </c:forEach>
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
    </section>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>