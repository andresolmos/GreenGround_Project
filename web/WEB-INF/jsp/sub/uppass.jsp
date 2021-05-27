<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>GreenGround</title>
        <link rel="stylesheet" href="../css/gg.css">
        <link rel="stylesheet" href="../css/hola.css">
        <script defer src="../js/hola.js"></script>
    </head>
    <body>
        <hr><font color='#1E8449' style="font-family:Century;"> <CENTER><font size="6"><b>modificar contraseña</b></CENTER><hr><br></font>
        <h1><c:out value="${asa}"></c:out></h1>
        <form:form commandName="personabean">
            <div class="form-group">
            <form:label  path="contrasena" >contraseña Usuario </form:label>
            <form:password cssClass="form-control" path="contrasena"></form:password>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="confirm" >confirmar contraseña</form:label>
            <form:password cssClass="form-control" path="confirm"></form:password>
            <br>
            </div>            
            <div class="form-group">
            <form:label  path="rec" >codigo de recuperacion</form:label>
            <form:input cssClass="form-control" path="rec"></form:input>
            <br>
            </div>
                 
            <form:button name="enviar">enviar</form:button>
        </form:form>
              </font></center><br>
            <div class="modal" id="modal">
                <div class="modal-header">
                    <div class="title">GreenGround</div>
                    <button data-close-button class="close-button">&times;</button>
                </div>

            </div>
            <div id="overlay">

            </div>
    </body>
</html>