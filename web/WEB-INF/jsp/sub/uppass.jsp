<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href='<c:url value="../css/forgotpass.css" />' rel="stylesheet">                
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >

        <title>Modificar Contraseña || GreenGround</title>
    </head>
    <body>
    <br><br><br>
    <CENTER><h1 class="tit"><b>Modificar tu Contraseña!</b></h1></CENTER>
    <br><br> 
    <h1><c:out value="${asa}"></c:out></h1>
    <form:form commandName="personabean">
        <div class="login-wrap">
            <div class="login-html">
                <div class="login-form">
                    <br>
                    <br>
                    <div class="group">
                        <form:label class="label" path="contrasena" >Contraseña Nueva </form:label><br>
                        <form:password class="input" required="true" path="contrasena"></form:password>
                    </div>
                    <div class="group">
                        <form:label class="label" path="confirm" >Confirme Contraseña Nueva </form:label><br>
                        <form:password class="input" required="true" path="confirm"></form:password>
                    </div>            
                    <div class="group">
                        <form:label class="label" path="rec" >Codigo de recuperacion (Enviado a su Email)</form:label><br>
                        <form:input class="input" required="true" path="rec"></form:input>
                    </div>
                    <form:button name="enviar" class="button1">Recuperar</form:button>
                    </div>
                </div>
            </div>
    </form:form>
</body>
</html>