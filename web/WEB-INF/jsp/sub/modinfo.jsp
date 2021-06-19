<%-- 
    Document   : home
    Created on : 19-feb-2021, 8:42:48
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" >
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <div class="row">
                        <form:form commandName="personabean" method="post">
                            <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                            <div class="form-group">
                                <form:label  path="Nombre" >Nombre producto </form:label>
                                <form:input cssClass="form-control" path="Nombre"></form:input>
                                    <br>
                                </div>
                                <div class="form-group">
                                <form:label  path="Descripcion">descripcion producto </form:label>
                                <form:input cssClass="form-control" path="Descripcion"></form:input>
                                    <br>
                                </div>
                                <div class="form-group">
                                <form:label  path="Stock">Stock producto </form:label>
                                <form:input cssClass="form-control" path="Stock" value="${product.stock}"></form:input>
                                    <br>
                                </div>
                                <div class="form-group">
                                <form:label  path="Precio">Precio producto</form:label>
                                <form:input cssClass="form-control" path="Precio" value="${product.precio}"></form:input>
                                <br>
                                <form:hidden path="id_usu"></form:hidden>
                                <form:hidden path="IdProducto"></form:hidden>
                            <form:button  name="enviar">enviar</form:button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
