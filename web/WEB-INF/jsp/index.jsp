
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='<c:url value="css/gg.css" />' rel="stylesheet">        
        <link href='<c:url value="css/gg1.css" />' rel="stylesheet">
        <link href='<c:url value="fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="fontawesome/css/all.css"/>' rel="stylesheet" >
        <link href='<c:url value="https://fonts.gstatic.com"/>' rel="stylesheet" >
        <title>Home || GreenGround</title>
    </head>
    <body>
        <header>
            <div class="topnav" id="myTopnav">
                <a class="active" href="index.htm" target="central"><i class="fas fa-store"></i> GreenGround <i class="fas fa-apple-alt"></i></a>
                <a href="sub/stats.htm" target="central">Estadisticas <i class="fas fa-signal"></i></a>
                <a class="active1" href="sub/register.htm"  style="float:right">Registrarme <i class="fas fa-user-plus"></i></a>
                <a class="active1" href="sub/login.htm"  style="float:right">Inicio de Sesion <i class="fas fa-user-tie"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
        </header>

        <section class="info">
            <div class="hola">
                <br>
                <center><b>Bienvenidos a GreenGround</b></center>
                <div class="presentacion">
                    <p>GreenGround es un proyecto que tiene como finalidad, el evitar el uso de intermediarios entre los campesinos y los clientes finales, para así, obtener un mayor beneficio por parte de los agricultores que se verán beneficiados de forma directa.</p>
                    <p>El objetivo principal es generar una ayuda a los campesinos para acercarlos a la tecnología que mueve el mundo al día de hoy, con el fin de que estos obtengan un mayor beneficio económico con la venta de sus productos a través de una plataforma digital.</p>
                </div><br>
            </div>
            <div class="foot">
                <center><b>DESARROLLADORES</b></center>
            </div>
            <div class="productos">
                <div class="columnas"><center>Jefferson Pulido</center></div>
                <div class="columnas"><center>Santiago Monrroy</center></div>  
                <div class="columnas"><center>Andres Olmos</center></div>  
                <div class="columnas"><center>Juan David Paez</center></div>  
                
            </div>
        </section>
        <footer>
            <center>GreenGround 2021 © Copyright</center>
        </footer>
    </body>
</html>