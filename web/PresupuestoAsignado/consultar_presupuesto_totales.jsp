<%-- 
    Document   : consulta_laboratorios
    Created on : 04-ene-2014, 12:47:03
    Author     : juanpe
--%>

<link rel="stylesheet" type="text/css" href="css/estilo.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Totales</title>
    </head>
    <body>        
        <h2>Presupuesto Disponible por Laboratorios:</h2>

    <table border="1">
    <thead>
        <tr>
            <th width="70px" align="center">
                <b><font size="2" >Código</font></b>                
            </th>
            <th width="70px" align="center">
                <b><font size="2" >Nombre</font></b>                               
            </th>
            <th width="70px" align="center">
                <b><font size="2" >Monto total disponible (BsF.)</font></b>                               
            </th>            
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="Laboratorio">
            <tr>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="Laboratorio" property="codigo_lab"/></font>
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="Laboratorio" property="nombre"/></font>
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="Laboratorio" property="monto"/></font>
                </td>
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
    <div align="center">   
        <html:link action="consultar_presupuesto"><font size="3" >Presupuesto</font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto"><font size="3" > Asignar </font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto_equitativo"> <font size="3" >Asignación Equitativa</font></html:link> <font size="3" > | </font>        
        <html:link action="buscar_presupuesto"><font size="3" > Busqueda Especifica</font></html:link>
        <br />
        <br />
        <br />
        <br />
    </div>
        
</body>

</html>
