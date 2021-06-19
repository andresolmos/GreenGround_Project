
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="../css/gg.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href='<c:url value="../css/forgot.css" />' rel="stylesheet">   
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >

        <title>Recuperar Contraseña || GreenGround</title>
    </head>
    <body>
        <br><br><br>   
        <CENTER><h1 class="tit"><b>Recuperando tu Contraseña!</b></h1></CENTER>
        <br><br>
        <center><h2>Enviaremos un codigo de recuperacion a tu correo electronico</h2></center>
        <br>  
        <div class="alert" >
            <h1><c:out value="${asa}"></c:out></h1>
        </div>
        <form:form commandName="personabean">
            <div class="login-wrap">
                <div class="login-html">
                    <div class="login-form">
                        <br>
                        <br>
                        <div class="group">
                            <form:label class="label" path="usu_correo_vendedor" ><b>Correo Electronico</b></form:label>
                            <form:input class="input" required="true" type="email" path="usu_correo_vendedor"></form:input>
                        </div>
                        <br>
                        <div class="group">
                            <form:button name="enviar" class="button1" style="float: left;">Enviar</form:button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <form:button type="reset" class="button1" style="float: center;">Borrar</form:button> 
                            <form:button type="submit" class="button1" style="float: right;"><a class="regre" href="../index.htm">Regresar</a></form:button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form> 

    </body>
</html>