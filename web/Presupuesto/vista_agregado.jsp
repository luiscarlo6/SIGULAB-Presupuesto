<%-- 
    Document   : vista_agregado
    Created on : 04-dic-2013, 23:25:54
    Author     : juanpe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert page = "/plantilla_cuerpo.jsp" flush="true">
    <tiles:put name="titulo" value = "Presupuesto"/>
    <tiles:put name="cuerpo" value = "/Presupuesto/agregado_presupuesto.jsp"/>
</tiles:insert>