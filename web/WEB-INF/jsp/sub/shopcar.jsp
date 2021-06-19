
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='<c:url value="../css/hola.css" />' rel="stylesheet">                
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <style>
            body /*background*/
            {
                background: -moz-radial-gradient(90% 90%, #8bb183, rgb(204, 204, 204)); 
                background: -webkit-radial-gradient(90% 90%, #8bb183, rgb(204, 204, 204)); 
                background: -o-radial-gradient(90% 90%, #8bb183, rgb(204, 204, 204)); 
                background: -ms-radial-gradient(90% 90%, #8bb183, rgb(204, 204, 204)); 
                background: radial-gradient(90% 90%, #8bb183, rgb(204, 204, 204));  
            }
        </style>
        <title>Carrito de Compras || GreenGround</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <c:forEach var="dato" items="${sum}">               
                        <li class="nav-item">

                            <a class="nav-link" href="segcar.htm?idusu=${dato.usu_id_usuario}"><i class="fas fa-arrow-circle-left"></i> Seguir Comprando</a>
                        </li> 
                    </c:forEach>    
                </ul>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="d-flex">
                <h2>Carrito</h2>                       
            </div>                    
            <div class="row">             
                <div class="col-lg-9">                 
                    <table class="table table-responsive">
                        <thead class="table-primary">
                            <tr class="text-center">
                                <th>Item</th>                               
                                <th>Articulo</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Cantidad</th>                       
                                <th>Total</th>                       
                                <th>Acciones</th>                       
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${product}"> 
                                <tr class="text-center tr">
                                    <td><c:out value="${dato.Car_Item }"></c:out></td>                                   
                                    <td><c:out value="${dato.Car_Nombre}"></c:out>
                                        <img src="<c:out value="${dato.Car_Foto}"></c:out>" width="130" height="110">
                                        </td>
                                        <td><c:out value="${dato.Car_Descripcion}"></c:out></td>
                                    <td><c:out value="${dato.Car_Precio}"></c:out></td>
                                        <td>
                                            <form action="upcar.htm" method="GET">
                                                <input type="hidden" name="idusu" value="<c:out value="${dato.usu_id_usuario}"></c:out>">
                                            <input type="hidden" name="IdProducto" value="<c:out value="${dato.IdProducto }"></c:out>">
                                            <input min="1" max="20" type="number" name="cantidad" value="<c:out value="${dato.Car_cantidad}"></c:out>">
                                                </td>   
                                                <td><c:out value="${dato.Car_Precio}"></c:out></td>                           
                                                <td class="text-center">
                                                    <button type="submit"  class="btn btn-success"><i class='fas fa-edit'></i></button>
                                            </form>
                                            <a href="decar.htm?IdProducto=${dato.IdProducto}&idusu=${dato.usu_id_usuario}"  class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>   
                                    </td>                           
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                </div>
                <div class="col-lg-3">                  
                    <div class="card">
                        <div class="card-header">
                            Generar Compra
                        </div>
                        <c:forEach var="dato" items="${sum}"> 
                            <div class="card-body">
                                <label>Subtotal:</label>
                                <a class="form-control text-center"><i class="fas fa-dollar-sign h5">$ <c:out value="${dato.Precio}"></c:out></i></a>
                                    <label>Total a Pagar:</label>
                                    <a class="form-control text-center"><i class="fas fa-dollar-sign h4 primary">$ <c:out value="${dato.Precio}"></c:out></i></a>
                                </div>
                                <div class="card-footer">
                                    <a href="elicar.htm?idusu=${dato.usu_id_usuario}" class="btn btn-danger btn-block">Vaciar Carrito</a><br>
                                <c:forEach var="data" items="${product}"> 
                                    <c:set var="contador" value="${contador + 1}" />
                                    <form  action="showbuy.htm">
                                        <input type="hidden" value="${data.IdProducto}" name="idpro_<c:out value = "${contador}"/>">  
                                    </c:forEach>
                                    <input type="hidden" value="${dato.usu_id_usuario}" name="idusu">
                                    <input value="Generar compra" name="enviar" type="submit" class="btn btn-info btn-block">
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>          
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
