<%-- 
    Document   : modificar
    Created on : 29-nov-2013, 9:03:10
    Author     : juanpe
--%>

<% Object codOri = request.getAttribute("codigo");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2>Introduzca los datos del presupuesto a modificar:</h2>
        <html:form action="/form4_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        

                        <tr>
                            
                            <td>
                                <div>Codigo Actual:</div>
                                <bean:write name="datosPres" property="codigo"/>
                                
                            </td>
                        </tr>               
                        <tr>
                           
                            <td style="color: red">
                                <html:errors property="tipo" /> 
                            </td>
                        </tr>
                        

                        <tr>
                            
                            <td>
                                <div>Codigo Nuevo:</div>
                                <html:hidden name="datosPres" property="codigo" />
                                <html:text name="datosPres" property="codigo_nuevo" />
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <bean:write name = "Presupuesto" property="error" filter="false" />
                                &nbsp;
                            </td>
                        </tr>
                        
                        

                        <tr>
                            <td>
                                <div>
                                    Tipo:
                                </div>
                                
                                <html:select name="datosPres" property="tipo">
                                    <option value="FUNINDES">FUNINDES</option>
                                    <option value="FONACIT">FONACIT</option>
                                    <option value="Donacion">Donacion</option>
                                    <option value="Ordinario">Ordinario</option>
                                    <option value="Delegado">Delegado</option>
                                </html:select> 
                                
                                <!--< html:text name="datosPres" property="tipo" />-->
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <html:errors property="tipo" /> 
                            </td>
                        </tr>
                        
                        

                        <tr>
                            <td>
                                <div>Descripcion:</div>
                                <html:text name="datosPres" property="descripcion" />
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <html:errors property="descripcion" /> 
                            </td>
                        </tr>
                        
                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de sus modificaciones?')">
                            Modificar Presupuesto
                        </html:submit>
                        
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
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