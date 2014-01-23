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
        <h2>Introduzca los datos del Tipo de Presupuesto:</h2>

        <html:form action="/form_agregar_TDP">            
            <div id="welcome">
                <table border="0">                   
                            
                        
                    <tbody>                               
                        <tr>
                            <td><font size="2" >* Tipo:</font>
                                
                            </td>                                            
                        
                        </tr>
                        <tr>
                            <td>
                                <html:select property="tipo">
                                        <html:options collection="tipo" property="value" labelProperty="label" />
                                </html:select> 
                                                         
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="tipo" /> 
                            </td>
                        </tr>

                        <tr>
                            <td><font size="2" >Descripción:</font></td>
                        </tr>
                        <tr>
                            <td>
                                <html:text property="descripcion" />
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
                                <html:text property="monto" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="color: red">
                                <html:errors property="monto" /> 
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
                            Agregar Tipo de Presupuesto
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
