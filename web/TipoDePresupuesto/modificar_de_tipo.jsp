<%-- 
    Document   : modificar
    Created on : 29-nov-2013, 9:03:10
    Author     : juanpe
á 
--%>

<% Object codOri = request.getAttribute("codigo");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGU-LAB</title>                  
    </head>
    <body>
        <logic:present name="modificacion_fallida">
            <div align="center" class="alert alert-danger" id="alert">
                Modificación de Tipo de Presupuesto Fallida, intente de nuevo.
            </div>
        </logic:present>
        <h2>Introduzca los datos del tipo de presupuesto a modificar:</h2>
        <html:form action="/form_parametros_nuevos_de_tipo">            
            <div id="welcome">
                <table border="0">
                    <tbody>         
                        <tr>
                            <td>
                                <div>
                                    <b><font size="2" >Tipo Actual: </font></b><br />
                                </div>
                                
                                <bean:write name="datosPres" property="tipo"/>        
                                <html:hidden name="datosPres" property="tipo" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div>
                                    <b><font size="2" >* Indique Tipo nuevo </font></b><br />
                                </div>
                                
                                <html:text name="datosPres" property="tipo_nuevo" />
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <html:errors property="tipo" /> 
                            </td>
                        </tr>
                                
                        <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de sus modificaciones?')">
                            Modificar Tipo
                        </html:submit>
                        <font size="1" >*Campos Obligatorios</font>
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
                    </tbody>
                </table>   
            </div>     
        </html:form>

        <html:link action= "/consultar_tipos" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>
    </body>
</html>

