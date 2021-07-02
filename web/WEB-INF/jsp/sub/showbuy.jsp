
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">        
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <title>Gracias || GreenGround</title>
    </head>
    <body>
        <section>
            <h1><c:out value="${size}"></c:out></h1>
                <br><br><br>
                <CENTER><h1 class="h1h"><b>¡Gracias!</b></h1></CENTER><br><br>
                <CENTER><h2 class="h2h"><b>Con tu compra estas ayudando a crecer el agro Colombiano y ayudando a cada familia del campo a crecer.</b></h2></CENTER><br><br>
                <CENTER><h2 class="h2h"><b>No olvides descargar tu orden de compra, sin esta no podras reclamar tus productos!!.</b></h2></CENTER><br><br>
                <center><h3 class="h3h"><b>¡Vuelve Pronto!</b></h3></center><br><br><br>
                <center><a href="pdfdown.htm?idusu=${id}"><button class="boton3"><i class="fas fa-file-pdf"></i> Descargue su orden de compra <i class="fas fa-file-download"></i></button></a><br></center><br><br><br>
                <center><button class="boton3"><a href="segcar.htm?idusu=${id}&rol=Comprador" class="ahome"><i class="fas fa-store"></i> Volver al home <i class="fas fa-apple-alt"></i></a></button><br></center><br><br>
        </section>

        <footer class="footf">
            <center>GreenGround 2021 © Copyright</center>
        </footer>
   
    </body>
</html>
