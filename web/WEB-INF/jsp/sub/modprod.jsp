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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/user.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/perfiles.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/edit.css" />' rel="stylesheet">   
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >

        <title>Editar Producto || GreenGround</title>
    </head>
    <header>
        <div class="topnav" id="myTopnav">
            <a class="active" href="seller.html" target="central"><i class="fas fa-store"></i> Mi Perfil <i class="fas fa-user"></i></a>
            <a href="listproduct.html" target="central2">Mis Productos <i class="fas fa-clipboard-list"></i></a>
            <a class="activeOff" target="central" style="float:right" onclick="myFunction()">Cerrar Sesion  <i class="fas fa-power-off"></i></a>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
        </div>
    </header>
    <body>
         <br><br><br><br><br>
        <CENTER><h1><b>¡Editando tu Producto!</b></h1></CENTER>
        <br><br><br>

        <form:form commandName="product" method="post">
            <table class="tb1">
            <form:errors path="*" element="div" cssClass="alert alert-danger"/>
            <tr>
                <td><form:label  path="Nombre" >Nombre producto </form:label></td>
                <td><form:input cssClass="form-control" path="Nombre"></form:input></td>
                    </tr>
                <tr>
               <td> <form:label  path="Descripcion">descripcion producto </form:label></td>
                <td><form:input cssClass="form-control" path="Descripcion"></form:input></td>
                    </tr>
                <tr>
                <td><form:label  path="Stock">Stock producto </form:label></td>
                <td><form:input cssClass="form-control" path="Stock" value="${product.stock}"></form:input></td>
                    </tr>
                <tr>
               <td> <form:label  path="Precio">Precio producto</form:label></td>
                <td><form:input cssClass="form-control" path="Precio" value="${product.precio}"></form:input></td>
                    </tr>
                <tr>
               <td> <form:label  path="pro_expiration_date">fecha de expiracion producto</form:label></td>
               <td> <input id="pro_expiration_date" value="${product.pro_expiration_date}" name="pro_expiration_date" class="form-control" type="date"></td>
                </tr>
            <tr>
                <td><form:label  path="pro_batch_date">fecha de lote producto</form:label></td>
               <td> <input id="pro_batch_date" value="${product.pro_batch_date}" name="pro_batch_date" class="form-control" type="date"></td>
                </tr>
                <tr>
                    <td colspan="2"><form:hidden path="id_usu"></form:hidden>
                <form:hidden path="IdProducto"></form:hidden>
                <form:button  name="enviar">enviar</form:button></td>
                </tr>
                </table>
            </form:form>
        </div>
    </body>
</html>
