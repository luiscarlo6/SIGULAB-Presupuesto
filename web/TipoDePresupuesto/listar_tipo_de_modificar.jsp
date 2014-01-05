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
        <html:form action="/form_parametros_nuevos_TDP">            
            <div id="welcome">
                <table border="0">
                    <tbody>                        
                        <tr>                            
                            <td>
                                
                                <b><font size="2" >Tipo de Presupuesto a modificar con codigo:</font></b> <br />
                                    
                                <font size="2" style="color: blue">
                                    <bean:write name="datosPres" property="codigo"/>
                                    <html:hidden name="datosPres" property="codigo" />
                                </font>    
                                
                            </td>
                        </tr>               
                        <tr>                           
                            <td style="color: red">
                                <html:errors property="tipo" /> 
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
                                
                                <html:select name="datosPres" property="tipo">                                    
                                    <option value="FUNINDES">FUNINDES</option>
                                    <option value="FONACIT">FONACIT</option>
                                    <option value="Donacion">Donacion</option>
                                    <option value="Ordinario">Ordinario</option>
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
                                    <b><font size="2" >Descripcion:</font></b><br />
                                </div>
                                <html:text name="datosPres" property="descripcion" />
                            </td>
                        </tr>               
                        <tr>

                            <td style="color: red">
                                <html:errors property="descripcion" /> 
                            </td>
                        </tr>
                        
                        
                        <td><b><font size="2" >Monto:</font></b></td>
                        
                        <tr>
                            <td>
                                <html:text name="datosPres" property="monto" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <bean:write name = "datosPres" property="error_monto" filter="false" />
                                &nbsp;
                            </td>
                        </tr>
                        
                        
                        <tr>
                             <td>
                             <b><font size="2" >Fecha Actual:</font></b><br />                             
                             <font size="2" style="color: blue">
                             <bean:write name="datosPres" property="dia"/> /
                             <bean:write name="datosPres" property="mes"/> /
                             <bean:write name="datosPres" property="ano"/>
                             </font>
                             </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <b><font size="2" >Seleccione Fecha:</font></b>
                            </td>
                        </tr>    
                        <tr>
                            <td><font size="2" >Dia:
                            <html:select property="dia">
                                    <!--<option value=""></option> -->
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                    
                            </html:select> 
                            Mes:
                            <html:select property="mes">
                                    <!--<option value=""></option> -->
                                    <option value="ENERO">ENERO</option>
                                    <option value="FEBRERO">FEBRERO</option>
                                    <option value="MARZO">MARZO</option>
                                    <option value="ABRIL">ABRIL</option>
                                    <option value="MAYO">MAYO</option>
                                    <option value="JUNIO">JUNIO</option>
                                    <option value="JULIO">JULIO</option>
                                    <option value="AGOSTO">AGOSTO</option>
                                    <option value="SEPTIEMBRE">SEPTIEMBRE</option>
                                    <option value="OCTUBRE">OCTUBRE</option>
                                    <option value="NOVIEMBRE">NOVIEMBRE</option>
                                    <option value="DICIEMBRE">DICIEMBRE</option>                                                           
                            </html:select>  
                            Ano:
                            <html:select property="ano">
                                    <!--<option value=""></option> -->
                                    <option value="2014">2014</option>
                                                                                              
                            </html:select> 
                            </font>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="dia" /> 
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
                Volver
            </h2>
        </html:link>
    </body>
</html>