<%-- 
    Document   : sideLAdmin
    Created on : 15/10/2013, 06:38:44 PM
    Author     : 
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <div id="sidebarL" class="glossymenu" >
        <ul class="menu">            
            <li class="first leaf"><html:link action="inicio"><p>Inicio</p></html:link></li>
            
            <li class="leaf"><html:link action="consultar_TDP"><p>Tipo de Presupuesto</p></html:link></li>
            
            <li class="leaf"><html:link  action="agregar_TDP"><p> * Agregar Nuevo</p></html:link></li>
            <li class="leaf"><html:link  action="buscar_TDP"><p> * Busqueda Especifica</p></html:link></li>
            
            <li class="leaf"><html:link action="consultar_presupuesto"><p>Presupuesto</p></html:link></li>
            <li class="leaf"><html:link action="consultar_laboratorio"><p>Lista de Laboratorios</p></html:link></li>
            <li class="leaf"><html:link action="construccion"><p>Orden de Gastos</p></html:link></li>
            <li class="leaf"><html:link action="construccion"><p>Cheques</p></html:link></li>
            <li class="leaf"><html:link action="cerrar_sesion"><p>Cerrar Sesion</p></html:link></li> 
        </ul>                    
    </div>
        
    
        
</html>
