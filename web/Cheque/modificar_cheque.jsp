<%-- 
    Document   : modificar_cheque
    Created on : 04-dic-2013, 20:29:30
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
        <title>Modificar Cheque</title>
    </head>
    <body>
        <h2>Introduzca los siguientes datos del Cheque:</h2>

        <html:form action="/form2_cheque">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <tr>Codigo:</tr>

                        <tr>
                            <td>
                                <html:text property="codigo" />
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <html:errors property="codigo" /> 
                            </td>
                        </tr>
                        <tr>
                            <td>Nuevo Status 
                        
                                <html:select property="status">
                                    <option value="custodia">custodia</option>
                                    <option value="entregado">entregado</option>
                                    <option value="rechazado">rechazado</option>
                                </html:select> 
                                
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="status" /> 
                            </td>
                        </tr>

                    <td>
                        <html:submit value="Modificar" />
                        <html:reset value="Limpiar" />
                    </td>
                    </tbody>
                </table>   
            </div>     
        </html:form>

        <html:link action= "/cheque" >
            <h2>
                Volver
            </h2>
        </html:link>
    </body>
</html>
