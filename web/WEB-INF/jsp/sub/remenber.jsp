<%-- 
    Document   : remenber
    Created on : 14-may-2021, 16:57:27
    Author     : andre
--%>
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
        
        <hr><font color='#1E8449' style="font-family:Century;"> <CENTER><font size="6"><b>recordar contraseña</b></CENTER><hr>
            <center><img src="../img/usuario.png" width="110" height="110"></center>
            <div class="alert" >
            </div>
            <h1><c:out value="${asa}"></c:out></h1>
            <form:form commandName="personabean">
            <div class="form-group">
            <form:label  path="usu_correo_vendedor" >correo Usuario </form:label>
            <form:input cssClass="form-control" path="usu_correo_vendedor"></form:input>
            <br>
            </div>
                 <table align="center">
                    <tr>
                        <td>
                        <form:button name="enviar">enviar</form:button>
                        </td>
                    </tr>
                </table>
                 </form:form> 
        
    </body>
</html>