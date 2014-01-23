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
            
            <li class="leaf"><html:link action="consultar_tipos"><p>Tipo de Presupuesto</p></html:link></li>
            <li class="leaf"><html:link action="consultar_TDP"><p>Presupuesto</p></html:link></li>  
            
            <li class="leaf"><html:link action="consultar_presupuesto"><p>Presupuesto Asignado</p></html:link></li>
                                
            <li class="leaf"><html:link action="asignar_presupuesto"><p> * Asignar</p></html:link></li>
            <li class="leaf"><html:link action="asignar_presupuesto_equitativo"><p> * Asignación Equitativa</p></html:link></li>            
            <li class="leaf"><html:link action="consulta_totales"><p> * Totales Disponibles</p></html:link></li>
            <!-- <li class="leaf"><html:link action="consulta_individual"><p> * Consulta Individual</p></html:link></li> -->
            <li class="leaf"><html:link action="buscar_presupuesto"><p> * Busqueda Especifica</p></html:link></li>
            <li class="leaf"><html:link onclick="javascript: return confirm('¿Está seguro de que Realizar la reformulación? la fecha de la ejecución será la actual.')" 
                       action="reformular_presupuesto"><p> * Reformulación</p></html:link></li>
            
            <li class="leaf"><html:link action="consultar_laboratorio"><p>Lista de Laboratorios</p></html:link></li>
            <li class="leaf"><html:link action="construccion"><p>Orden de Gastos</p></html:link></li>
            <li class="leaf"><html:link action="construccion"><p>Cheques</p></html:link></li>
            <li class="leaf"><html:link action="cerrar_sesion"><p>Cerrar Sesión</p></html:link></li> 
        </ul>                    
    </div>
        
    
        
</html>
