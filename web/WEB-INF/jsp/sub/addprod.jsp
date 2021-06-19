<%-- 
    Document   : home
    Created on : 19-feb-2021, 8:42:48
    Author     : andre
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">       
        <link href='<c:url value="../css/user.css" />' rel="stylesheet">       
        <link href='<c:url value="../css/perfiles.css" />' rel="stylesheet">       
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >             
        

        <title>Nuevo Producto || GreenGround</title>
    </head>
    <body>
        <header>
            <div class="topnav" id="myTopnav">
                <a class="active" href="seller.html" target="central"><i class="fas fa-store"></i> Mi Perfil <i class="fas fa-user"></i></a>
                <a href="listproduct.html" target="central2">Mis Productos <i class="fas fa-clipboard-list"></i></a>
                <a class="activeOff" target="central" style="float:right" onclick="myFunction()">Cerrar Sesion  <i class="fas fa-power-off"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
        </header>
        <br><br><br><br>
        <CENTER><h1><b>¡Nuevo Producto!</b></h1></CENTER>
        <br><br><br>
                        <form:form commandName="product" method="post">
                            <table class="tb1">
                            <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                            <tr>
                                <td><form:label  path="Nombre" >Nombre producto </form:label></td>
                               <td> <form:input cssClass="form-control" path="Nombre" class="input"></form:input></td>
                                 </tr>
                                <tr>
                               <td> <form:label  path="Descripcion">descripcion producto </form:label></td>
                               <td> <form:input cssClass="form-control" path="Descripcion" class="input"></form:input></td>
                                    </tr>
                                <tr>
                               <td> <form:label  path="Stock">Stock producto </form:label></td>
                                <td><form:input cssClass="form-control" path="Stock" class="input"></form:input></td>
                                    </tr>
                                <tr>
                               <td> <form:label  path="Precio">Precio producto</form:label></td>
                               <td> <form:input cssClass="form-control" path="Precio" class="input"></form:input></td>
                                </tr>
                                <tr>
                               <td> <form:label  path="pro_expiration_date">fecha de expiracion producto</form:label></td>
                               <td><input id="pro_expiration_date" class="input" name="pro_expiration_date" class="form-control" type="date"></td>
                                </tr>
                               <tr>
                                <td><form:label  path="pro_batch_date">fecha de lote producto</form:label></td>
                                <td><input id="pro_batch_date" class="input" name="pro_batch_date" class="form-control" type="date"></td>
                                </tr>
                                <form:hidden path="id_usu" value="${id}"></form:hidden>
                                <tr>
                                    <td colspan="2">
                            <form:button  name="enviar" class="button" style="margin:0px auto; ">
                                Publicar</form:button></td>
                                </tr>
                            </table>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
