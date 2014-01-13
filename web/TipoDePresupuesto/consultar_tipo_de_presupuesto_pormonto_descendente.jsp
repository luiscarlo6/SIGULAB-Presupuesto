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
        <title>Tipos de Presupuestos</title>
    </head>
    <body>       
        <logic:present name="agregado_exitoso">
            <div align="center" class="alert alert-success" id="alert">
                Tipo de Presupuesto Agregado Exitosamente.
            </div>
        </logic:present>
        
        <logic:present name="desactivacion_exitosa">
            <div align="center" class="alert alert-success" id="alert">
                Desactivación de Tipo de Presupuesto Exitoso.
            </div>
        </logic:present>
        
        <logic:present name="modificacion_exitosa">
            <div align="center" class="alert alert-success" id="alert">
                Modificación de Tipo de Presupuesto Exitoso.
            </div>
        </logic:present>
        
        <logic:present name="modificacion_fallida">
            <div align="center" class="alert alert-danger" id="alert">
                Modificación de Tipo de Presupuesto Fallida, intente de nuevo.
            </div>
        </logic:present>

        <h2>Tipos de Presupuestos Existentes:</h2>

    <table border="1" cellpadding="0" cellspacing="0" width="40%">
    <thead>
        <tr>
            <th width="30px" align="center">
                <b><html:link  action="consultar_TDP"><font size="2" >Código</font> </html:link></b>
            </th>
            <th width="60px" align="center">                
                <b><html:link  action="consultar_TDP_tipo"><font size="2" >Tipo</font> </html:link></b>               
            </th>
            <th width="100px" align="center">
                <b><font size="2" >Descripción</font></b>                                                
            </th>
            <th width="80px" align="center">
                <b><html:link  action="consultar_TDP_monto"><font size="2" >Monto<br /></html:link>(por asignar)</font></b>                               
            </th>
            <th width="100px" align="center">
                <b><font size="2" >Fecha</font></b>                                
            </th>
            <th width="30px" align="center">
                <b><font size="2" >Desactivación</font></b>                                
            </th>
            <th width="30px" align="center">
                <b><font size="2" >Modificación</font></b>                                
            </th>
            
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="Presupuesto">
            <tr>
                <td width="30px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="codigo"/></font>
                </td>
                <td width="60px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="tipo"/></font>
                </td>
                <td width="100px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="descripcion"/></font>
                </td>
                <td width="80px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="monto"/></font>
                </td>
                <td width="80px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="fecha"/></font>
                </td>
                <td width="30px" align="center">   
                    <font size="2" >
                        <html:form action="/cambiar_status_TDP_monto" onsubmit="return(this)" style="margin: 0px;">
                               <html:hidden name="Presupuesto" property="codigo" />
                               <center>
                               <html:submit style="margin: 5px; padding: 3px; padding-left: 5px; padding-right: 5px;"
                                            onclick="javascript: return confirm('¿Está seguro de este cambio?\n***Estara desactivado a la vista***')">
                                    Desactivar
                               </html:submit>
                               </center>
                        </html:form>                   
                    </font>
                </td>
                <td width="30px" align="center">   
                    <font size="2" >
                        <html:form action="/modificar_TDP_monto" onsubmit="return(this)" style="margin: 0px;">
                               <html:hidden name="Presupuesto" property="codigo" />
                               <center>
                               <html:submit style="margin: 5px; padding: 3px; padding-left: 5px; padding-right: 5px;">
                                    Modificar
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
        <html:link  action="agregar_TDP"><font size="3" >Agregar Nuevo </font></html:link>  
    </div>
    
    <br />
    <br />
    <br />
    <br />
</body>

</html>
