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
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="calendar/jquery.min.js"></script>
        <script type="text/javascript" src="calendar/jquery-ui.min.js"></script>
        <script type="text/javascript">
        jQuery(function($){
              $.datepicker.regional['es'] = {
                    closeText: 'Cerrar',
                    prevText: '&#x3c;Ant',
                    nextText: 'Sig&#x3e;',
                    currentText: 'Hoy',
                    monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                    'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                    monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                    'Jul','Ago','Sep','Oct','Nov','Dic'],
                    dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
                    dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
                    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
                    weekHeader: 'Sm',
                    dateFormat: 'dd/mm/yy',
                    firstDay: 1,
                    isRTL: false,
                    showMonthAfterYear: false,
                    yearSuffix: ''};
              $.datepicker.setDefaults($.datepicker.regional['es']);
        });    


        $(document).ready(function(){
           $("#datepicker1").datepicker({
               showOn: 'button',
               changeMonth: true,
               changeYear: true,
               buttonImageOnly: true,
               minDate: new Date(2014, 0, 1),
               buttonImage: 'imagenes/calendario.png'  });
           $("#datepicker2").datepicker({
               showOn: 'button',
               changeMonth: true,
               changeYear: true,
               buttonImageOnly: true,
               minDate: new Date(2014, 0, 1),
               buttonImage: 'imagenes/calendario.png'  });
           $("#datepicker").datepicker({
               showOn: 'button',
               changeMonth: true,
               changeYear: true,
               buttonImageOnly: true,
               minDate: new Date(2014, 0, 1),
               buttonImage: 'imagenes/calendario.png'  });
        }); 
        
                
        </script>
        <SCRIPT language="javascript">
            function SINO(cual) {
            var elElemento=document.getElementById(cual);
                if(elElemento.style.display == 'block') {
                    elElemento.style.display = 'none';
                } else {
                    elElemento.style.display = 'block';
                }
            };
        </SCRIPT>
    </head>
    <body>
        <h2 align="center">Asignar un Nuevo Presupuesto</h2>    
        <logic:present name="busqueda_error">
            <div align="center" class="alert alert-danger" id="alert">
                Error en la Busqueda
            </div>
        </logic:present>
        <div>   
        <logic:present name="consulta_realizada">           
            
        <h2>Tipos de Presupuestos segun busqueda indicada:</h2>

        <table border="1" cellpadding="0" cellspacing="0" width="40%">
        <thead>
        <tr>
            <th width="30px" align="center">
                <b><font size="2" >Código</font></b>
            </th>
            <th width="60px" align="center">                
                <b><font size="2" >Tipo</font></b>               
            </th>
            <th width="100px" align="center">
                <b><font size="2" >Descripción</font></b>                                                
            </th>
            <th width="80px" align="center">
                <b><font size="2" >Monto (BsF.)<br />(por asignar)</font></b>                               
            </th>
            <th width="100px" align="center">
                <b><font size="2" >Fecha</font></b>                                
            </th>
            <th width="100px" align="center">
                <b><font size="2" >Estado</font></b>                                
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
                <td width="80px" align="center">
                    <font size="2" ><bean:write name="Presupuesto" property="status"/></font>
                </td>
                
                
            </tr>                       
                
            </logic:iterate>
            
        </logic:present>
        </div>
    
</table>    
        
        
        <div id="demo1" style="display:none;">
        <br />
        <h2>Introduzca los datos del Tipo de Presupuesto para una Busqueda</h2>
        
        <html:form action="/form_buscar_TDP_Presupuesto" method="get">            
            <div id="welcome">
                <table border="0">                   
                            
                        
                    <tbody>                               
                        <tr>
                            <td>                          
                                
                                <font size="2" >Seleccione hasta cuatro (4) Tipos para la busqueda:</font>
                                    
                            </td>
                        </tr>                        

                        <tr>
                            <td>
                                
                                <font size="2" >Tipo 1:</font>
                                <html:select property="tipobusqueda1">
                                        <html:options collection="tipo" property="value" labelProperty="label" />
                                </html:select> 
                                
                                <font size="2" >Tipo 2:</font>
                                <html:select property="tipobusqueda2">
                                        <html:options collection="tipo" property="value" labelProperty="label" />
                                </html:select>   
                                
                                <font size="2" >Tipo 3:</font>
                                <html:select property="tipobusqueda3">
                                        <html:options collection="tipo" property="value" labelProperty="label" />
                                </html:select> 
                                
                                <font size="2" >Tipo 4:</font>
                                <html:select property="tipobusqueda4">
                                        <html:options collection="tipo" property="value" labelProperty="label" />
                                </html:select>
                                
                            </td>                                            
                        
                        </tr>                        
                            
                        <tr><td><input type="checkbox" name="tipo_todos" id="tipo_todos" value="Todos">TODOS</td></tr>
                        
                        <tr>
                            <td>
                                <font size="2" >Fecha (desde): </font><br />                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" property="fecha" name="datepicker1" id="datepicker1" readonly="readonly" size="12" />                                
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <font size="2" >Fecha (hasta): </font><br />                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" property="fecha" name="datepicker2" id="datepicker2" readonly="readonly" size="12" />                                
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="fecha" /> 
                            </td>
                        </tr>
                        
                    <td>                        
                        <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                            Buscar Presupuesto
                        </html:submit>
                        <!---< html:reset value="Limpiar" /> -->
                    </td>
                    </tr>
                    </tbody>
                    
                </table>   
            </div>     
        </html:form>
        </div>
        <hr color="#FF0000" noshade="noshade"/>        
        
        <h2>Introduzca los datos del presupuesto:</h2>

        <html:form action="/form_asignar_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <logic:notPresent name="busqueda">
                        <td><font size="2" >* Código de Tipo de Presupuesto: </font> <button type="button" href="javascript:void(0);" onclick="SINO('demo1')">Buscar Codigo</button></td>
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
                        </logic:notPresent>
                            
                        
                        <logic:present name="busqueda">
                            <td><font size="2" >* Código de Tipo de Presupuesto: </font><button type="button" href="javascript:void(0);" onclick="SINO('demo1')">Buscar Codigo</button></td>
                            <tr>
                                <td>
                                    
                                    
                                    <html:select name = "PresupuestoAsignado" property="codigo_TDP">
                                        <html:options collection="busqueda" property="value" labelProperty="label" />
                                    </html:select>
                                    
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    <b><font size="2">Selección de habilitados</font></b>
                                </td>
                                
                            </tr>
                            
                            <tr>
                                <td style="color: red">
                                    <html:errors property="codigo" /> 
                                </td>
                            </tr>
                            
                        </logic:present>     
                            
                        <td><font size="2" >* Código de Laboratorio:</font></td>
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
                            <td><font size="2" >* Monto (BsF.):</font></td>
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
                        <tr>
                            <td>
                                <font size="2" >* Fecha: </font><br />
                                
                            </td>
                        </tr>                        
                        <tr>
                            <td>
                                <input type="text" property="fecha" name="datepicker" id="datepicker" readonly="readonly" size="12" />                                
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="fecha" /> 
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

        <font size="1" >*Campos Obligatorios</font>
        
        <html:link action= "/consultar_presupuesto" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>


    </body>
</html>
