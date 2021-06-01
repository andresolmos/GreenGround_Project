<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>GreenGround</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    </head>
    <body>
        <c:forEach var="data" items="${person}" > 
        <header>
            <ul>
                <li><a href="perfilbuyer.html" target="central2">PERFIL</a></li>
                <li><a href="product.html" target="central2">PRODUCTOS</a></li>
                <li><a href="shopcar.htm?id_usu=${data.usu_id_usuario}" >carrito</a></li>
            </ul>  
        </header>
        <section>
            <article>
                <div class="container mt-4">
                    <div class="row">
                        <c:forEach var="dato" items="${product}" > 
                             
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="card">
                                            <div class="card-header">

                                                <label><b><c:out value="${dato.Nombre}"></c:out></b></label>                                    
                                                </div>
                                                <div class="card-body text-center d-flex">
                                                    <label><i class="fas fa-dollar-sign"><c:out value="${dato.Precio}"></c:out></i></label>

                                                </div>
                                                <div class="card-footer">
                                                    <div class="col-lg-12">
                                                        <label><c:out value="${dato.Descripcion}"></c:out></label>                                   
                                                    </div>
                                                    <div class=" col-lg-12 text-center">  
                                                     <a href="car.htm?IdProducto=${dato.IdProducto}&id_usu=${data.usu_id_usuario}" name="enviar"><i class="fas fa-cart-plus"></i></a>
                                                    </div>                         
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                              </c:forEach>
                        </c:forEach>
                    </div>
                </div>
            </article>
        </section>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>