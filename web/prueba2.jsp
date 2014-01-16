<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<html>
<thead>
<SCRIPT language="javascript">
function SINO(cual) {
   var elElemento=document.getElementById(cual);
   if(elElemento.style.display == 'block') {
      elElemento.style.display = 'none';
   } else {
      elElemento.style.display = 'block';
   }
};
</SCRIPT>
</thead>
<body>
<div id="demo1" style="display:none;">El elemento que está oculto.</div>
<a href="javascript:void(0);" onclick="SINO('demo1')">Mostar / Ocultar</a>
</body></html>