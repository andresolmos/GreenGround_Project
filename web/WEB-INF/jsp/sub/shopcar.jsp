
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../css/load.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
      
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
    <!--Modal-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLongTitle">Orden de Compra</h4>
                    </div>
                    <div class="modal-body">
                        <center>
                            <h2>Su orden esta siendo generada</h2>
                            <hr>
                            <h4>Pronto será contactado por el vendedor. </h4>
                        </center>
                    </div>
                    <div class="modal-footer">
                        <center><div class="loader" id="loader"></div></center>
                    </div>

                </div>
             </div>
        </div>
        <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li>
                    <c:forEach var="dato" items="${sum}">    
                    <a class="nav-link" href="segcar.htm?idusu=${dato.usu_id_usuario}&rol=Comprador"><i class="fas fa-arrow-circle-left"></i> Seguir Comprando</a>
                    </c:forEach> 
                </li>
                
            </ul>
        </div>
      </nav>

        <div class="container mt-4">
            <div class="d-flex">
                <h2><b>Carrito</b></h2>                       
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
                                <th>Cantidad en Kg</th>                       
                                <th>Total</th>                       
                                <th>Acciones</th>                       
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${product}"> 
                                <tr class="text-center tr">
                                    <td><c:out value="${dato.Car_Item }"></c:out></td>                                   

                                    <td><c:out value="${dato.Pro_Nombre}"></c:out>
                                        </td>
                                        <td><c:out value="${dato.Pro_Descripcion}"></c:out></td>
                                    <td><c:out value="$ ${dato.Pro_Precio}"></c:out></td>
                                    <td>
                                        <form action="upcar.htm" method="GET">
                                            <input type="hidden" name="idusu" value="<c:out value="${dato.usu_id_usuario}"></c:out>">
                                        <input type="hidden" name="IdProducto" value="<c:out value="${dato.IdProducto}"></c:out>"> 
                                        <input min="1" max="20" type="number" name="cantidad" value="<c:out value="${dato.Car_cantidad}"></c:out>">
                                            </td>   
                                            <td><c:out value="$ ${dato.Car_Precio}"> </c:out></td>                           
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
                            <h1><b>Tu Compra</b></h1>
                        </div>
                        <c:forEach var="dato" items="${sum}"> 
                            <div class="card-body">
                                <label>Subtotal:</label>
                                <a class="form-control text-center">$ <c:out value="${dato.Precio}"></c:out></i></a>
                                <br>
                                <label>Total a Pagar:</label>
                                <a class="form-control text-center">$ <c:out value="${dato.Precio}"></c:out></i></a>
                            </div><br>
                            <div class="card-footer">
                                <a href="elicar.htm?idusu=${dato.usu_id_usuario}" class="btn btn-danger btn-block">Vaciar Carrito</a><br>
                                <c:forEach var="data" items="${product}"> 
                                <c:set var="contador" value="${contador + 1}" />
                                <form  action="showbuy.htm">
                                    <input type="hidden" value="${data.IdProducto}" name="idpro_<c:out value = "${contador}"/>">  
                                    </c:forEach>
                                    <input type="hidden" value="${dato.usu_id_usuario}" name="idusu" >
                                    <button value="Generar compra" name="enviar" type="submit" class="btn btn-info btn-block" data-toggle="modal" data-target="#exampleModalCenter">Generar Pedido</button>
                    
                                </form>
                            </div>

                        </c:forEach>
                    </div>
                </div>
            </div>          
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
