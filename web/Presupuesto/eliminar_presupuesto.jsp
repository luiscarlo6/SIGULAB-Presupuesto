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
                                <html:errors property="codigo" /> 
                            </td>
                        </tr>


                    <td>
                        <html:submit value="Eliminar" />
                        <html:reset value="Limpiar" />
                    </td>
                    </tr>
                    </tbody>
                </table>   
            </div>     
        </html:form>
        <html:link action= "/presupuesto" >
            <h2>
                Volver
            </h2>
        </html:link>

    </body>
</html>
