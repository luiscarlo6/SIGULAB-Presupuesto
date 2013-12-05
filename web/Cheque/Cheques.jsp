<%-- 
    Document   : Cheques
    Created on : 04-dic-2013, 14:20:10
    Author     : juanpe
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/Login.css">
        <title>Bienvenidos a Sistema de Gestion Presupuestaria</title>
    </head>
    <body>     
        <div id="contenedor">


            <table border="0" width="750px">
                <tbody><tr>
                        <td align="l">
                            <h2>Cheques:</h2>
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
                        <html:link action= "/agregar_cheque" >
                        <h2>
                            Agregar
                        </h2>    
                        </html:link>
                </tr>


                <tr>
                    <html:link action= "/modificar_cheque" >
                    <h2>
                        Modificar Estatus
                    </h2>
                    </html:link>
                </tr>

                
                
                <tr>
                    <html:link action= "/consultar_cheque" >
                    <h2>
                        Consultar
                    </h2>
                    </html:link>
                </tr>

                <tr>
                    <html:link action= "/inicio" >
                    <h2>
                        Inicio
                    </h2>
                    </html:link>
                
                </tr>
                
                </tbody>
            </table>

        </div>



    </div>


</body>
</html:html>