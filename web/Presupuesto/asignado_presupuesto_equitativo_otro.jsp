<%-- 
    Document   : agregado
    Created on : 28-nov-2013, 17:40:02
    Author     : juanpe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregando Presupuesto</title>
    </head>
    <body>
        <h1>NOTA: </h1>
        <tr>
            <td style="color: red">
                <html:errors property="check"/>                 
            </td>
        </tr>
        
        <h5>Por lo tanto <font size="4" color="black">NO</font> se ha agregado nada.</h5>
        
        <html:link action= "/consultar_presupuesto" >
            <h2>
                Volver
            </h2>
        </html:link>
    </body>
</html>
