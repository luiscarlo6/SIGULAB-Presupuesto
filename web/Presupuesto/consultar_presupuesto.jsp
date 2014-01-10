<%-- 
    Document   : consultar
    Created on : 01/12/2013, 02:15:53 PM
    Author     : luiscarlo
--%>
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuestos</title>
    </head>
    <body>
        <logic:present name="agregado_equitativo_exitoso">
            <div align="center" class="alert alert-success" id="alert">
                Asignacion de Presupuesto de forma Equitativa Exitosa.
            </div>
        </logic:present>
        
        <logic:present name="agregado_exitoso">
            <div align="center" class="alert alert-success" id="alert">
                Presupuesto Agregado Exitosamente.
            </div>
        </logic:present>
        
        <logic:present name="desactivacion_exitosa">
            <div align="center" class="alert alert-success" id="alert">
                Desactivacion de Presupuesto Exitoso.
            </div>
        </logic:present>
        
        <logic:present name="modificacion_exitosa">
            <div align="center" class="alert alert-success" id="alert">
                Modificacion de Presupuesto Exitoso.
            </div>
        </logic:present>
        
        <logic:present name="modificacion_fallida">
            <div align="center" class="alert alert-danger" id="alert">
                Modificacion de Presupuesto Fallida, intente de nuevo.
            </div>
        </logic:present>
        
        
        <h2>Presupuestos Existentes:</h2>

    <table border="1" class="altrowstable" >
    <thead>
        <tr>
            <th width="50px" align="center">
                <font size="2" >Código de Laboratorio</font>                
            </th>
            <th width="50px" align="center">
                <font size="2" >Código de Tipo de Presupuesto</font>
            </th>            
            <th width="70px" align="center">
                <font size="2" >Monto Asignado</font>                               
            </th>
            <th width="40px" align="center">
                <font size="2" >Observaciones</font>                                
            </th>
            <th width="70px" align="center">
                <font size="2" >Fecha</font>                                
            </th>
            <th width="20px" align="center">
                <font size="2" >Accion</font>                                
            </th>                        
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="PresupuestoAsignado">
            <tr>
                <td width="50px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="codigo_lab"/></font>
                </td>
                <td width="50px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="codigo_TDP"/></font>
                </td>                
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="monto_asignado"/></font>
                </td>
                <td width="40px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="descripcion"/></font> 
                </td>
                <td width="70px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="fecha"/></font> 
                </td>  
                <td width="20px" align="center">   
                    <font size="2" >
                        <html:form action="/cambiar_status_presupuesto" onsubmit="return(this)" style="margin: 0px;">
                               <html:hidden name="PresupuestoAsignado" property="codigo_TDP" />
                               <html:hidden name="PresupuestoAsignado" property="codigo_lab" />
                               <html:hidden name="PresupuestoAsignado" property="id" />
                               <center>
                               <html:submit style="margin: 5px; padding: 3px; padding-left: 5px; padding-right: 5px;"
                                            onclick="javascript: return confirm('¿Está seguro de este cambio?\n***Estara desactivado a la vista***')">
                                    Desactivar
                               </html:submit>
                               </center>
                        </html:form>                   
                    </font>
                </td>             
            </tr>                       
                
        </logic:iterate>
    </div>
</table>
   <div align="center">     
        <html:link action="asignar_presupuesto"><font size="3" > Asignar </font></html:link> <font size="3" > | </font>
        <html:link action="asignar_presupuesto_equitativo"> <font size="3" >Asignacion Equitativa</font></html:link> <font size="3" > | </font>
        <!-- <html:link action="construccion"><font size="3" > Modificar</font></html:link> <font size="3" > | </font> --> 
        <html:link action="consulta_totales"><font size="3" > Totales Asinados</font></html:link> <font size="3" > | </font>
        <html:link action="consulta_individual"><font size="3" > Consulta Individual</font></html:link> 
        <br />
        <br />
        <br />
        <br />
    </div>
</body>

</html>
