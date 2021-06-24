<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>GreenGround</title>
        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">  
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">  
        <link href='<c:url value="../css/register.css" />' rel="stylesheet">  
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
    </head>
    <body>
        <header>
            <div class="topnav" id="myTopnav">
                <a class="active" href="../index.htm" target="central"><i class="fas fa-store"></i> GreenGround <i class="fas fa-apple-alt"></i></a>
                <a href="stats.htm" target="central">Estadisticas <i class="fas fa-signal"></i></a>
                <a class="active1" href="register.htm"  style="float:right">Registrarme <i class="fas fa-user-plus"></i></a>
                <a class="active1" href="login.htm"  style="float:right">Inicio de Sesion <i class="fas fa-user-tie"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
        </header>
        <br><br><br><br>
        <div class="alert" >
            <h1><c:out value="${as}"></c:out></h1>
        </div>
        <form:form commandName="personabean">
            <div class="login-wrap">
                <div class="login-html"><br>
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Registro Usuario</label></input>
                    <input id="tab-2" type="hidden" name="tab" class="sign-up"><label for="tab-1" class="tab"></label></input>
                    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>
                    <div class="login-form"><br><br>
                        <div class="group">
                            <form:label  path="usu_nombre_usuario" class="label">Nombres Completos</form:label>
                            <form:input class="input" required="true" path="usu_nombre_usuario"></form:input>
                        </div>
                        <div class="group">
                            <form:label  path="usu_apellido_usuario" class="label">Apellidos</form:label>
                            <form:input class="input" required="true" path="usu_apellido_usuario"></form:input>
                        </div>
                        <div class="group">
                            <form:label  path="num_cel" class="label">Numero Celular</form:label>
                            <form:input type="number" min="1"  class="input" required="true" path="num_cel"></form:input>
                        </div>
                        <div class="group">
                            <form:label  path="usu_correo_vendedor" class="label">Correo Electronico </form:label>
                            <form:input type="email"class="input" required="true" path="usu_correo_vendedor"></form:input>
                        </div>
                        <div class="group">
                            <form:label  path="usu_dir" class="label">Direccion de Usuario (Incluya municipio)</form:label>
                            <form:input class="input" required="true" path="usu_dir"></form:input>
                        </div>
                        <div class="group">
                            <form:label  path="contrasena" class="label">Contraseña</form:label>
                            <form:password class="input" data-type="password" required="true" path="contrasena"></form:password>
                        </div>
                        <div class="group">
                            <form:button type="submit"  name="enviar"  class="button1" style="float: left;">Registrarme</form:button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="reset" class="button1" style="float: center;">Borrar</button>
                            <form:button type="submit" class="button1" style="float: right;"><a class="regre" href="../index.htm">Regresar</a></form:button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        <br><br>     
    </body>
</html>