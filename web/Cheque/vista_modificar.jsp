<%-- 
    Document   : vista_modificar
    Created on : 05-dic-2013, 0:06:29
    Author     : juanpe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert page = "/plantilla_cuerpo.jsp" flush="true">
    <tiles:put name="titulo" value = "Cheques"/>
    <tiles:put name="cuerpo" value = "/Cheque/modificar_cheque.jsp"/>
</tiles:insert>
