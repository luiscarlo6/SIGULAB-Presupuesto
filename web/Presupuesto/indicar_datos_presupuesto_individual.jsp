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
        
<logic:present name="consulta_realizada">        
        <h2>Presupuestos Existentes para el(los) laboratorio(s) indicado(s):
            
        </h2>

    <table border="1" class="altrowstable" >
    <thead>
        <tr>
            <th width="70px" align="center">
                <b><font size="2" >Código de Laboratorio</font></b>                
            </th>
            <th width="70px" align="center">
                <b><font size="2" >Código de Tipo de Presupuesto</font></b>
            </th>            
            <th width="70px" align="center">
                <b><font size="2" >Monto Asignado</font></b>                               
            </th>
            <th width="40px" align="center">
                <b><font size="2" >Observaciones</font></b>                                
            </th>
            <th width="40px" align="center">
                <b><font size="2" >Fecha</font></b>                                
            </th>                              
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="PresupuestoAsignado">
            <tr>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="codigo_lab"/></font>
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="codigo_TDP"/></font>
                </td>                
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="monto_asignado"/></font>
                </td>
                <td width="40px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="descripcion"/></font> 
                </td>
                <td width="40px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="fecha"/></font> 
                </td>                                
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
</logic:present>    


        <h2>Introduzca los datos del Laboratorio deseado:</h2>

        <html:form action="/form_indicar_codlab_consulta_individual_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <td><font size="2" >* Código de Laboratorio:</font></td>
                        <tr>
                            <td>
                                <html:select name = "PresupuestoAsignado" property="codigo_lab">
                                    <option value=""></option>
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
                                <html:errors property="codigo" /> 
                            </td>
                        </tr>                                                
                        
                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                            Realizar Consulta
                        </html:submit>
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
                    </tr>
                    </tbody>
                </table>   
            </div>     
        </html:form>

        <font size="1" >*Campos Obligatorios</font>
        
        <html:link action= "/consultar_presupuesto" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>

    <div align="center">   
        <html:link action="consultar_presupuesto"><font size="3" >Presupuesto</font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto"><font size="3" > Asignar </font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto_equitativo"> <font size="3" >Asignación Equitativa</font></html:link> <font size="3" > | </font>
        <!-- <html:link action="construccion"><font size="3" > Modificar</font></html:link> <font size="3" > | </font> -->
        <html:link action="consulta_totales"><font size="3" > Totales Asinados</font></html:link>
        <br />
        <br />
        <br />
        <br />
    </div>

    </body>
</html>
