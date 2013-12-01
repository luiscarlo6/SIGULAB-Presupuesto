<%-- 
    Document   : agregar
    Created on : 28-nov-2013, 21:41:52
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
        <title>SIGU-LAB</title>
    </head>
    <body>
        <h2>Introduzca los siguientes datos:</h2>

        <html:form action="/form1">            
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
                            <td>Tipo:</td>
                        </tr>
                        <tr>
                            <td>
                                <html:text property="tipo" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="tipo" /> 
                            </td>
                        </tr>

                        <tr>
                            <td>Descripcion:</td>
                        </tr>
                        <tr>
                            <td>
                                <html:text property="descripcion" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="descripcion" /> 
                            </td>
                        </tr>

                    <td>
                        <html:submit value="Agregar" />
                        <html:reset value="Limpiar" />
                    </td>
                    </tr>
                    </tbody>
                </table>   
            </div>     
        </html:form>

        <html:link action= "/Welcome" >
            <h2>
                Volver
            </h2>
        </html:link>


    </body>
</html>
