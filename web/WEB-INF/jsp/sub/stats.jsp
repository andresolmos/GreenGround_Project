
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='<c:url value="../css/stats.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/tablastats.css" />' rel="stylesheet"> 
        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet"> 

        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/robot.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >

        <title>Estadisticas || GreenGround</title>
    </head>
    <body>
        <header>
            <div class="topnav" id="myTopnav">
                <a class="active" href="../index.htm" ><i class="fas fa-store"></i> GreenGround <i class="fas fa-apple-alt"></i></a>
                <a href="sub/stats.htm">Estadisticas <i class="fas fa-signal"></i></a>
                <a class="active1" href="register.htm"  style="float:right">Registrarme <i class="fas fa-user-plus"></i></a>
                <a class="active1" href="login.htm"  style="float:right">Inicio de Sesion <i class="fas fa-user-tie"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
        </header>
        <br><br><br><br>
        <CENTER><b><h1 class="tit">ESTADISTICAS</h1></b></CENTER>
        
        
        <div id="pricing-table" class="clear">
            <div class="plan" id="most-popular">
                  <h3>Productos Disponibles<span><c:out value="${amountcant}"></c:out></span></h3>    
            </div> &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="plan" id="most-popular">
                <c:forEach var="bestseller" items="${bestseller}">
                    <h3>Mejor <br> Vendedor<br><hr>
                      <img src="../img/trofeo.png" width="80" height="80" class="user">
                    </h3>  
                    <p><b><center><c:out value="${bestseller.usu_nombre}"></c:out> <c:out value="${bestseller.usu_apellido}"></c:out></center></b></p>
                </c:forEach>
            </div>&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="plan" id="most-popular">
                <c:forEach var="bestbuyer" items="${bestbuyer}">
                    <h3>Mejor <br> Comprador<br><hr>
                      <img src="../img/trofeo.png" width="80" height="80" class="user">
                    </h3>
                    <p><b><center><c:out value="${bestbuyer.usu_nombre}"></c:out> <c:out value="${bestbuyer.usu_apellido}"></c:out></center></b></p>
                </c:forEach>
            </div>&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="plan" id="most-popular">
                <h3>Usuarios registrados<span><c:out value="${amountusers}"></c:out></span></h3>
            </div> 	
        </div>

        <div id="wrapper">
            <h1 style="color: white;">Producto mas vendido</h1>

            <table id="keywords" cellspacing="0" cellpadding="0">
                <c:forEach var="bestprod" items="${bestprod}">
                <thead>
                    <tr>
                        <th><span>Nombre</span></th>
                        <th><span>Precio</span></th>
                        <th><span>Stock Actual</span></th>
                        <th><span>Cantidad Comprada</span></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><c:out value="${bestprod.Pro_Nombre}"></c:out></td>
                        <td><c:out value="${bestprod.Pro_Precio}"></c:out></td>
                        <td><c:out value="${bestprod.Pro_Stock}"></c:out></td>
                        <td><c:out value="${bestprod.cantidad}"></c:out></td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div> 
        <br> <br>
        <div id="wrapper2">
            <h1 style="color: white;">Fecha de mas ventas</h1>

            <table id="keywords" cellspacing="0" cellpadding="0">
                <c:forEach var="bestfech" items="${bestfech}">
                <thead>
                    <tr>
                        <th><span>Fecha</span></th>
                        <th><span>Precio Total Vendido</span></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><c:out value="${bestfech.Shop_fecha}"></c:out></td>
                        <td><c:out value="${bestfech.monto}"></c:out></td>
                    </tr>
                </tbody>
                 </c:forEach>
            </table>
        </div> 
        <br><br>
        <footer class="foots">
            <center>GreenGround 2021 © Copyright</center>
        </footer>
    </body>
</html>
