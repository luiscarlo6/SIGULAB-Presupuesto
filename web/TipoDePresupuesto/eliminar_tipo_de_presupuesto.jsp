<%-- 
    Document   : eliminar
    Created on : 29-nov-2013, 12:59:47
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
        <h2>Introduzca el codigo del presupuesto al que se le cambiara el status</h2>

        <html:form action="/form_eliminar_TDP">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <tr>Codigo del presupuesto:</tr>

                        <tr>
                            <td>
                                <html:text property="codigo" />
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <font size="2" ><bean:write name = "Presupuesto" property="error" filter="false" /></font>
                                &nbsp;
                            </td>
                        </tr>


                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de este cambio?\n***Estara desactivado a la vista***')">
                            Camdiar Status Presupuesto
                        </html:submit>
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
                    </tr>
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
