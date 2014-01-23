<%-- 
    Document   : agregar
    Created on : 28-nov-2013, 21:41:52
    Author     : juanpe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
        <h2>Introduzca el nuevo tipo a agregar</h2>

        <html:form action="/form_agregar_nuevo_tipo">            
            <div id="welcome">
                <table border="0">                   
                            
                        
                    <tbody>                               
                        <tr>
                            <td><font size="2" >* Tipo:</font>
                                
                            </td>                                            
                        
                        </tr>
                        <tr>
                            <td>
                                <html:text property="tipo"/>                                    
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="tipo" /> 
                            </td>
                        </tr>
                    <tr>
                        <td>
                            <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                                Agregar Nuevo Tipo
                            </html:submit>
                            <!---< html:reset value="Limpiar" /> -->
                        </td>
                    </tr>
                    </tbody>
                    
                </table>   
            </div>     
        </html:form>

        <font size="1" >*Campos Obligatorios</font>
        
        <html:link action= "/consultar_tipos" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>


    </body>
</html>
