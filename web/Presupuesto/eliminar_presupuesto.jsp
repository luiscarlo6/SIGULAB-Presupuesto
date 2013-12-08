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
        <h2>Introduzca los datos del presupuesto a eliminar</h2>

        <html:form action="/form3_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <tr>Indique el Codigo del presupuesto a eliminar:</tr>

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


                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de que desea eliminar este presupuesto?\n***se eliminara de la base de datos')">
                            Eliminar Presupuesto
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
