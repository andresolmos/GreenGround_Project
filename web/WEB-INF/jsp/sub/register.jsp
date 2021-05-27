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
        <hr><font color='#1E8449' style="font-family:Century;"> <CENTER><font size="6"><b>REGISTRO</b></CENTER><hr><br></font>
            <div class="alert" >
                <h1><c:out value="${asa}"></c:out></h1>
            </div>    
        <form:form commandName="personabean">
                 <form:errors path="*" element="div" cssClass="alert alert-danger"/>
            <div class="form-group">
            <form:label  path="usu_nombre_usuario" >Nombre Usuario </form:label>
            <form:input cssClass="form-control" path="usu_nombre_usuario"></form:input>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="usu_apellido_usuario" >Apellido Usuario </form:label>
            <form:input cssClass="form-control" path="usu_apellido_usuario"></form:input>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="num_cel" >celular Usuario </form:label>
            <form:input cssClass="form-control" path="num_cel"></form:input>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="usu_correo_vendedor" >Correo Usuario </form:label>
            <form:input cssClass="form-control" path="usu_correo_vendedor"></form:input>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="contrasena" >contraseña Usuario </form:label>
            <form:password cssClass="form-control" path="contrasena"></form:password>
            <br>
            </div>
            <div class="form-group">
            <form:label  path="usu_dir" >direccion Usuario </form:label>
            <form:input cssClass="form-control" path="usu_dir"></form:input>
            <br>
            </div>
                 
            <form:button name="enviar">enviar</form:button>
        </form:form>
              </font></center><br>
            </form>
            <div class="modal" id="modal">
                <div class="modal-header">
                    <div class="title">GreenGround</div>
                    <button data-close-button class="close-button">&times;</button>
                </div>
                <div class="modal-body">
                    <center><h2>Terminos Y Condiciones</h2><hr><h5>El presente contrato describe los tÃ©rminos y condiciones aplicables al uso del contenido, productos y/o servicios del sitio web GreenGround del cual es titular JPMIndustries. Para hacer uso del contenido, productos y/o servicios del sitio web el usuario deberÃ¡ sujetarse a los presentes tÃ©rminos y condiciones. <br> En caso de querer leer completo el acuerdo de Terminos y Condiciones, lo encontrara en https//:www.greenground.com/tÃ©rminos-condiciones/ <br> GreenGround no se responsabiliza por la indebida utilizaciÃ³n del contenido, productos y/o servicios del sitio web y del incumplimiento de los presentes tÃ©rminos y condiciones. <br></h5></center>
                </div>
            </div>
            <div id="overlay">

            </div>
    </body>
</html>