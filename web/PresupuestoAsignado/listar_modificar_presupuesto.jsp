<%-- 
    Document   : modificar
    Created on : 29-nov-2013, 9:03:10
    Author     : juanpe

--%>

<% Object codOri = request.getAttribute("codigo_TDP");%>

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
        <logic:present name="busqueda_error">
            <div align="center" class="alert alert-danger" id="alert">
                Error en la Búsqueda
            </div>
        </logic:present>
        <div>   
        <logic:present name="consulta_realizada">           
            
        <h2>Presupuestos según búsqueda solicitada:</h2>

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
        <h2>Introduzca los datos del Presupuesto para una Búsqueda</h2>
        
        <html:form action="/form_buscar_TDP_Presupuesto_modificacion" method="get">            
            <div id="welcome">
                <table border="0">                   
                            
                        
                    <tbody>                               
                        <tr>
                            <td>                          
                                
                                <font size="2" >Seleccione hasta cuatro (4) Tipos para la búsqueda:</font>
                                    
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
                        
                        <html:hidden name= "datosPres" property="id" />
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
        
        <logic:present name="modificacion_fallida">
            <div align="center" class="alert alert-danger" id="alert">
                Modificación de Presupuesto Fallida, intente de nuevo.
            </div>
        </logic:present>
        
        <h2>Introduzca los datos del presupuesto a modificar:</h2>
        
        <html:form action="/form_parametros_nuevos_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>                        
                        <tr>                            
                            <td>
                                
                                <b><font size="2" >Presupuesto a modificar con código de laboratorio:</font></b> <br />
                                    
                                <font size="2" style="color: blue">
                                    <bean:write name="datosPres" property="codigo_lab"/>
                                    
                                </font>    
                                
                            </td>
                        </tr> 
                        
                        
                        <td><font size="2" >* NUEVO Código de Laboratorio:</font></td>
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
                        
                        
                        
                        
                        
                        <logic:notPresent name="busqueda">
                        <td><font size="2" >* Presupuesto a modificar con código de Presupuesto: </font> <button type="button" href="javascript:void(0);" onclick="SINO('demo1')">Buscar Código</button></td>
                            <tr>
                                <td>
                                  <html:text name = "datosPres" property="codigo_TDP" />
                                </td>
                            </tr>               
                            <tr>
                                <td style="color: red">
                                    <html:errors property="codigo" /> 
                                </td>
                            </tr>
                        </logic:notPresent>
                            
                        
                        <logic:present name="busqueda">
                            <td><font size="2" >* Opciones de código de Presupuesto: </font><button type="button" href="javascript:void(0);" onclick="SINO('demo1')">Buscar Código</button></td>
                            <tr>
                                <td>
                                    <html:select name = "datosPres" property="codigo_TDP">
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
                        
                        
                        
                        <tr>
                            <td>
                                <div>
                                    <b><font size="2" >Observaciones:</font></b><br />
                                </div>
                                <html:text name="datosPres" property="descripcion" />
                            </td>
                        </tr>  
                        
                        <tr>
                            <td style="color: red">
                                <html:errors property="descripcion" /> 
                            </td>
                        </tr>
                        
                        
                        <tr>
                        <td style="color: red">
                        <b><font size="2" color="black" >* Monto (BsF.):</font></b>
                        <br />
                             <font size="2" >**Nota: si el monto lleva decimales<br /> utilizar punto (.) y no coma (,)</font>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <html:text name="datosPres" property="monto_asignado" />
                            </td>
                        </tr>
                                                
                        <tr>
                            <td style="color: red">
                                <html:errors property="monto" /> 
                            </td>
                        </tr>
                        
                        <tr>
                             <td>
                             <b><font size="2" >Fecha Actual:</font></b><br />                             
                             <font size="2" style="color: blue">
                                <bean:write name="datosPres" property="fecha"/>
                             </font>
                             </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <b><font size="2" >* Seleccione Fecha Nueva:</font></b>
                            </td>
                        </tr>    
                        <tr>
                            <td>                                
                                <input type="text" property="fecha" name="datepicker" id="datepicker" readonly="readonly" size="12"/>                                
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="fecha" /> 
                            </td>
                        </tr>
                        <html:hidden name= "datosPres" property="id" />
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
        <font size="1" >*Campos Obligatorios</font>
        <html:link action= "/consultar_TDP" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>
    </body>
</html>