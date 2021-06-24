
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/user.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/perfiles.css" />' rel="stylesheet">   
        <link href='<c:url value="../css/edit.css" />' rel="stylesheet">   
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >

        <title>Editar Usuario || GreenGround</title>
    </head>
    <header>
        <div class="topnav" id="myTopnav">
            <a href="segcar.htm?idusu=${id}&rol=${rol}" >Regresar <i class="fas fa-arrow-circle-left"></i></a>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
        </div>
    </header>
    <body>
         <br><br><br><br><br>
        <CENTER><h1><b>¡Editando tu Usuario!</b></h1></CENTER>
        <br><br><br>

        <form:form commandName="personabean" method="post">
            <table class="tb1">
                <tr>
                    <td><form:label  path="usu_nombre_usuario" >Nombre Completos </form:label></td>
                    <td><form:input style="width:350px" cssClass="form-control" path="usu_nombre_usuario"></form:input></td>
                </tr>
                <tr>
                    <td> <form:label  path="usu_apellido_usuario">Apellidos </form:label></td>
                    <td><form:input style="width:350px" cssClass="form-control" path="usu_apellido_usuario"></form:input></td>
                </tr>
                <tr>
                    <td><form:label  path="usu_dir">Direccion de Usuario (Incluya municipio) </form:label></td>
                    <td><form:input style="width:350px" cssClass="form-control" path="usu_dir" value="Dpto, Municipio, Barrio, Direccion de residencia" ></form:input></td>
                </tr>
                <tr>
                    <td><form:label  path="usu_correo_vendedor">Correo Electronico </form:label></td>
                    <td><form:input style="width:350px" cssClass="form-control" path="usu_correo_vendedor"></form:input></td>
                </tr>
                <tr>
                    <td> <form:label  path="num_cel">Numero Celular</form:label></td>
                    <td><form:input style="width:350px" cssClass="form-control" path="num_cel"></form:input></td>
                </tr>
            </table><br>
            <center>
                <form:hidden path="rol" value="${rol}"></form:hidden>
                <form:hidden path="usu_id_usuario"></form:hidden>
                <form:button  class="botonA" name="enviar">Actualizar</form:button>
            </center>
        </form:form>
    </body>
</html>
