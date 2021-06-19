<%-- 
    Document   : mostrarpersona
    Created on : 19-feb-2021, 11:26:20
    Author     : andre
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href='<c:url value="../css/gg.css" />' rel="stylesheet">                
        <link href='<c:url value="../css/gg1.css" />' rel="stylesheet">       
        <link href='<c:url value="../css/user.css" />' rel="stylesheet">       
        <link href='<c:url value="../css/perfiles.css" />' rel="stylesheet">       
        <link href='<c:url value="../fonts/chela.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fonts/changa.css"/>' rel="stylesheet" >
        <link href='<c:url value="../fontawesome/css/all.css"/>' rel="stylesheet" >
        <link href='<c:url value="https://fonts.gstatic.com"/>' rel="stylesheet" >
        <title>Vendedor || GreenGround</title>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    <script> 
   $(document).ready(function(){
    $('#e').DataTable({  
                         
    "language": {
    "lengthMenu": "Mostrar _MENU_ registros por pagina",
      //"info": "Mostrando pagina _PAGE_ de _PAGES_ / Mostrados: _START_ de _END_ ",
    "sInfo": "Mostrando: _START_ de _END_ - Total registros: _TOTAL_ ",
    "infoEmpty": "No hay registros disponibles",
    "infoFiltered": "(filtrada de _MAX_ registros)",
    "loadingRecords": "Cargando...",
    "processing": "Procesando...",
    "search": "Buscar:",
    "zeroRecords": "No se encontraron registros coincidentes",
    "paginate": {
    "next": "Siguiente",
    "previous": "Anterior"
  }
}
});
});
        </script>
        </head>
        


    </head>
    <body>
        <header>
            <c:forEach var="data" items="${person}" > 
            <div class="topnav" id="myTopnav">
                <a href="addprod.htm?id=${data.usu_id_usuario}" >Nuevo Producto <i class="fas fa-plus-circle"></i></a>
                <a href="sellprods.htm?id=${data.usu_id_usuario}" >Productos vendidos<i class="fas fa-clipboard-list"></i></a>
                <a class="activeOff" target="central" style="float:right" onclick="myFunction()">Cerrar Sesion  <i class="fas fa-power-off"></i></a>
                <a class="active1" target="central" style="float:right " onclick="myFunctionC()">Configuracion <i class="fas fa-users-cog"></i></a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
            </div>
                </header>
                
                <section>
                <br><br><br><br>
                <CENTER><h1><b>¡Bienvenido, Vendedor!</b></h1></CENTER>
                <br><br><br><br><br><br>
                <div align="center">
                    <img src="../img/usuario.png" width="180" height="180" class="user">
                </div>
                <br><br><br><br><br><br>
                <div class="wrap-user">
                    <table align="center" border="1px">
                        <tr id="firstrow">
                            <th>Nombre Completo</th>
                            <th>Ubicacion</th>
                            <th>Numero Celular</th>
                            <th>Dirreccion</th>
                            <th>Correo Electronico</th>
                        </tr>
                        <tr>
                            <td><c:out value="${data.usu_nombre} ${data.usu_apellido}"></c:out></td>
                            <td><c:out value="${data.usu_dir}"></c:out></td>
                            <td><c:out value="${data.num_cel}"></c:out></td>
                            <td><c:out value="${data.usu_dir}"></c:out></td>
                            <td><c:out value="${data.usu_correo}"></c:out></td>
                            </tr>
                        </table>
                    </div>

                </section>
                <br> <br> <br>
        <div class="container" style="width: 100%;" >
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-body"><center>
                                 <table id="e" class="table table-striped table-bordered" >  
                                    <thead>
                                    
                                    <th><h4> nombre</h4> </th>
                                    <th><h4> foto</h4></th>
                                    <th><h4> descripcion </h4></th>
                                    <th><h4> precio </h4></th>
                                    <th><h4> stock </h4></th>
                                    <th ><h4> fecha de lote </h4></th>
                                    <th><h4> fecha de vencimiento</h4></th>
                                    <th><h4> acciones </h4></th>
                                    
                                    </thead>
                                    <tbody>      
                                        <c:forEach var="dato" items="${product}" > 
                                        <tr>
                                            <td><c:out value="${dato.Pro_Nombre}"></c:out> </td>   
                                            <td><c:out value="${dato.Pro_Foto}"></c:out> </td>
                                            <td><c:out value="${dato.Pro_Descripcion}"></c:out> </td>
                                            <td><c:out value="${dato.Pro_Precio}"></c:out> </td>
                                            <td><c:out value="${dato.Pro_Stock}"></c:out> </td>
                                            <td><c:out value="${dato.pro_fecha_lote}"></c:out> </td>
                                            <td><c:out value="${dato.pro_fecha_vencimiento}"></c:out> </td>
                                            <td><a href="modprod.htm?id=${data.usu_id_usuario}&idPro=${dato.IdProducto}"><input type="button" value="modificar" class="btn btn-primary" /></a>
                                            <a href="delprod.htm?id=${dato.usu_id}&idPro=${dato.IdProducto}"><input type="button" value="borrar" class="btn btn-danger" /></a></td>
                                        </tr>
                                        </tbody> 
                                    </c:forEach>
                                        </c:forEach>
                            </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>