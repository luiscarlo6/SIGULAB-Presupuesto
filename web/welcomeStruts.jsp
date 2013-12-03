<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

        <div id="contenedor">


            <table border="0" width="750px">
                <tbody><tr>
                        <td align="l">

                            <h2>Catalogos de Presupuesto:</h2>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="content">


            <p style="text-align: left"><strong>Introduzca una opcion a realizar:</strong></p>
            <table border="0">
                <tbody>
                    <tr>
                        <html:link action= "/agregar" >
                    <h2>
                        Agregar
                    </h2>    
                </html:link>
                </tr>


                <tr>
                    <html:link action= "/modificar" >
                    <h2>
                        Modificar
                    </h2>
                </html:link>
                </tr>

                <tr>
                    <html:link action= "/eliminar" >
                    <h2>
                        Eliminar
                    </h2>
                </html:link>
                </tr>
                
                <tr>
                    <html:link action= "/consultar" >
                    <h2>
                        Consultar
                    </h2>
                </html:link>
                </tr>

                </tbody>
            </table>

        </div>
