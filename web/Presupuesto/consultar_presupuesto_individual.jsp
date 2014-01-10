<%-- 
    Document   : consultar
    Created on : 01/12/2013, 02:15:53 PM
    Author     : luiscarlo
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
        <title>Presupuestos</title>
    </head>
    <body>        
        <h2>Presupuestos Existentes para el laboratorio:
            <bean:write name="PresupuestoAsignado" property="codigo_lab"/>
        </h2>

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
                <font size="2" >Observaciones</font>                                
            </th>
            <th width="40px" align="center">
                <font size="2" >Fecha</font>                                
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
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="descripcion"/></font> 
                </td>
                <td width="40px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="fecha"/></font> 
                </td>                                
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
    <div align="center">   
        <html:link action="consultar_presupuesto"><font size="3" >Presupuesto</font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto"><font size="3" > Asignar </font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto_equitativo"> <font size="3" >Asignacion Equitativa</font></html:link> <font size="3" > | </font>
        <!-- <html:link action="construccion"><font size="3" > Modificar</font></html:link> <font size="3" > | </font> -->
        <html:link action="consulta_totales"><font size="3" > Totales Asinados</font></html:link>
        <br />
        <br />
        <br />
        <br />
    </div>
</body>

</html>
