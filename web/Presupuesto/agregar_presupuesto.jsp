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
        <h2>Introduzca los datos del presupuesto:</h2>

        <html:form action="/form1_presupuesto">            
            <div id="welcome">
                <table border="0">
                    <tbody>
                        <tr>Codigo:</tr>
                        <tr>
                            <td>
                                <html:text property="codigo" />
                            </td>
                        </tr>               
                        <tr>
                            <td style="color: red">
                                <bean:write name = "Presupuesto" property="error" filter="false" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>Tipo:
                                <html:select property="tipo">
                                    <option value=""></option>
                                    <option value="FUNINDES">FUNINDES</option>
                                    <option value="FONACIT">FONACIT</option>
                                    <option value="Donacion">Donacion</option>
                                    <option value="Ordinario">Ordinario</option>
                                </html:select> 
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <bean:write name = "Presupuesto" property="error_tipo" filter="false" />
                                &nbsp;
                            </td>
                        </tr>

                        <tr>
                            <td>Descripcion:</td>
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
                            <td>Monto:</td>
                        </tr>
                        <tr>
                            <td>
                                <html:text property="monto" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <bean:write name = "Presupuesto" property="error_monto" filter="false" />
                                &nbsp;
                            </td>
                        </tr>
                            <td>
                                Seleccione Fecha:
                            </td>
                        <tr>
                            <td>Dia:
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
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red">
                                <html:errors property="dia" /> 
                            </td>
                        </tr>
                        
                        
                    <td>
                        <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                            Agregar Presupuesto
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
                Volver
            </h2>
        </html:link>


    </body>
</html>
