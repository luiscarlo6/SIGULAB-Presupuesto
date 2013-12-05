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

        <html:form action="/form1_cheque">            
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
                            <td>Monto:</td>
                        </tr>
                        <tr>
                            <td>
                                <html:text property="monto" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="monto" /> 
                            </td>
                        </tr>

                        <tr>
                            <td>Fecha de Emision:</td>
                        </tr>
                        <tr>
                            <td>
                                <html:text property="fecha" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="fecha" /> 
                            </td>
                        </tr>
                        
                         <tr>
                            <td>Status:</td>
                        </tr>
                        <tr>
                            <td>
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
                        <html:submit value="Agregar" />
                        <html:reset value="Limpiar" />
                    </td>
                    </tr>
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
