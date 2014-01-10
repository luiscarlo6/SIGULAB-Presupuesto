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
        <h2>Introduzca los datos del presupuesto:</h2>

        <html:form action="/form_asignar_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <td><font size="2" >Codigo de Tipo de Presupuesto:</font></td>
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
                        <td><font size="2" >Codigo de Laboratorio:</font></td>
                        <tr>
                            <td>
                                <html:select name = "PresupuestoAsignado" property="codigo_lab">
                                    <option value=" "></option>
                                    <option value="01050301">01050301 ULAB</option>
                                    <option value="01050303">01050303 Lab A</option>
                                    <option value="01050304">01050304 Lab B</option>
                                    <option value="01050305">01050305 Lab C</option>
                                    <option value="01050306">01050306 Lab D</option>
                                    <option value="01050307">01050307 Lab E</option>
                                    <option value="01050308">01050308 Lab F</option>
                                    <option value="01050309">01050309 Lab G</option>                                                                        
                                </html:select> 
                            </td>
                        </tr>               
                        <tr>
                            <td style="color: red">
                                <html:errors property="codigo_lab" /> 
                            </td>
                        </tr>
                        
                        <tr>
                            <td><font size="2" >Monto Asignado:</font></td>
                        </tr>
                        <tr>
                            <td>
                                <html:text name = "PresupuestoAsignado" property="monto_asignado" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="monto" /> 
                            </td>
                        </tr>
                            
                        <tr>
                            <td><font size="2" >Observaciones:</font></td>
                        </tr>
                        <tr>
                            <td>
                                <html:text name = "PresupuestoAsignado" property="descripcion" />
                            </td>
                        </tr>
                        
                        
                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                            Asignar Presupuesto
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
