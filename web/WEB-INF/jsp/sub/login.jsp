<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/login.css" />' rel="stylesheet">                
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <title>Bienvenidos || GreenGround</title>
    </head>
    <body>
        <header>
            <div class="topnav" id="myTopnav">
                <a class="active" href="../index.htm" ><i class="fas fa-store"></i> GreenGround <i class="fas fa-apple-alt"></i></a>
                <a href="stats.htm">Estadisticas <i class="fas fa-signal"></i></a>
                <a class="active1" href="register.htm"  style="float:right">Registrarme <i class="fas fa-user-plus"></i></a>
                <a class="active1" href="login.htm"  style="float:right">Inicio de Sesion <i class="fas fa-user-tie"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
        </header>
        <br><br><br><br>

        <form:form commandName="personabean">
            <div class="login-wrap">
                <div class="login-html">
                    
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Iniciar Sesion</label>
                    <input id="tab-2" type="hidden" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
                    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>
                    <div class="login-form"><br>
                        <div class="alert" >
                            <center><h4><c:out value="${as}"></c:out></h4></center>
                        </div>
                        <div class="sign-in-htm"><br><br><br>
                            <div class="group">
                                <form:label  path="usu_correo_vendedor" class="label">Correo Electronico</form:label><br>
                                <form:input  path="usu_correo_vendedor" class="input" required="true"></form:input>                    
                            </div>
                            <div class="group">
                                <form:label  path="contrasena" class="label">Contraseña</form:label><br>
                                <form:password  path="contrasena" class="input" data-type="password"></form:password>
                            </div>
                            <div class="group">
                                <form:label  path="rol" class="label">Rol Usuario </form:label><br>
                                <form:select path="rol" class="rol">
                                    <form:option value="Comprador"></form:option>
                                    <form:option value="Vendedor"></form:option>
                                </form:select>
                            </div>
                            <div class="group"> 
                                <form:button name="enviar" class="button">Entrar</form:button>
                            </div>
                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <a href="remenber.htm" class="a1">Olvidaste la contraseña?</a>
                            </div>
                            <br><br><br><br>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>                    
    </body>
</html>