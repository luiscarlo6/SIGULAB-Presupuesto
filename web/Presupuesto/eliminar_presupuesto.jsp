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
        <h2>Introduzca el los siguientes datos:</h2>

        <html:form action="/form_eliminar_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <td><font size="2" >Codigo de tipo de presupuesto:</font></td>

                        <tr>
                            <td>
                                <html:text name = "PresupuestoAsignado" property="codigo_TDP" />
                            </td>
                        </tr>               
                        <tr>
                            <td style="color: red">
                                <html:errors property="codigo" /> 
                            </td>                            
                        </tr>

                        
                        <td><font size="2" >Codigo de laboratorio asociado:</font></td>

                        <tr>
                            <td>
                                <html:text name = "PresupuestoAsignado" property="codigo_lab" />
                            </td>
                        </tr>               
                        <tr>
                            <td style="color: red">
                                <html:errors property="codigo_lab" /> 
                            </td>
                        </tr>

                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de este cambio?\n***Estara desactivado a la vista***')">
                            Cambiar Status Presupuesto
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
                <font size="2" >Volver</font>
            </h2>
        </html:link>

    </body>
</html>
