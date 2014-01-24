<%-- 
    Document   : plantilla
    Created on : 19/12/2013, 05:39:21 PM
    Author     : juanpe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<html:html lang="true">
    <body>
        <div id="body-content">
            
            <div>
                <tiles:insert attribute="banner"/>
            </div>
           
            
            
            <div>
                <tiles:insert attribute="sidebarL"/>
            </div>
            
            <div style="width:760px; align:center; margin-left: auto;margin-right: auto;">
                <tiles:insert attribute="body"/>
            </div>
            
            <div>
                <tiles:insert attribute="footer"/> 
            </div>
            
        </div>
    </body>
</html:html>