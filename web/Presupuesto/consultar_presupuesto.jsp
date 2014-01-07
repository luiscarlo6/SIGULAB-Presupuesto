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
        <title>Presupuestos</title>
    </head>
    <body>        
        <h2>Presupuestos Existentes:</h2>

    <table border="1" class="altrowstable" >
    <thead>
        <tr>
            <th width="70px" align="center">
                <font size="2" >Código de Laboratorio</font>                
            </th>
            <th width="70px" align="center">
                <font size="2" >Código de Tipo de Presupuesto</font>
            </th>            
            <th width="70px" align="center">
                <font size="2" >Monto Asignado</font>                               
            </th>
            <th width="40px" align="center">
                <font size="2" >Fecha</font>                                
            </th>
            <th width="20px" align="center">
                <font size="2" >Accion</font>                                
            </th>
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="PresupuestoAsignado">
            <tr>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="codigo_lab"/></font>
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="codigo_TDP"/></font>
                </td>                
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="monto_asignado"/></font>
                </td>
                <td width="40px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="fecha"/></font> 
                </td>
                <td width="20px" align="center">   
                <font size="2" >
                    <html:link action= "/construccion" >
                        Modificar
                    </html:link></font>
                </td>  
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
</body>

</html>
