<%-- 
    Document   : agregado
    Created on : 28-nov-2013, 17:40:02
    Author     : juanpe
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregando Tipo de Presupuesto</title>
    </head>
    <body>
        <h1>Agregado Exitosamente!</h1>
        <html:link action= "/consultar_TDP" >
            <h2>
                Volver
            </h2>
        </html:link>
    </body>
</html>
