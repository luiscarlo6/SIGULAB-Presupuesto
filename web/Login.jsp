<%-- 
    Document   : Login
    Created on : 30/05/2013, 08:14:08 PM
    Author     : Langtech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/Login.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/Login.css">
        <title>Bienvenidos a Sistema de Evaluacion</title>
    </head>
    <body>     
        <div id="contenedor">

            <div id="encabezado">
                <a title="Inicio" rel="home">
                    <img src="imagenes/CAS.png" alt="Inicio">
                </a>
            </div>

           
        </div>
        <br />
        <div id="content">

            <html:form action="/form_login" acceptCharset="ISO=8859-1" onsubmit="return(this)">
                <div id="welcome">
                    <p align="center ">Por razones de seguridad, por favor cierre la sesión y su navegador web cuando haya terminado <br />
                        de acceder a los servicios que requieren autenticación.</p>
                    <p style="text-align: center"><strong>Introduzca su USBID y Contraseña</strong></p>
                    <table border="0">
                        <tbody>
                        <td>USBID:</td>
                        </tr>
                        <tr>
                            <td><html:text property="usbid" /></td>
                        </tr>                        
                        <tr>
                            <td style="color: red">
                                <html:errors property="usbid" /> 
                            </td>
                        </tr>
                        <tr>
                            <td>Contraseña:</td>
                        </tr>
                        <tr>
                            <td><html:password property="contrasena" /></td>
                        </tr>                        
                        <tr>
                            <td style="color: red">
                                <html:errors property="contrasena" /> 
                            </td>
                        </tr>                        
                        <tr>
                            <td>
                                <html:submit value="Login" />
                                <html:reset value="Limpiar" />
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </html:form>

            <div id="copyright">
                <p> Copyright © 2014 One Systems. All rights reserved.</p>
            </div>
        </div>

    </body>
</html>
