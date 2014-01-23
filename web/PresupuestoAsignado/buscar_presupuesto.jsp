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
        }); 
        
                
        </script>
    </head>
    <body>
     <div>   
    <logic:present name="consulta_realizada">           
            
            <h2>Presupuestos Existentes:</h2>

    <table border="1" class="altrowstable" >
    <thead>
        <tr>
            <th width="50px" align="center">
                <b><font size="2" >Código de Laboratorio</font></b>                
            </th>
            <th width="50px" align="center">
                <b><font size="2" >Código de Tipo de Presupuesto</font></b>
            </th>            
            <th width="70px" align="center">
                <b><font size="2" >Monto Disponible (BsF.)</font></b>                               
            </th>
            <th width="40px" align="center">
                <b><font size="2" >Observaciones</font></b>                                
            </th>
            <th width="70px" align="center">
                <b><font size="2" >Fecha</font></b>                                
            </th>                                  
            <th width="100px" align="center">
                <b><font size="2" >Estado</font></b>                                
            </th>
        </tr>
    </thead>
    <div float:left>
        <logic:iterate name="presupuesto" id="PresupuestoAsignado">
            <tr>
                <td width="50px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="nombrelab"/></font>
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
                <td width="80px" align="center">
                    <font size="2" ><bean:write name="PresupuestoAsignado" property="status"/></font>
                </td>
            </tr>                       
                
        </logic:iterate>
    </div>
</table>    
</logic:present>        
        

        <br />
        <h2>Introduzca los datos del Presupuesto para una Busqueda</h2>
        
        <html:form action="/form_buscar_presupuesto" method="get">            
            <div id="welcome">
                <table border="0">                   
                            
                        
                    <tbody>                               
                        <tr>
                            <td><font size="2" >Código de Laboratorio</font>                                
                            </td>                                            
                        
                        </tr>
                        <tr>
                            <td>                          
                            <input type="checkbox" name="ulab" id="ulab" value="01050301">01050301 ULAB
                            <br>
                            <input type="checkbox" name="laba" id="laba" value="01050303">01050303 Lab A
                            <br>
                            <input type="checkbox" name="labb" id="labb" value="01050304">01050304 Lab B
                            <br>
                            <input type="checkbox" name="labc" id="labc" value="01050305">01050305 Lab C
                            <br>
                            <input type="checkbox" name="labd" id="labd" value="01050306">01050306 Lab D
                            <br>
                            <input type="checkbox" name="labe" id="labe" value="01050307">01050307 Lab E
                            <br>
                            <input type="checkbox" name="labf" id="labf" value="01050308">01050308 Lab F
                            <br>
                            <input type="checkbox" name="labg" id="labg" value="01050309">01050309 Lab G
                            
                            
                            </td>
                        </tr>                        

                        
                        
                        
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

        <font size="1" >*Campos Obligatorios</font>
        
        <html:link action= "/consultar_TDP" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>


    </body>
</html>
