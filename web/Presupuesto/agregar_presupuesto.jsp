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
        <h2>Introduzca los datos del presupuesto:</h2>

        <html:form action="/form1_presupuesto">            
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
                                <bean:write name = "Presupuesto" property="error" filter="false" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>Tipo:
                        
                                <html:select property="tipo">
                                    <option value="FUNINDES">FUNINDES</option>
                                    <option value="FONACIT">FONACIT</option>
                                    <option value="Donacion">Donacion</option>
                                    <option value="Ordinario">Ordinario</option>
                                    <option value="Delegado">Delegado</option>
                                </html:select> 
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
                        <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                            Agregar Presupuesto
                        </html:submit>
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
                    </tr>
                    </tbody>
                </table>   
            </div>     
        </html:form>

        <html:link action= "/consultar_presupuesto" >
            <h2>
                Volver
            </h2>
        </html:link>


    </body>
</html>
