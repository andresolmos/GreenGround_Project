<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="../css/gg.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <hr><font color='#1E8449' style="font-family:Century;"> <CENTER><font size="6"><b>LOGIN</b></CENTER><hr>
            <center><img src="../img/usuario.png" width="110" height="110"></center>
            <div class="alert" >
                <h1><c:out value="${as}"></c:out></h1>
            </div>
            <form:form commandName="personabean">
                 <form:errors path="*" element="div" cssClass="alert alert-danger"/>
            <div class="form-group">
            <form:label  path="usu_correo_vendedor" >correo Usuario </form:label>
            <form:input cssClass="form-control" path="usu_correo_vendedor"></form:input>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="contrasena" >contraseña Usuario </form:label>
            <form:password cssClass="form-control"  path="contrasena"></form:password>
            <br>
            <form:label  path="rol" >rol Usuario </form:label>
            <form:select path="rol">
                <form:option value="vendedor"></form:option>
                <form:option value="comprador"></form:option>
            </form:select>
            </div>
                 <table align="center">
                    <tr>
                        <td>
                        <form:button name="enviar">enviar</form:button>
                        <a href="remenber.htm"><input type="button" value="recordar contraseña"  /></a>
                        </td>
                    </tr>
                </table>
                 </form:form> 
        
    </body>
</html>