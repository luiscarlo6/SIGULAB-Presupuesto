<%-- 
    Document   : modificar
    Created on : 29-nov-2013, 9:03:10
    Author     : juanpe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGU-LAB</title>
    </head>
    <body>
        <h2>Introduzca los datos del presupuesto a modificar:</h2>
        
        <html:form action="/form_indicar_codigoTDP">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <tr>Codigo:</tr>

                        <tr>
                            <td>
                                <html:text name="Presupuesto" property="codigo" />
                            </td>
                        </tr>               
                        <tr>
                            <td style="color: red">
                                <font size="2" ><bean:write name = "Presupuesto" property="error" filter="false" /></font>
                                &nbsp;
                            </td>

                            
                        </tr>
                        
                       
                    <td>
                        <html:submit value="Modificar" />
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
                    </tbody>
                </table>   
            </div>     
        </html:form>

        <html:link action= "/consultar_TDP" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>
    </body>
</html>