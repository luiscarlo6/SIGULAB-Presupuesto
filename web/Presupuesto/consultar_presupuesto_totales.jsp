<%-- 
    Document   : consulta_laboratorios
    Created on : 04-ene-2014, 12:47:03
    Author     : juanpe
--%>

<link rel="stylesheet" type="text/css" href="css/estilo.css">
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
        <h2>Presupuesto Asignado por Laboratorios:</h2>

    <table border="1" class="altrowstable" id="alternatecolor">
    <thead>
        <tr>
            <th width="70px" align="center">
                <font size="2" >Código</font>                
            </th>
            <th width="70px" align="center">
                <font size="2" >Nombre</font>                               
            </th>
            <th width="70px" align="center">
                <font size="2" >Monto total asignado</font>                               
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
</body>

</html>
