<%-- 
    Document   : prueba
    Created on : 29-dic-2013, 15:51:02
    Author     : juanpe
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>.:: ::..</title>
<script language="javascript" type="text/javascript">
function ocultar(id){
document.getElementById(id).style.display="none";
}
function mostrar(id){
ocultartodo();
document.getElementById(id).style.display="block";
}
function ocultartodo(){
ocultar("uno");
ocultar("dos");
ocultar("tres");
}
</script>
</head>

<body>
<a href="javascript:mostrar('uno')">Uno</a>
<br>
<a href="javascript:mostrar('dos')">Dos</a>
<br>
<a href="javascript:mostrar('tres')">Tres</a>

<div id="uno" style="display:none"><html:link action="/">Si esto es un Link</html:link>

</div>
<div id="dos" style="display:none">Ahora vemos el segundo contenido</div>
<div id="tres" style="display:none">y finalmente vemos el tercer contenido</div>

<div ><a href="javascript:ocultartodo()">ocultar todo</a>

</body>

</html>

<!--
<html>
<head>

<title>Muestra oculta</title>

<script language="JavaScript">

function muestra_oculta(id){
if (document.getElementById){ //se obtiene el id
var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
}
}
window.onload = function(){/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
muestra_oculta('contenido_a_mostrar');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */
}
</script>
</head>

<body>

//Al hace llamado a la función solo tienes que idicar el nombre del DIV entre parentesis 
<p><a style='cursor: pointer;' onclick="muestra_oculta('contenido_a_mostrar')" title="">Mostrar / Ocultar</a></p>

<div id="contenido_a_mostrar">
<p>Este contenido tiene que mostrarse con el link</p>
</div>

</body>
</html>
-->