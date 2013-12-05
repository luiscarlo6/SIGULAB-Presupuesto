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
        <title>Cheques</title>
    </head>
    <body>
        <h1>
            Cheques:
        </h1>
        <table border="1" class="altrowstable" id="alternatecolor">
            <thead>
                <tr>
                    <th width="155px" align="center">
                        Código
                    </th>
                    <th width="155px" align="center">
                        Monto
                    </th>
                    <th width="155px" align="center">
                        Fecha
                    </th>
                    <th width="155px" align="center">
                        Status
                    </th>
                </tr>
            </thead>

            <logic:iterate name="cheque" id="Cheque">
                <tr>
                    <td width="155px" align="center">
                        <bean:write name="Cheque" property="codigo"/>
                    </td>
                    <td width="155px" align="center">
                        <bean:write name="Cheque" property="monto"/>
                    </td>
                    <td width="155px" align="center">
                        <bean:write name="Cheque" property="fecha"/>
                    </td>
                    <td width="155px" align="center">
                        <bean:write name="Cheque" property="status"/>
                    </td>
                </tr>    
            </logic:iterate>
        </table>
        <html:link action="/cheque">
            <h2>
                Volver
            </h2>
        </html:link>
    </body>
</html>
