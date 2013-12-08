<%-- 
    Document   : consultar
    Created on : 01/12/2013, 02:15:53 PM
    Author     : luiscarlo
--%>
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
        <h1>
            Presupuestos:
        </h1>

<table border="1" class="altrowstable" id="alternatecolor">
    <thead>
        <tr>
            <th width="155px" align="center">
                Código
            </th>
            <th width="155px" align="center">
                Tipo
            </th>
            <th width="155px" align="center">
                Descripción
            </th>
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="Presupuesto">
            <tr>
                <td width="155px" align="center">
                    <bean:write name="Presupuesto" property="codigo"/>
                </td>
                <td width="155px" align="center">
                    <bean:write name="Presupuesto" property="tipo"/>
                </td>
                <td width="155px" align="center">
                    <bean:write name="Presupuesto" property="descripcion"/>
                </td>
                
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
</body>
</html>
