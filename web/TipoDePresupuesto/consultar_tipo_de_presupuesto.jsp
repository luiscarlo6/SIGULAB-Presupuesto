<%-- 
    Document   : consultar
    Created on : 01/12/2013, 02:15:53 PM
    Author     : luiscarlo
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
        <title>Tipos de Presupuestos</title>
    </head>
    <body>        
        <h2>Tipos de Presupuestos Existentes:</h2>

    <table border="1" class="altrowstable" id="alternatecolor">
    <thead>
        <tr>
            <th width="50px" align="center">
                <font size="2" >Código</font>
            </th>
            <th width="70px" align="center">
                <font size="2" >Tipo</font>                
            </th>
            <th width="100px" align="center">
                <font size="2" >Descripción</font>                                                
            </th>
            <th width="70px" align="center">
                <font size="2" >Monto (por asignar)</font>                               
            </th>
            <th width="100px" align="center">
                <font size="2" >Fecha</font>                                
            </th>
            <th width="30px" align="center">
                <font size="2" >Accion</font>                                
            </th>
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="Presupuesto">
            <tr>
                <td width="50px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="codigo"/></font>
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="tipo"/></font>
                </td>
                <td width="100px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="descripcion"/></font>
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="monto"/></font>
                </td>
                <td width="100px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="dia"/></font> /               
                    <font size="2" ><bean:write name="Presupuesto" property="mes"/></font> /
                    <font size="2" ><bean:write name="Presupuesto" property="ano"/></font>
                </td>
                <td width="30px" align="center">   
                <font size="2" ><html:link action= "/construccion" >
                    Modificar
                </html:link></font>
                </td>  
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
</body>

</html>
