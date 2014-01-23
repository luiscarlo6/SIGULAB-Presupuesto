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
          $("#datepicker").datepicker({
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
        <logic:present name="modificacion_fallida">
            <div align="center" class="alert alert-danger" id="alert">
                Modificación de Tipo de Presupuesto Fallida, intente de nuevo.
            </div>
        </logic:present>
        <h2>Introduzca los datos del presupuesto a modificar:</h2>
        <html:form action="/form_parametros_nuevos_TDP">            
            <div id="welcome">
                <table border="0">
                    <tbody>                        
                        <tr>                            
                            <td>
                                
                                <b><font size="2" >Tipo de Presupuesto a modificar con código:</font></b> <br />
                                    
                                <font size="2" style="color: blue">
                                    <bean:write name="datosPres" property="codigo"/>
                                    <html:hidden name="datosPres" property="codigo" />
                                </font>    
                                
                            </td>
                        </tr>               
                                                
                            <td>
                                <div>
                                    <b><font size="2" >Tipo Actual:</font></b><br />                                    
                                    <font size="2" style="color: blue">
                                        <bean:write name="datosPres" property="tipo"/>
                                    </font>
                                    
                                </div>
                                    
                                    <br />
                                <div>
                                        <b><font size="2" >Seleccione Tipo Nuevo:</font></b><br />
                                        <html:select property="tipo">
                                            <html:options collection="tipo" property="value" labelProperty="label" />
                                        </html:select> 
                                                                
                                </div>
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
                                <div>
                                    <b><font size="2" >Descripción:</font></b><br />
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
                        <b><font size="2" color="black" >Monto:</font></b>
                        <br />
                             <font size="2" >**Nota: si el monto lleva decimales<br /> utilizar punto (.) y no coma (,)</font>
                        </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <html:text name="datosPres" property="monto" />
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
                                <b><font size="2" >Seleccione Fecha Nueva:</font></b>
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

        <html:link action= "/consultar_TDP" >
            <h2>
                <font size="2" >Volver</font>
            </h2>
        </html:link>
    </body>
</html>

