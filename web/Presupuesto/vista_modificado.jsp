<%-- 
    Document   : vista_modificado
    Created on : 05-dic-2013, 18:56:31
    Author     : juanpe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert page = "/plantilla_presupuesto.jsp" flush="true">
    <tiles:put name="titulo" value = "Presupuesto"/>
    <tiles:put name="cuerpo" value = "/Presupuesto/modificado_presupuesto.jsp"/>
</tiles:insert>