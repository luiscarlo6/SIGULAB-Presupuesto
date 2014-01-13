<%-- 
    Document   : prueba2
    Created on : 12-ene-2014, 0:34:57
    Author     : juanpe
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><title>DHTML Calendar</title>

<meta name="author" content="Eric Pretorious">
<meta name="subject" content="DHTML Calendar">
<meta name="keywords" content="DHTML, dynamic HTML, crossbrowser, cross-browser, cross browser, javascript, calendar script">

<!-- style.css -->
<style rel="stylesheet" type="text/css">
#banner {
  position:absolute;
  top:0px;left:0px;
  width:740px;height:110px;
  padding:10px;margin:10px;
  border-bottom:1px solid gray;
}
#buttons {
  position:absolute;
  z-index:0;
  top:141px;left:10px;
}
.button {
  position:relative;
  width:140px;
  background:#ccffcc;
  border:1px solid #99ff99;
  padding:9px;margin:10px;
  font-family:sans-serif;font-size:10px;
}
.badge {
  position:relative;
  width:140px;
  background:transparent;
  padding:10px;margin:10px;
  text-align:center;
}
.badge a img {
  border:1px solid white;
}
#cover {
  position:absolute;
  z-index:2;
  top:141px;left:191px;
  width:570px;height:450px;
  background:#ccccff;
  border:1px solid #ff9999;
  padding:0;margin:10 8 10 0;
  font-family:sans-serif;font-size:10px;
}
#page {
  position:absolute;
  z-index:1;
  top:141px;left:191px;
  width:570px;height:450px;
  background:#ccccff;
  border:1px solid #9999ff;
  padding:0;margin:10 8 10 0;
  font-family:sans-serif;font-size:10px;
}
.container {
  position:absolute;
  width:550px;
  background:transparent;
  border-bottom:1px solid gray;
  padding-bottom:10px;margin:10px;
}
.container .title {
  font-weight:600;
  font-size:11px;
  padding:0;margin:0;
}
.container .content {
  font-weight:400;
  font-size:10px;
  line-height:18px;
}
.code_ref {
  position:relative;
  display:block;
  border:1px solid #9999ff;
  background:white;
  padding:10px;
  margin:5 0 5 0;
}

</style>
<!-- DHTML_Calendar.css -->
<style rel="stylesheet" type="text/css">
#DHTMLC {
  position:relative;
  margin:0 0 10 10;
  height:180px;width:230px;
  visibility:hidden;
  font-family:verdana, arial, sans-serif;font-size:10px;
  line-height:18px;
  background-color:white;border:1px solid #9999ff;
}

.months {
  position:absolute;
  height :18px;width:45px;
  text-align:center;background-color:#ccccff;
}

.dotw {
  position:absolute;
  height :18px;width:28px;
  text-align:center;background-color:#ccccff;
}

.days {
  position:absolute;
  height :18px;width:28px;
  text-align:center;background-color:white;
}

.days a:link {
  text-decoration:none;
}

#moniker {
  height:18px;width:210px;
  text-align:center;color:#ccc;
  font-family:verdana, arial, sans-serif;font-size:7px;
  line-height:9px;
}

#moniker a:link {
  color:gray;
}

</style>
<!-- cbe_core.js -->
<script type="text/javascript" >
/* cbe_core.js $Revision: 0.22 $
 * CBE v4.19, Cross-Browser DHTML API from Cross-Browser.com
 * Copyright (c) 2002 Michael Foster (mike@cross-browser.com)
 * Distributed under the terms of the GNU LGPL from gnu.org
*/
var cbeVersion="4.19", cbeDocumentId='idDocument', cbeWindowId='idWindow', cbeAll=new Array();
window.onload=function(){cbeInitialize("DIV", "SPAN"); if (window.windowOnload) window.windowOnload();}
window.onunload=function(){if(window.windowOnunload){window.windowOnunload();}if(window.cbeDebugObj){window.cbeDebugObj=null;}for(var i=0; i<cbeAll.length; i++){if(cbeAll[i]){if(cbeAll[i].ele){if(cbeAll[i].ele.cbe){cbeAll[i].ele.cbe=null;}cbeAll[i].ele=null;}cbeAll[i]=null;}}}
function CrossBrowserNode(){this.parentNode=null; this.childNodes=0; this.firstChild=null; this.lastChild=null; this.previousSibling=null; this.nextSibling=null;}
CrossBrowserNode.prototype.appendNode=function(cbeChild){if (cbeChild){if (!this.firstChild){this.firstChild=cbeChild;} else{cbeChild.previousSibling=this.lastChild; this.lastChild.nextSibling=cbeChild;}cbeChild.parentNode=this; this.lastChild=cbeChild; ++this.childNodes;}return cbeChild;}
CrossBrowserElement.prototype=new CrossBrowserNode;
function CrossBrowserElement(){
  this.contains=this.left=this.top=this.offsetLeft=this.offsetTop=this.pageX=this.pageY=this.zIndex=_retZero;
  this.show=this.hide=this.moveTo=this.moveBy=this.sizeTo=this.sizeBy=this.resizeTo=this.resizeBy=_retVoid;
  this.visibility=this.color=this.background=this.clip=this.innerHtml=_retEStr;
  if (cbeAll.length < 2){this.width=cbeInnerWidth; this.height=cbeInnerHeight; this.scrollLeft=cbePageXOffset; this.scrollTop=cbePageYOffset;}
  else{this.width=this.height=this.scrollLeft=this.scrollTop=_retZero;}
  this.id=""; this.index=cbeAll.length; cbeAll[this.index]=this; this.w=this.h=0; this.x=this.y=0;
  if (window.cbeEventJsLoaded) this.listeners=new Array();
}
function cbeBindElement(cbe, ele){
  if (!cbe || !ele) return;
  cbe.ele=ele; cbe.ele.cbe=cbe; cbe.parentElement=cbeGetParentElement(ele);
  if (ele==window){cbe.id=ele.id=cbeWindowId; return;} else if (ele==document){cbe.id=ele.id=cbeDocumentId; return;} else{cbe.id=ele.id;}
  if (_def(ele.clip)){cbe.w=ele.clip.width; cbe.h=ele.clip.height;}
  var css=_def(ele.style);
  // left, top
  cbe.moveTo=_cbeMoveTo; cbe.moveBy=_cbeMoveBy; if (css && _def(ele.style.left, ele.style.top) && typeof(ele.style.left)=="string"){cbe.left=_domLeft; cbe.top=_domTop;}else if (css && _def(ele.style.pixelLeft, ele.style.pixelTop)){cbe.left=_ieLeft; cbe.top=_ieTop;}else if (_def(ele.left, ele.top)){cbe.left=_nnLeft; cbe.top=_nnTop;}else{_sup(false,"left","top","moveTo","moveBy");}
  // width, height
  cbe.sizeTo=_cbeSizeTo; cbe.sizeBy=_cbeSizeBy; cbe.resizeTo=_cbeResizeTo; cbe.resizeBy=_cbeResizeBy; if (css && _def(ele.style.width, ele.style.height, ele.offsetWidth, ele.offsetHeight) && typeof(ele.style.width)=="string"){cbe.width=_domWidth; cbe.height=_domHeight;}else if (css && _def(ele.style.pixelWidth, ele.style.pixelHeight)){cbe.width=_ieWidth; cbe.height=_ieHeight;}else if (_def(ele.clip) && _def(ele.clip.width, ele.clip.height)){cbe.width=_nnWidth; cbe.height=_nnHeight;}else{_sup(false, "width","height","sizeTo","sizeBy","resizeTo","resizeBy");}
  // zIndex
  if (css && _def(ele.style.zIndex)){cbe.zIndex=_domZIndex;} else if (_def(ele.zIndex)){cbe.zIndex=_nnZIndex;} else{_sup(false,"zIndex");}
  // visibility
  cbe.show=_cbeShow; cbe.hide=_cbeHide; if (css && _def(ele.style.visibility)){cbe.visibility=_domVisibility;} else if (_def(ele.visibility)){cbe.visibility=_nnVisibility;} else{_sup(false,"visibility","show","hide");}
  // background
  if (css && _def(ele.style.backgroundColor, ele.style.backgroundImage)){cbe.background=_domBackground;} else if (_def(ele.bgColor, ele.background)){cbe.background=_nnBackground;} else{_sup(false,"background");}
  // color
  if (css && _def(ele.style.color)){cbe.color=_domColor;} else{_sup(false,"color");}
  // clip
  if (css && _def(ele.style.clip)){cbe.clip=_domClip;} else if (_def(ele.clip)){cbe.clip=_nnClip;} else{_sup(false,"clip");}
  // offsetLeft, offsetTop
  if (_def(ele.offsetLeft, ele.offsetTop, ele.offsetParent)){cbe.offsetLeft=_ieOffsetLeft; cbe.offsetTop=_ieOffsetTop;}else if (_def(ele.pageX, ele.pageY)){cbe.offsetLeft=_nnOffsetLeft; cbe.offsetTop=_nnOffsetTop;}else{_sup(false,"offsetLeft","offsetTop");}
  // pageX, pageY
  cbe.contains=_cbeContains; if (_def(ele.pageX, ele.pageY)){cbe.pageX=_nnPageX; cbe.pageY=_nnPageY;}else if (document.cbe.isSupported("offsetLeft")){cbe.pageX=_cbePageX; cbe.pageY=_cbePageY;}else{_sup(false,"pageX","pageY","contains");}
  // innerHtml
  if (_def(ele.innerHTML)){cbe.innerHtml=_ieInnerHtml;} else if (_def(ele.document) && _def(ele.document.write)){cbe.innerHtml=_nnInnerHtml;} else{_sup(false,"innerHtml");}
  // scrollLeft, scrollTop
  if (_def(ele.scrollLeft, ele.scrollTop)){cbe.scrollLeft=_cbeScrollLeft; cbe.scrollTop=_cbeScrollTop;}else{_sup(false,"scrollLeft","scrollTop");}
  // createElement, appendChild, removeChild (these need more work)
  if (!_def(document.createElement) && !document.layers){_sup(false,"createElement","appendChild","removeChild");}else{if (!_def(ele.appendChild)){_sup(false,"appendChild");} if (!_def(ele.removeChild)){_sup(false,"removeChild");}}
}
function cbeInitialize(sTagNames){
  var t,i,ele,eleList,cbe;
  cbe=new CrossBrowserElement(window);
  cbeBindElement(cbe, window);
  cbe=new CrossBrowserElement(document);
  cbeBindElement(cbe, document);
  if (!document.getElementById) document.getElementById=cbeGetElementById;
  if (document.createElement || document.layers) document.cbe.createElement=_cbeCreateElement;
  document.cbe.isSupported=_cbeIsSupported;
  document.cbe.supported=new Array();
  _sup(true,"left","top","width","height","zIndex","show","hide","visibility","background","color","clip","offsetLeft","offsetTop","pageX","pageY","innerHtml","scrollLeft","scrollTop","createElement","appendChild","removeChild","moveTo","moveBy","sizeTo","sizeBy","resizeTo","resizeBy","contains");
  for (t=0; t < arguments.length; ++t){
    eleList=cbeGetElementsByTagName(arguments[t]);
    for (i=0; i < eleList.length; ++i){
      ele=eleList[i];
      if ( ele.id && ele.id !=""){
        cbe=new CrossBrowserElement();
        cbeBindElement(cbe, ele);
     }
   }
    if (document.layers) break;
 }
  _cbeCreateTree();
  if (window.cbeEventJsLoaded && (document.layers || is.opera5or6)){window.cbe.addEventListener("resize", cbeDefaultResizeListener);}
}
function _cbeIsSupported(sMethods){var i; for (i=0; i<arguments.length; ++i){if (!document.cbe.supported[arguments[i]]) return false;}return true;}
function _sup(bValue, sMethods){var i; for (i=1; i<arguments.length; ++i) document.cbe.supported[arguments[i]]=bValue;}
function _cbeCreateTree(){var parent; for (var i=1; i < cbeAll.length; ++i){parent=cbeAll[i].parentElement; if (!parent.cbe){while (parent && !parent.cbe){parent=cbeGetParentElement(parent);}if (!parent) parent=document;}parent.cbe.appendNode(cbeAll[i]);}}
function cbeGetElementById(sId){var ele=null; if (sId==window.cbeWindowId) ele=window; else if (sId==window.cbeDocumentId) ele=document; else if (is.dom1getbyid) ele=document.getElementById(sId); else if (document.all) ele=document.all[sId]; else if (document.layers) ele=nnGetElementById(sId); if (!ele && window.cbeUtilJsLoaded){ele=cbeGetImageByName(sId); if (!ele){ele=cbeGetFormByName(sId);}} return ele;}
function nnGetElementById(sId){for (var i=0; i < cbeAll.length; i++){if ( cbeAll[i].id==sId ) return cbeAll[i].ele;}return null;}
function cbeGetElementsByTagName(sTagName){
  var eleList;
  if (document.getElementsByTagName) eleList=document.getElementsByTagName(sTagName); // standard
  else if (document.body && document.body.getElementsByTagName) eleList=document.body.getElementsByTagName(sTagName); // opera5or6
  else if (document.all && document.all.tags) eleList=document.all.tags(sTagName); // ie4
  else if (document.layers){eleList=new Array(); nnGetAllLayers(window, eleList, 0);}// nn4
  return eleList;
}
function nnGetAllLayers(parent, layerArray, nextIndex){
  var i, layer;
  for (i=0; i < parent.document.layers.length; i++){
    layer=parent.document.layers[i]; layerArray[nextIndex++]=layer;
    if (layer.document.layers.length) nextIndex=nnGetAllLayers(layer, layerArray, nextIndex);
 }
  return nextIndex;
}
function cbeGetParentElement(child){
  var parent=document;
  if (child==window) parent=null;
  else if (child==document) parent=window;
  else if (child.parentLayer){if (child.parentLayer !=window) parent=child.parentLayer;}
  else{
    if (child.parentNode) parent=child.parentNode;
    else if (child.offsetParent) parent=child.offsetParent;
    else if (child.parentElement) parent=child.parentElement;
 }
  return parent;
}
function _def(){var i; for (i=0; i<arguments.length; ++i){if (typeof(arguments[i])=="" || typeof(arguments[i])=="undefined") return false;}return true;}
function _retZero(){return 0;}
function _retNull(){return null;}
function _retEStr(){return "";}
function _retVoid(){}
////// when optimizing, don't remove anything above this comment //////
function _cbeCreateElement(sEleType){// returns an Element object
  var ele=null;
  if (document.createElement && sEleType.length){
    ele=document.createElement(sEleType);
    if (ele && ele.style){ele.style.position="absolute";}
 }
  else if (document.layers){
    ele=new Object();
 }
  return ele;
}
CrossBrowserNode.prototype.appendChild=function(eleChild){// returns the appended Element object on success
  var cbe, ele, rv=null;
  if (document.layers){
    var thisEle;
    if (this.index < 2) thisEle=window;
    else thisEle=this.ele;
    ele=new Layer(this.width(), thisEle);
    if (ele){
      if (eleChild.id) ele.id=ele.name=eleChild.id;
      cbe=new CrossBrowserElement();
      cbeBindElement(cbe, ele);
      this.appendNode(ele.cbe);
      eleChild.cbe=cbe;
      ++this.childNodes;
      rv=ele;
   }
 }
  else{
    if (this.index < 2) ele=document.body;
    else ele=this.ele;
    if (ele.appendChild){
      ele.appendChild(eleChild);
      cbe=new CrossBrowserElement();
      cbeBindElement(cbe, eleChild);
      this.appendNode(eleChild.cbe);
      ++this.childNodes;
      rv=eleChild;
   }
 }
  return rv;
}
CrossBrowserNode.prototype.removeChild=function(eleChild){
  var ele, rv=null;
  if (this.index < 2) ele=document.body;
  else ele=this.ele;
  if (ele.removeChild || document.layers){
    --this.childNodes;
    var prevSib=eleChild.cbe.previousSibling;
    var nextSib=eleChild.cbe.nextSibling;
    with (eleChild.cbe){
      parentNode=null;
      previousSibling=null;
      nextSibling=null;
   }
    if (prevSib) prevSib.nextSibling=nextSib;
    else this.firstChild=nextSib;
    if (nextSib) nextSib.previousSibling=prevSib;
    else this.lastChild=prevSib;
    if (document.layers){
      //// working on it
   }
    else{
      ele.removeChild(eleChild);
   }
    rv=eleChild;
 }
  return rv;
}
function _cbeContains(iLeft, iTop, iClipTop, iClipRight, iClipBottom, iClipLeft){if (arguments.length==2){iClipTop=iClipRight=iClipBottom=iClipLeft=0;} else if (arguments.length==3){iClipRight=iClipBottom=iClipLeft=iClipTop;} else if (arguments.length==4){iClipLeft=iClipRight; iClipBottom=iClipTop;} var thisX=this.pageX(), thisY=this.pageY(); return ( iLeft >=thisX + iClipLeft && iLeft <=thisX + this.width() - iClipRight && iTop >=thisY + iClipTop && iTop <=thisY + this.height() - iClipBottom );}
function _cbeMoveTo(x_cr, y_mar, outside, xEndL){if (isFinite(x_cr)){this.left(x_cr); this.top(y_mar);}else{this.cardinalPosition(x_cr, y_mar, outside); this.left(this.x); this.top(this.y);}if (xEndL) cbeEval(xEndL, this);}
function _cbeMoveBy(uDX, uDY, xEndL){if (uDX){this.left(this.left() + uDX);}  if (uDY){this.top(this.top() + uDY);} if (xEndL){cbeEval(xEndL, this);}}
function _domLeft(iX){if (arguments.length){this.ele.style.left=iX + "px";} else{iX=parseInt(this.ele.style.left); if (isNaN(iX)) iX=0;}return iX;}
function _ieLeft(iX){if (arguments.length){this.ele.style.pixelLeft=iX;} else{iX=this.ele.style.pixelLeft;} return iX;}
function _nnLeft(iX){if (arguments.length){this.ele.left=iX;} else{iX=this.ele.left;} return iX;}
function _domTop(iY){if (arguments.length){this.ele.style.top=iY + "px";} else{iY=parseInt(this.ele.style.top); if (isNaN(iY)) iY=0;}return iY;}
function _ieTop(iY){if (arguments.length){this.ele.style.pixelTop=iY;} else{iY=this.ele.style.pixelTop;} return iY;}
function _nnTop(iY){if (arguments.length){this.ele.top=iY;} else{iY=this.ele.top;} return iY;}
function _nnOffsetLeft(){var ol=this.ele.pageX - this.parentElement.pageX; if (isNaN(ol)){ol=this.ele.pageX;} return ol;}
function _nnOffsetTop(){var ot=this.ele.pageY - this.parentElement.pageY; if (isNaN(ot)){ot=this.ele.pageY;} return ot;}
function _ieOffsetLeft(){var x=this.ele.offsetLeft, parent=this.ele.offsetParent; while(parent && !parent.cbe){x +=parent.offsetLeft; parent=parent.offsetParent;}return x;}
function _ieOffsetTop(){var y=this.ele.offsetTop, parent=this.ele.offsetParent; while(parent && !parent.cbe){y +=parent.offsetTop; parent=parent.offsetParent;}return y;}
function _nnPageX(){return this.ele.pageX;}
function _nnPageY(){return this.ele.pageY;}
function _cbePageX(){var x=this.offsetLeft(), parent=this.parentNode; if (parent){while(parent.index > 1){x +=parent.offsetLeft(); parent=parent.parentNode;}} return x;}
function _cbePageY(){var y=this.offsetTop(), parent=this.parentNode; if (parent){while(parent.index > 1){y +=parent.offsetTop(); parent=parent.parentNode;}} return y;}
function _cbeSizeTo(uW, uH){this.width(uW); this.height(uH);}
function _cbeSizeBy(iDW, iDH){this.width(this.width() + iDW); this.height(this.height() + iDH);}
function _cbeResizeTo(uW, uH, xEndListener){this.sizeTo(uW, uH); this.clip('auto'); cbeEval(xEndListener, this);}
function _cbeResizeBy(iDW, iDH, xEndListener){this.sizeBy(iDW, iDH); this.clip('auto'); cbeEval(xEndListener, this);}
function _domWidth(uW){if (arguments.length){uW=Math.round(uW); _domSetWidth(this.ele, uW);}return this.ele.offsetWidth;}
function _ieWidth(uW){if (arguments.length){uW=Math.round(uW); this.ele.style.pixelWidth=uW;}return this.ele.style.pixelWidth;}
function _nnWidth(uW){if (arguments.length){this.w=Math.round(uW); this.ele.clip.right=this.w;}return this.w;}
function _domHeight(uH){if (arguments.length){uH=Math.round(uH); _domSetHeight(this.ele, uH);}return this.ele.offsetHeight;}
function _ieHeight(uH){if (arguments.length){uH=Math.round(uH); this.ele.style.pixelHeight=uH;}return this.ele.style.pixelHeight;}
function _nnHeight(uH){if (arguments.length){this.h=Math.round(uH); this.ele.clip.bottom=this.h;}return this.h;}
function _domSetWidth(ele,uW){
  if (uW < 0) return;
  var pl=0,pr=0,bl=0,br=0;
  if (_def(document.defaultView) && _def(document.defaultView.getComputedStyle)){// gecko and standard
    pl=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("padding-left"));
    pr=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("padding-right"));
    bl=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("border-left-width"));
    br=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("border-right-width"));
 }
  else if (_def(ele.currentStyle, document.compatMode)){
    if (document.compatMode=="CSS1Compat"){// ie6up in css1compat mode
      pl=parseInt(ele.currentStyle.paddingLeft);
      pr=parseInt(ele.currentStyle.paddingRight);
      bl=parseInt(ele.currentStyle.borderLeftWidth);
      br=parseInt(ele.currentStyle.borderRightWidth);
   }
 }
  if (isNaN(pl)) pl=0; if (isNaN(pr)) pr=0; if (isNaN(bl)) bl=0; if (isNaN(br)) br=0;
  var cssW=uW-(pl+pr+bl+br);
  if (isNaN(cssW) || cssW < 0) return;
  ele.style.width=cssW + "px";
}
function _domSetHeight(ele,uH){
  if (uH < 0) return;
  var pt=0,pb=0,bt=0,bb=0;
  if (_def(document.defaultView) && _def(document.defaultView.getComputedStyle)){
    pt=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("padding-top"));
    pb=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("padding-bottom"));
    bt=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("border-top-width"));
    bb=parseInt(document.defaultView.getComputedStyle(ele, "").getPropertyValue("border-bottom-width"));
 }
  else if (_def(ele.currentStyle, document.compatMode)){
    if (document.compatMode=="CSS1Compat"){
      pt=parseInt(ele.currentStyle.paddingTop);
      pb=parseInt(ele.currentStyle.paddingBottom);
      bt=parseInt(ele.currentStyle.borderTopWidth);
      bb=parseInt(ele.currentStyle.borderBottomWidth);
   }
 }
  if (isNaN(pt)) pt=0; if (isNaN(pb)) pb=0; if (isNaN(bt)) bt=0; if (isNaN(bb)) bb=0;
  var cssH=uH-(pt+pb+bt+bb);
  if (isNaN(cssH) || cssH < 0) return;
  ele.style.height=cssH + "px";
}
function _cbeScrollLeft(){return this.ele.scrollLeft;}
function _cbeScrollTop(){return this.ele.scrollTop;}
function _cbeShow(){this.visibility(1);}
function _cbeHide(){this.visibility(0);}
function _domVisibility(vis){if (arguments.length){if (vis){this.ele.style.visibility='inherit';} else{this.ele.style.visibility='hidden';}}else return (this.ele.style.visibility=='visible' || this.ele.style.visibility=='inherit' || this.ele.style.visibility=='');}
function _nnVisibility(vis){if (arguments.length){if (vis){this.ele.visibility='inherit';} else{this.ele.visibility='hide';}}else return (this.ele.visibility=='show' || this.ele.visibility=='inherit' || this.ele.visibility=='');}
function _domZIndex(uZ){if (arguments.length){this.ele.style.zIndex=uZ;} else{uZ=parseInt(this.ele.style.zIndex); if (isNaN(uZ)) uZ=0;}return uZ;}
function _nnZIndex(uZ){if (arguments.length) this.ele.zIndex=uZ; return this.ele.zIndex;}
function _domBackground(sColor, sImage){if (arguments.length){if (!sColor){sColor='transparent';} this.ele.style.backgroundColor=sColor; if (arguments.length==2){this.ele.style.backgroundImage="url(" + sImage + ")";}}else return this.ele.style.backgroundColor;}
function _nnBackground(sColor, sImage){if (arguments.length){if (sColor=='transparent'){sColor=null;} this.ele.bgColor=sColor; if (arguments.length==2){this.ele.background.src=sImage || null;}}else{var bg=this.ele.bgColor; if (window.cbeUtilJsLoaded){bg=cbeHexString(bg,6,'#');} return bg;}}
function _domColor(newColor){if (arguments.length){this.ele.style.color=newColor;}else return this.ele.style.color;}
function _domClip(iTop, iRight, iBottom, iLeft){if (arguments.length==4){var clipRect="rect(" + iTop + "px " + iRight + "px " + iBottom + "px " + iLeft + "px" + ")"; this.ele.style.clip=clipRect;}else{this.clip(0, this.ele.offsetWidth, this.ele.offsetHeight, 0);}}
function _nnClip(iTop, iRight, iBottom, iLeft){if (arguments.length==4){this.ele.clip.top=iTop; this.ele.clip.right=iRight; this.ele.clip.bottom=iBottom; this.ele.clip.left=iLeft;}else{this.clip(0, this.width(), this.height(), 0);}}
function _ieInnerHtml(sHtml){if (arguments.length){this.ele.innerHTML=sHtml;}else return this.ele.innerHTML;}
function _nnInnerHtml(sHtml){if (arguments.length){if (sHtml==""){sHtml=" ";} this.ele.document.open(); this.ele.document.write(sHtml); this.ele.document.close();}else return "";}
CrossBrowserElement.prototype.cardinalPosition=function(cp, margin, outside){
  if (typeof(cp) !='string'){window.status='cardinalPosition() error: cp=' + cp + ', id=' + this.id; return;}
  var x=this.left(), y=this.top(), w=this.width(), h=this.height();
  var pw=this.parentNode.width(), ph=this.parentNode.height();
  var sx=this.parentNode.scrollLeft(), sy=this.parentNode.scrollTop();
  var right=sx + pw, bottom=sy + ph;
  var cenLeft=sx + Math.floor((pw-w)/2), cenTop=sy + Math.floor((ph-h)/2);
  if (!margin) margin=0;
  else{
    if (outside) margin=-margin;
    sx +=margin; sy +=margin; right -=margin; bottom -=margin;
 }
  switch (cp.toLowerCase()){
    case 'n': x=cenLeft; if (outside) y=sy - h; else y=sy; break;
    case 'ne': if (outside){x=right; y=sy - h;}else{x=right - w; y=sy;}break;
    case 'e': y=cenTop; if (outside) x=right; else x=right - w; break;
    case 'se': if (outside){x=right; y=bottom;}else{x=right - w; y=bottom - h}break;
    case 's': x=cenLeft; if (outside) y=sy - h; else y=bottom - h; break;
    case 'sw': if (outside){x=sx - w; y=bottom;}else{x=sx; y=bottom - h;}break;
    case 'w': y=cenTop; if (outside) x=sx - w; else x=sx; break;
    case 'nw': if (outside){x=sx - w; y=sy - h;}else{x=sx; y=sy;}break;
    case 'cen': case 'center': x=cenLeft; y=cenTop; break;
    case 'cenh': x=cenLeft; break;
    case 'cenv': y=cenTop; break;
 }
  this.x=x; this.y=y;
}
function cbeInnerWidth(){
  var w=0;
  if (is.opera5or6){w=window.innerWidth;}
  else if (is.ie && document.documentElement && document.documentElement.clientWidth) w=document.documentElement.clientWidth; // ie6 compat mode
  else if (document.body && document.body.clientWidth) w=document.body.clientWidth; // ie4up and gecko
  else if (_def(window.innerWidth,window.innerHeight,document.height)){// nn4
    w=window.innerWidth;
    if (document.height > window.innerHeight) w -=16;
 }
  return w;
}
function cbeInnerHeight(){
  var h=0;
  if (is.opera5or6){h=window.innerHeight;}
  else if (is.ie && document.documentElement && document.documentElement.clientHeight) h=document.documentElement.clientHeight;
  else if (document.body && document.body.clientHeight) h=document.body.clientHeight;
  else if (_def(window.innerWidth,window.innerHeight,document.width)){
    h=window.innerHeight;
    if (document.width > window.innerWidth) h -=16;
 }
  return h;
}
function cbePageXOffset(){
  var offset=0;
  if (_def(window.pageXOffset)) offset=window.pageXOffset; // gecko, nn4, opera
  else if (document.documentElement && document.documentElement.scrollLeft) offset=document.documentElement.scrollLeft; // ie6 compat mode
  else if (document.body && _def(document.body.scrollLeft)) offset=document.body.scrollLeft; // ie4up
  return offset;
}
function cbePageYOffset(){
  var offset=0;
  if (_def(window.pageYOffset)) offset=window.pageYOffset;
  else if (document.documentElement && document.documentElement.scrollTop) offset=document.documentElement.scrollTop;
  else if (document.body && _def(document.body.scrollTop)) offset=document.body.scrollTop;
  return offset;
}
function cbeEval(exp, arg1, arg2, arg3, arg4, arg5, arg6){
  if (typeof(exp)=="function") exp(arg1, arg2, arg3, arg4, arg5, arg6);
  else if (typeof(exp)=="object" && typeof(arg1)=="function") {
    exp._cbeEval_ = arg1;
    exp._cbeEval_(arg2, arg3, arg4, arg5, arg6);
  }  
  else if (typeof(exp)=="string") eval(exp);
}
function ClientSnifferJr(){
  this.ua=navigator.userAgent.toLowerCase();
  this.major=parseInt(navigator.appVersion);
  this.minor=parseFloat(navigator.appVersion);
  if (document.addEventListener && document.removeEventListener) this.dom2events=true;
  if (document.getElementById) this.dom1getbyid=true;
  if (window.opera){
    this.opera=true;
    this.opera5=(this.ua.indexOf("opera 5") !=-1 || this.ua.indexOf("opera/5") !=-1);
    this.opera6=(this.ua.indexOf("opera 6") !=-1 || this.ua.indexOf("opera/6") !=-1);
    this.opera5or6=this.opera5 || this.opera6;
    this.opera7=(this.ua.indexOf("opera 7") !=-1 || this.ua.indexOf("opera/7") !=-1);
    return;
 }
  this.konq=this.ua.indexOf('konqueror') !=-1;
  this.ie=this.ua.indexOf('msie') !=-1;
  if (this.ie){
    this.ie3=this.major < 4;
    this.ie4=(this.major==4 && this.ua.indexOf('msie 5')==-1 && this.ua.indexOf('msie 6')==-1);
    this.ie4up=this.major >=4;
    this.ie5=(this.major==4 && this.ua.indexOf('msie 5.0') !=-1);
    this.ie5up=!this.ie3 && !this.ie4;
    this.ie6=(this.major==4 && this.ua.indexOf('msie 6.0') !=-1);
    this.ie6up=(!this.ie3 && !this.ie4 && !this.ie5 && this.ua.indexOf("msie 5.5")==-1);
    return;
 }
  this.hotjava=this.ua.indexOf('hotjava') !=-1;
  this.webtv=this.ua.indexOf('webtv') !=-1;
  this.aol=this.ua.indexOf('aol') !=-1;
  if (this.hotjava || this.webtv || this.aol) return;
  // Gecko, NN4, and NS6
  this.gecko=this.ua.indexOf('gecko') !=-1;
  this.nav=(this.ua.indexOf('mozilla') !=-1 && this.ua.indexOf('spoofer')==-1 && this.ua.indexOf('compatible')==-1);
  if (this.nav){
    this.nav4=this.major==4;
    this.nav4up=this.major >=4;
    this.nav5up=this.major >=5;
    this.nav6=this.major==5;
    this.nav6up=this.nav5up;
 }
}
window.is=new ClientSnifferJr();
// End cbe_core.js
</script>
<!-- cbe_event.js -->
<script type="text/javascript" >
/* cbe_event.js $Revision: 0.15 $
 * CBE v4.19, Cross-Browser DHTML API from Cross-Browser.com
 * Copyright (c) 2002 Michael Foster (mike@cross-browser.com)
 * Distributed under the terms of the GNU LGPL from gnu.org
*/
function cbeELReg(eventType, eventListener, eventCapture, listenerObject) { // event listener registration object constructor
  this.type = eventType; this.listener = eventListener; this.capture = eventCapture; this.obj = listenerObject;
}
function CrossBrowserEvent(e) { // Object constructor
  // from DOM2 Interface Event
  this.type = "";
  this.target = null;
  this.currentTarget = null;
  this.eventPhase = 0;
  this.bubbles = true;
  this.cancelable = true;
  this.timeStamp = 0;
  this.AT_TARGET = 1; this.BUBBLING_PHASE = 2; this.CAPTURING_PHASE = 3; // eventPhase masks
  // from DOM2 Interface MouseEvent : UIEvent
  this.screenX = 0;
  this.screenY = 0;
  this.clientX = 0;
  this.clientY = 0;
  this.ctrlKey = false;
  this.shiftKey = false;
  this.altKey = false;
  this.metaKey = false;
  this.button = 3; // 3 == undefined
  this.relatedTarget = null;
  this.LEFT = 0; this.MIDDLE = 1; this.RIGHT = 2; // button masks
  // from IE4 Object Model
  this.keyCode = 0;
  this.offsetX = 0;
  this.offsetY = 0;
  // from NN4 Object Model
  this.pageX = 0;
  this.pageY = 0;
  // CBE
  this.stopPropagationFlag = false;
  this.preventDefaultFlag = false;
  this.cbeTarget = window.cbe;
  this.cbeCurrentTarget = window.cbe;

  if (!e) return;
  
  if (e.type) { this.type = e.type; }
  if (e.target) { this.target = e.target; }
  else if (e.srcElement) { this.target = e.srcElement; }
  if (e.currentTarget) { this.currentTarget = e.currentTarget; }
  else if (e.toElement) { this.currentTarget = e.toElement; }
  if (e.eventPhase) { this.eventPhase = e.eventPhase; }
  if (e.bubbles) { this.bubbles = e.bubbles; }
  if (e.cancelable) { this.cancelable = e.cancelable; }
  if (e.timeStamp) { this.timeStamp = e.timeStamp; }

  if (e.screenX) { this.screenX = e.screenX; }
  if (e.screenY) { this.screenY = e.screenY; }
  if (is.opera5or6) { this.clientX = e.clientX - document.cbe.scrollLeft(); }
  else if (e.clientX) { this.clientX = e.clientX; }
  else if (e.pageX) { this.clientX = e.pageX - document.cbe.scrollLeft(); }
  if (is.opera5or6) { this.clientY = e.clientY - document.cbe.scrollLeft(); }
  else if (e.clientY) { this.clientY = e.clientY; }
  else if (e.pageY) { this.clientY = e.pageY - document.cbe.scrollLeft(); }
  if (is.opera5or6) { this.ctrlKey = e.type=='mousemove' ? e.shiftKey : e.ctrlKey; }
  else if (_def(e.ctrlKey)) { this.ctrlKey = e.ctrlKey; }
  else if (_def(e.modifiers) && window.Event) { this.ctrlKey = (e.modifiers & window.Event.CONTROL_MASK) != 0; }
  if (is.opera5or6) { this.shiftKey = e.type=='mousemove' ? e.ctrlKey : e.shiftKey; }
  else if (_def(e.shiftKey)) { this.shiftKey = e.shiftKey; }
  else if (_def(e.modifiers) && window.Event) { this.shiftKey = (e.modifiers & Event.SHIFT_MASK) != 0; }
  if (e.altKey) { this.altKey = e.altKey; }
  else if (_def(e.modifiers) && window.Event) { this.altKey = (e.modifiers & Event.ALT_MASK) != 0; }
  if (e.metaKey) { this.metaKey = e.metaKey; }

  // button (?)
  if (is.ie) { 
    if (this.type.indexOf('mouse') != -1) {
      if (e.button == 1) this.button = this.LEFT;
      else if (e.button == 4) this.button = this.MIDDLE;
      else if (e.button == 2) this.button = this.RIGHT;
    }
    else if (this.type == 'click') this.button = this.LEFT;
    else this.button = 4; // non-mouse event
  }
  else if (_def(e.button)) { // standard
    if (this.type.indexOf('mouse') != -1) { this.button = e.button; if (this.button < 0 || this.button > 2) {this.button = 3;} }
    else if (this.type == 'click') this.button = this.LEFT;
    else this.button = 4; // non-mouse event
  }  
  else if (_def(e.which)) {
    if (document.layers) { // nn4
      if (this.type.indexOf('mouse') != -1) { this.button = e.which - 1; if (this.button < 0 || this.button > 2) {this.button = 3;} }
      else if (this.type == 'click') this.button = this.LEFT;
      else this.button = 4; // non-mouse event
    }
    else { // opera5or6
      if ((e.type == 'click' && e.which == 0) || ((e.type == 'mousedown' || e.type == 'mouseup') && e.which == 1)) {this.button = this.LEFT;}
    }
  }

  if (e.relatedTarget) { this.relatedTarget = e.relatedTarget; }
  else if (e.fromElement) { this.relatedTarget = e.fromElement; } // ? may need to be toElement in some cases ?
  if (_def(e.which)) { this.keyCode = e.which; }
  else if (_def(e.keyCode)) { this.keyCode = e.keyCode; }
  var calcOfs = false;
  if (_def(e.layerX,e.layerY)) { this.offsetX = e.layerX; this.offsetY = e.layerY; }
  else calcOfs = true; // calculate it below
  if (is.opera5or6) { this.pageX = e.clientX; this.pageY = e.clientY; }
  else if (_def(e.pageX,e.pageY)) { this.pageX = e.pageX; this.pageY = e.pageY; }
  else {
    this.pageX = this.clientX + document.cbe.scrollLeft();
    this.pageY = this.clientY + document.cbe.scrollTop();
  }
  
  // Find the CBE event target
  if (document.layers) {
    this.cbeTarget = cbeGetNodeFromPoint(this.pageX, this.pageY);
    // NN4 note: mouseout works only if mouseover and mouseout are both added to the same object
    if (this.type == 'mouseover') cbeMOT = this.cbeTarget;
    else if (this.type == 'mouseout') this.cbeTarget = cbeMOT || document.cbe;
  }
  else { var target = this.target; while (!target.cbe) {target = cbeGetParentElement(target);} this.cbeTarget = target.cbe; }
  this.cbeCurrentTarget = this.cbeTarget;
  if (calcOfs) { this.offsetX = this.pageX - this.cbeTarget.pageX(); this.offsetY = this.pageY - this.cbeTarget.pageY(); }
}

CrossBrowserElement.prototype.addEventListener = function(eventType, eventListener, useCapture, listenerObject) {
  if (!useCapture) useCapture = false;
  eventType = eventType.toLowerCase();
  if (
    (eventType.indexOf('mouse') != -1)
    || eventType == 'click'
    || (eventType.indexOf('key') != -1)
/*    || (eventType.indexOf('resize') != -1 && !is.nav4 && !is.opera)
    || (eventType.indexOf('scroll') != -1 && !is.nav && !is.opera) */
  ) {
    var add=true;
    for (var i=0; i < this.listeners.length; ++i) { if (eventType == this.listeners[i].type) {add=false; break;} }
    if (add) {
      cbeNativeAddEventListener(this.ele, eventType, cbePropagateEvent, false);
    }
    this.listeners[this.listeners.length] = new cbeELReg(eventType, eventListener, useCapture, listenerObject);
    return;
  }
  switch(eventType) {
    case 'slidestart': this.onslidestart = eventListener; return;
    case 'slide': this.onslide = eventListener; return;
    case 'slideend': this.onslideend = eventListener; return;
    case 'dragstart': this.ondragstart = eventListener; return;
    case 'drag':
      this.ondragCapture = useCapture;
      this.ondrag = eventListener;
      this.addEventListener('mousedown', cbeDragStartEvent, useCapture);
      return;
    case 'dragend': this.ondragend = eventListener; return;
    case 'dragresize': if (window.cbeUtilJsLoaded) cbeAddDragResizeListener(this); return;
    case 'scroll':
      if (is.nav || is.opera) {
        window.cbeOldScrollTop = cbePageYOffset();
        window.cbeOnScrollListener = eventListener;
        cbeScrollEvent();
        return;
      }
      break;
    case 'resize':
      if (is.nav4 || is.opera) {
        window.cbeOldWidth = cbeInnerWidth();
        window.cbeOldHeight = cbeInnerHeight();
        window.cbeOnResizeListener = eventListener;
        cbeResizeEvent();
        return;
      }
      break;
  } // end switch
  cbeNativeAddEventListener(this.ele, eventType, eventListener, useCapture);
}
function cbeNativeAddEventListener(ele, eventType, eventListener, useCapture) {
  if (!useCapture) useCapture = false;
  eventType = eventType.toLowerCase();
  var eh = "ele.on" + eventType + "=eventListener";
  if (ele.addEventListener) {
    ele.addEventListener(eventType, eventListener, useCapture);
  }
  else if (ele.captureEvents) {
//    if (useCapture || (eventType.indexOf('mousemove')!=-1))  // ???
      ele.captureEvents(eval("Event." + eventType.toUpperCase()));
    eval(eh);
  }
  else { eval(eh); }
}
function cbeNativeRemoveEventListener(ele, eventType, eventListener, useCapture) {
  if (!useCapture) useCapture = false;
  eventType = eventType.toLowerCase();
  var eh = "ele.on" + eventType + "=null";
  if (ele.removeEventListener) {
    ele.removeEventListener(eventType, eventListener, useCapture);
  }
  else if (ele.releaseEvents) {
//    if (useCapture || (eventType.indexOf('mousemove')!=-1))  // ???
      ele.releaseEvents(eval("Event." + eventType.toUpperCase()));
    eval(eh);
  }
  else { eval(eh); }
}
CrossBrowserElement.prototype.removeEventListener = function(eventType, eventListener, useCapture) {
  eventType = eventType.toLowerCase();
  if (!useCapture) useCapture = false;
  if ((eventType.indexOf('mouse') != -1) || eventType == 'click' || (eventType.indexOf('key') != -1)) {
    var i;
    for (i = 0; i < this.listeners.length; ++i) {
      if (this.listeners[i].type == eventType && this.listeners[i].listener == eventListener && this.listeners[i].capture == useCapture) {
        if (this.listeners.splice) this.listeners.splice(i, 1);
        else this.listeners[i].type = "*";
        break;
      }
    }
    var remove=true;
    for (i = 0; i < this.listeners.length; ++i) { if (eventType == this.listeners[i].type) { remove = false; break; } }
    if (remove) cbeNativeRemoveEventListener(this.ele, eventType, cbePropagateEvent, false);
    return;
  }
  switch(eventType) {
    case 'slidestart': this.onslidestart = null; return;
    case 'slide': this.onslide = null; return;
    case 'slideend': this.onslideend = null; return;
    case 'dragstart': this.ondragstart = null; return;
    case 'drag':
      this.removeEventListener('mousedown', cbeDragStartEvent, this.ondragCapture);
      this.ondrag = null;
      return;
    case 'dragend': this.ondragend = null; return;
    case 'dragresize': if (window.cbeUtilJsLoaded) cbeRemoveDragResizeListener(this); return;
    case 'scroll':
      if (is.nav || is.opera) {
        window.cbeOnScrollListener = null;
        return;
      }
      break;
    case 'resize':
      if (is.nav4 || is.opera) {
        window.cbeOnResizeListener = null;
        return;
      }
      break;
  } // end switch
  cbeNativeRemoveEventListener(this.ele, eventType, eventListener, useCapture);
}
CrossBrowserEvent.prototype.stopPropagation = function() { this.stopPropagationFlag = true; }
CrossBrowserEvent.prototype.preventDefault = function() { this.preventDefaultFlag = true; }
CrossBrowserElement.prototype.dispatchEvent= function(e) {
  var dispatch;
  e.cbeCurrentTarget = this;
  for (var i=0; i < this.listeners.length; ++i) {
    dispatch = false;
    if (e.type == this.listeners[i].type) {
      if (e.eventPhase == e.CAPTURING_PHASE) {
        if (this.listeners[i].capture) dispatch = true;
      }
      else if (!this.listeners[i].capture) dispatch = true;
    }
    if (dispatch) {
      if (this.listeners[i].obj) cbeEval(this.listeners[i].obj, this.listeners[i].listener, e);
      else cbeEval(this.listeners[i].listener, e);
    }
  }
}
function cbePropagateEvent(evt) {
  var i=0, e=null, a=new Array();
  if (evt) e = new CrossBrowserEvent(evt);
  else if (window.event) e = new CrossBrowserEvent(window.event);
  else return;
  // Create an array of EventTargets, following the parent chain up (does not include cbeTarget)
  var node = e.cbeTarget.parentNode;
  while(node) {
    a[i++] = node;
    node = node.parentNode;
  }
  // The capturing phase
  e.eventPhase = e.CAPTURING_PHASE;
  for (i = a.length-1; i>=0; --i) {
    a[i].dispatchEvent(e);
    if (e.stopPropagationFlag) break;
  }
  // The at-target phase
  if (!e.stopPropagationFlag) {
    e.eventPhase = e.AT_TARGET;
    e.cbeTarget.dispatchEvent(e);
    // The bubbling phase
    if (!e.stopPropagationFlag && e.bubbles) {
      e.eventPhase = e.BUBBLING_PHASE;
      for (i = 0; i < a.length; ++i) {
        a[i].dispatchEvent(e);
        if (e.stopPropagationFlag) break;
      }
    }
  }
  //  Don't allow native bubbling
  if (is.ie) window.event.cancelBubble = true;
  else if (is.gecko) evt.stopPropagation();
  // Allow listener to cancel default action
  if (e.cancelable && e.preventDefaultFlag) {
    if (is.gecko || is.opera) evt.preventDefault();
    return false;
  }
  else return true;
}
function cbeGetNodeFromPoint(x, y) {
  var hn /* highNode */, hz=0 /* highZ */, cn /* currentNode */, cz /* currentZ */;
  hn = document.cbe;
  while (hn.firstChild && hz >= 0) {
    hz = -1;
    cn = hn.firstChild;
    while (cn) {
      if (cn.contains(x, y)) {
        cz = cn.zIndex();
        if (cz >= hz) {
          hn = cn;
          hz = cz;
        }
      }
      cn = cn.nextSibling;
    }
  }
  return hn;
}
function cbeScrollEvent() {
  if (!window.cbeOnScrollListener) { return; }
  if (cbePageYOffset() != window.cbeOldScrollTop) {
    cbeEval(window.cbeOnScrollListener);
    window.cbeOldScrollTop = cbePageYOffset();
  }
  setTimeout("cbeScrollEvent()", 250);
}
function cbeResizeEvent() {
  if (!window.cbeOnResizeListener) { return; }
  var dw = window.cbeOldWidth - cbeInnerWidth();
  var dh = window.cbeOldHeight - cbeInnerHeight();
  if (dw != 0 || dh != 0) {
    if (window.cbeOnResizeListener) cbeEval(window.cbeOnResizeListener, dw, dh);
    window.cbeOldWidth = cbeInnerWidth();
    window.cbeOldHeight = cbeInnerHeight();
  }
  setTimeout("cbeResizeEvent()", 250);
}
function cbeDefaultResizeListener() {
  if (is.opera) location.replace(location.href);
  else history.go(0);
}
var cbeDragObj, cbeDragTarget, cbeDragPhase;
function cbeDragStartEvent(e) {
  if (is.opera) { var tn = e.target.tagName.toLowerCase(); if (tn == 'a') return; }
  else if (is.nav4) { if (e.target.href) return; }
  cbeDragObj = e.cbeCurrentTarget;
  cbeDragTarget = e.cbeTarget;
  if (cbeDragTarget.id == cbeDragObj.id) cbeDragPhase = e.AT_TARGET;
  else if (cbeDragObj.ondragCapture) cbeDragPhase = e.CAPTURING_PHASE;
  else cbeDragPhase = e.BUBBLING_PHASE;
  if (cbeDragObj) {
    if (cbeDragObj.ondragstart) { e.type = 'dragstart'; cbeEval(cbeDragObj.ondragstart, e); e.type = 'mousedown'; }
    cbeDragObj.x = e.pageX;
    cbeDragObj.y = e.pageY;
    document.cbe.addEventListener('mousemove', cbeDragEvent, cbeDragObj.ondragCapture);
    document.cbe.addEventListener('mouseup', cbeDragEndEvent, false);
  }
  e.stopPropagation();
  e.preventDefault();
}
function cbeDragEndEvent(e) {
  document.cbe.removeEventListener('mousemove', cbeDragEvent, cbeDragObj.ondragCapture);
  document.cbe.removeEventListener('mouseup', cbeDragEndEvent, false);
  if (cbeDragObj.ondragend) {
    e.type = 'dragend';
    e.cbeCurrentTarget = cbeDragObj;
    e.cbeTarget = cbeDragTarget;
    cbeEval(cbeDragObj.ondragend, e);
    e.type = 'mouseup';
  }
  //e.stopPropagation();
  e.preventDefault();
}
function cbeDragEvent(e) {
  if (cbeDragObj) {
    e.dx = e.pageX - cbeDragObj.x;
    e.dy = e.pageY - cbeDragObj.y;
    cbeDragObj.x = e.pageX;
    cbeDragObj.y = e.pageY;
    e.type = 'drag';
    e.cbeTarget = cbeDragTarget;
    e.cbeCurrentTarget = cbeDragObj;
    e.eventPhase = cbeDragPhase;
    if (cbeDragObj.ondrag) cbeEval(cbeDragObj.ondrag, e);
    else cbeDragObj.moveBy(e.dx,e.dy);
    e.type = 'mousemove';
  }
  //e.stopPropagation();
  e.preventDefault();
}
var cbeEventPhase = new Array('', 'AT_TARGET', 'BUBBLING_PHASE', 'CAPTURING_PHASE');
var cbeButton = new Array('LEFT', 'MIDDLE', 'RIGHT', 'undefined', 'non-mouse event');
CrossBrowserElement.prototype.ondragstart = null;
CrossBrowserElement.prototype.ondrag = null;
CrossBrowserElement.prototype.ondragend = null;
var cbeEventJsLoaded = true;
// End cbe_event.js

</script>
<!-- cbe_slide.js -->
<script type="text/javascript" >
/* cbe_slide.js $Revision: 0.12 $
 * CBE v4.19, Cross-Browser DHTML API from Cross-Browser.com
 * Copyright (c) 2002 Michael Foster (mike@cross-browser.com)
 * Distributed under the terms of the GNU LGPL from gnu.org
*/
CrossBrowserElement.prototype.slideBy = function(dX, dY, totalTime, endListener) {
  var targetX, targetY;
  dX = parseInt(dX); dY = parseInt(dY); targetX = this.left() + dX; targetY = this.top() + dY;
  this.slideTo(targetX, targetY, totalTime, endListener)
}
CrossBrowserElement.prototype.slideTo = function(x, y, totalTime, endListener) {
  if (this.onslidestart) cbeEval(this.onslidestart, this);
  this.xTarget = parseInt(x); this.yTarget = parseInt(y);
  this.slideTime = parseInt(totalTime);
  if (isNaN(this.xTarget)) {
    var outside=false;
    if (isNaN(this.yTarget)) { y = 0; outside = true; }
    this.cardinalPosition(x, y, outside); this.xTarget = this.x; this.yTarget = this.y;
  }
  if (endListener && window.cbeEventJsLoaded) { this.autoRemoveListener = true; this.addEventListener('slideend', endListener); }
  this.stop = false;
  this.yA = this.yTarget - this.top(); this.xA = this.xTarget - this.left(); // A = distance
  this.B = Math.PI / (2 * this.slideTime); // B = period
  this.yD = this.top(); this.xD = this.left(); // D = initial position
  if (this.slideRate == cbeSlideRateLinear) { this.B = 1/this.slideTime; }
  else if (this.slideRate == cbeSlideRateCosine) {
    this.yA = -this.yA; this.xA = -this.xA; this.yD = this.yTarget; this.xD = this.xTarget;
  }
  var d = new Date(); this.C = d.getTime();
  if (!this.moving) this.slide();
}
CrossBrowserElement.prototype.slide = function() {
  var now, s, t, newY, newX;
  now = new Date();
  t = now.getTime() - this.C;
  if (this.stop) { this.moving = false; }
  else if (t < this.slideTime) {
    setTimeout("window.cbeAll["+this.index+"].slide()", this.timeout);
    if (this.slideRate == cbeSlideRateLinear) s = this.B * t;
    else if (this.slideRate == cbeSlideRateSine) s = Math.sin(this.B * t);
    else s = Math.cos(this.B * t); // this.slideRate == cbeSlideRateCosine
    newX = Math.round(this.xA * s + this.xD);
    newY = Math.round(this.yA * s + this.yD);
    if (this.onslide) cbeEval(this.onslide, this, newX, newY, t);
    this.moveTo(newX, newY);
    this.moving = true;
  }  
  else {
    this.moveTo(this.xTarget, this.yTarget);
    this.moving = false;
    if (this.onslideend) {
      var tmp = this.onslideend;
      if (this.autoRemoveListener && window.cbeEventJsLoaded) {
        this.autoRemoveListener = false;
        this.removeEventListener('slideend');
      }
      cbeEval(tmp, this);
    }
  }  
}
CrossBrowserElement.prototype.ellipse = function(xRadius, yRadius, radiusInc, totalTime, startAngle, stopAngle, endListener) {
  if (this.onslidestart) cbeEval(this.onslidestart, this);
  this.stop = false;
  this.xA = parseInt(xRadius);
  this.yA = parseInt(yRadius);
  this.radiusInc = parseInt(radiusInc);
  this.slideTime = parseInt(totalTime);
  startAngle = cbeRadians(parseFloat(startAngle));
  stopAngle = cbeRadians(parseFloat(stopAngle));
  if (endListener && window.cbeEventJsLoaded) {
    this.autoRemoveListener = true;
    this.addEventListener('slideend', endListener);
  }
  var startTime = (startAngle * this.slideTime) / (stopAngle - startAngle);
  this.stopTime = this.slideTime + startTime;
  this.B = (stopAngle - startAngle) / this.slideTime;
  this.xD = this.left() - Math.round(this.xA * Math.cos(this.B * startTime)); // center point
  this.yD = this.top() - Math.round(this.yA * Math.sin(this.B * startTime)); 
  this.xTarget = Math.round(this.xA * Math.cos(this.B * this.stopTime) + this.xD); // end point
  this.yTarget = Math.round(this.yA * Math.sin(this.B * this.stopTime) + this.yD); 
  var d = new Date();
  this.C = d.getTime() - startTime;
  if (!this.moving) this.ellipse1();
}
CrossBrowserElement.prototype.ellipse1 = function() {
  var now, t, newY, newX;
  now = new Date();
  t = now.getTime() - this.C;
  if (this.stop) { this.moving = false; }
  else if (t < this.stopTime) {
    setTimeout("window.cbeAll["+this.index+"].ellipse1()", this.timeout);
    if (this.radiusInc) {
      this.xA += this.radiusInc;
      this.yA += this.radiusInc;
    }
    newX = Math.round(this.xA * Math.cos(this.B * t) + this.xD);
    newY = Math.round(this.yA * Math.sin(this.B * t) + this.yD);
    if (this.onslide) cbeEval(this.onslide, this, newX, newY, t);
    this.moveTo(newX, newY);
    this.moving = true;
  }  
  else {
    if (this.radiusInc) {
      this.xTarget = Math.round(this.xA * Math.cos(this.B * this.slideTime) + this.xD);
      this.yTarget = Math.round(this.yA * Math.sin(this.B * this.slideTime) + this.yD); 
    }
    this.moveTo(this.xTarget, this.yTarget);
    this.moving = false;
    if (this.onslideend) {
      var tmp = this.onslideend;
      if (this.autoRemoveListener && window.cbeEventJsLoaded) {
        this.autoRemoveListener = false;
        this.removeEventListener('slideend');
      }
      cbeEval(tmp, this);
    }
  }  
}
CrossBrowserElement.prototype.stopSlide = function() { this.stop = true; }
CrossBrowserElement.prototype.startSequence = function(uIndex) {
  if (!this.moving) {
    if (!uIndex) this.seqIndex = 0;
    else this.seqIndex = uIndex;
    this.addEventListener('slideEnd', cbeSlideSequence);
    cbeSlideSequence(this);
  }
}
CrossBrowserElement.prototype.stopSequence = function() {
  this.stop=true;
  this.removeEventListener('slideEnd', cbeSlideSequence);
}
function cbeSlideSequence(cbe) {
  var
    pw = cbe.parentNode.width(),
    ph = cbe.parentNode.height(),
    w = cbe.width(),
    h = cbe.height();
  if (cbe.seqIndex >= cbe.sequence.length) cbe.seqIndex = 0;
  eval('cbe.'+cbe.sequence[cbe.seqIndex++]);
}
var cbeSlideRateLinear=0, cbeSlideRateSine=1, cbeSlideRateCosine=2;
CrossBrowserElement.prototype.slideRate = cbeSlideRateSine;
CrossBrowserElement.prototype.seqIndex = 0;
CrossBrowserElement.prototype.radiusInc = 0;
CrossBrowserElement.prototype.t = 0;
CrossBrowserElement.prototype.xTarget = 0;     
CrossBrowserElement.prototype.yTarget = 0;     
CrossBrowserElement.prototype.slideTime = 1000;
CrossBrowserElement.prototype.xA = 0;
CrossBrowserElement.prototype.yA = 0;
CrossBrowserElement.prototype.xD = 0;
CrossBrowserElement.prototype.yD = 0;
CrossBrowserElement.prototype.B = 0;
CrossBrowserElement.prototype.C = 0;
CrossBrowserElement.prototype.moving = false;
CrossBrowserElement.prototype.stop = true;
CrossBrowserElement.prototype.timeout = 35;
CrossBrowserElement.prototype.autoRemoveListener = false;
CrossBrowserElement.prototype.onslidestart = null;
CrossBrowserElement.prototype.onslide = null;
CrossBrowserElement.prototype.onslideend = null;
var cbeSlideJsLoaded = true;
// End cbe_slide.js

</script>
<!-- cbe_util.js -->
<script type="text/javascript" >
/* cbe_util.js $Revision: 0.14 $
 * CBE v4.19, Cross-Browser DHTML API from Cross-Browser.com
 * Copyright (c) 2002 Michael Foster (mike@cross-browser.com)
 * Distributed under the terms of the GNU LGPL from gnu.org
*/
// visit function returns: 0 == stop, 1 == continue, 2 == skip subtree
function cbeTraverseTree(order, startNode, visitFunction, data) {
  cbeTraversePreOrder(startNode, 0, 0, visitFunction, data);
}
function cbeTraversePreOrder(node, level, branch, vFn, data) {
  var ret = vFn(node,level,branch,data);
  if (!ret) return 0;
  if (ret == 1 && node.firstChild) {
    var child = node.firstChild;
    while (child) {
      if (!level) ++branch;
      if (!cbeTraversePreOrder(child,level+1,branch,vFn,data)) return 1;
      child = child.nextSibling;
    }
  }
  return 1;
}
var cbeImageCount=0;
var cbeImageObj = new Array();
var cbeImageName = new Array();
function cbeNewImage(imgName, imgUrl, imgWidth, imgHeight) {
  var imgObj;
  if (arguments.length == 4) imgObj = new Image(imgWidth,imgHeight);
  else imgObj = new Image();
  imgObj.src = imgUrl;
  imgObj.id = imgObj.name = imgName;
  cbeImageObj[cbeImageCount] = imgObj;
  cbeImageName[cbeImageCount++] = imgName;
  return imgObj;
}
function cbeSetImage(tagImg, preloadedImg) {
  var t, p;
  if (typeof(tagImg)=='string') t = cbeGetImageByName(tagImg);
  else t = tagImg;
  if (typeof(preloadedImg)=='string') p = cbeGetImageByName(preloadedImg);
  else p = preloadedImg;
  t.src = p.src;
}
function cbeGetImageByName(imgName) {
  var i, j;
  if (document.images[imgName]) return document.images[imgName];
  if (is.nav4) {
    for (i = 0; i < cbeAll.length; i++) {
      if (cbeAll[i].ele.document) {
        for (j = 0; j < cbeAll[i].ele.document.images.length; j++) {
          if (imgName == cbeAll[i].ele.document.images[j].name) return cbeAll[i].ele.document.images[j];
        }
      }
    }
  }
  for (i = 0; i < cbeImageName.length; i++) {
    if (cbeImageName[i] == imgName) return cbeImageObj[i];
  }
  return null;
}
function cbeGetFormByName(frmName) {
  var i, j;
  if (document.forms[frmName]) return document.forms[frmName];
  if (is.nav4) {
    for (i = 0; i < cbeAll.length; i++) {
      if (cbeAll[i].ele.document) {
        for (j = 0; j < cbeAll[i].ele.document.forms.length; j++) {
          if (frmName == cbeAll[i].ele.document.forms[j].name) return cbeAll[i].ele.document.forms[j];
        }
      }
    }
  }
  return null;
}
// cookie implementations based on code from Netscape Javascript Guide
function cbeSetCookie(name, value, expire, path) {
  document.cookie = name + "=" + escape(value) + ((!expire) ? "" : ("; expires=" + expire.toGMTString())) + "; path=/";
}
function cbeGetCookie(name) {
  var value=null, search=name+"=";
  if (document.cookie.length > 0) {
    var offset = document.cookie.indexOf(search);
    if (offset != -1) {
      offset += search.length;
      var end = document.cookie.indexOf(";", offset);
      if (end == -1) end = document.cookie.length;
      value = unescape(document.cookie.substring(offset, end));
    }
  }
  return value;
}
function cbeGetURLArguments() {
  var idx = location.href.indexOf('?');
  var params = new Array();
  if (idx != -1) {
    var pairs = location.href.substring(idx+1, location.href.length).split('&');
    for (var i=0; i<pairs.length; i++) {
      nameVal = pairs[i].split('=');
      params[i] = nameVal[1];
      params[nameVal[0]] = nameVal[1];
    }
  }
  return params;
}
function cbePad(str, finalLen, padChar, left) {
  if (left) { for (var i=str.length; i<finalLen; ++i) str = padChar + str; }
  else { for (var i=str.length; i<finalLen; ++i) str += padChar; }
  return str;
}  
function cbeHexString(n, digits, prefix) {
  var p = '', n = Math.ceil(n);
  if (prefix) p = prefix;
  n = n.toString(16);
  for (var i=0; i < digits - n.length; ++i) {
    p += '0'; 
  }
  return p + n;
}
function cbeRadians(deg) { return deg * (Math.PI / 180); }
function cbeDegrees(rad) { return rad * (180 / Math.PI); }
function cbeAddDragResizeListener(cbe) {
  cbe.addEventListener('dragStart', cbeDragResizeStartListener);
  cbe.addEventListener('drag', cbeDragResizeListener);
}
function cbeRemoveDragResizeListener(cbe) {
  cbe.removeEventListener('dragStart', cbeDragResizeStartListener);
  cbe.removeEventListener('drag', cbeDragResizeListener);
}
function cbeDragResizeStartListener(e) {
  if (e.offsetX > (e.cbeCurrentTarget.width() - 20) && e.offsetY > (e.cbeCurrentTarget.height() - 20)) {
    e.cbeCurrentTarget.isResizing = true;
  }
  else e.cbeCurrentTarget.isResizing = false;
}
function cbeDragResizeListener(e) {
  if (e.cbeCurrentTarget.isResizing) e.cbeCurrentTarget.resizeBy(e.dx, e.dy);
  else e.cbeCurrentTarget.moveBy(e.dx, e.dy);
}
var cbeUtilJsLoaded = true;
// End cbe_util.js

</script>
<!-- index.js -->
<script type="text/javascript" >
var now  = new Date();
var currYear,currMonth;
var i,j,currDateObj,firstDay,daysInMonth,sevenDayRows;
var DHTMLC, prev, curr, next, moniker;
var months  = new Array('January','February','March','April','May','June','July','August','September','October','November','December');
var days  = new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

/*
1. Is Cookie set?
  YES: Retrieve and set currMonth & currYear to the values stored in Cookie
  NO: Set currMonth & currYear to now and set Cookie
2. CBE will automatically call windowOnLoad() which, in turn, will...
 a. Create the CrossBrowserElement objects.
 b. Call Calendar() which will...
  i. Calculate the calendar info: firstDay, daysInMonth, sevenDayRows.
  ii. Determine nextMonth, nextYear, prevMonth, & prevYear.
  iii. Call cbeTraverseTree() with a reference to drawCalendar() which will...
   * Populate the innerHTML for each object in the CBE Object Tree.
*/

// For simplicity's sake: Include the equal sign in the cookie's name
var cookieName = 'ISO8601=';

if (document.cookie.indexOf(cookieName) != -1) {
  // Retrieve the stored date to set the global variables (used to generate the calender)
  start = document.cookie.indexOf(cookieName) + cookieName.length;  
  end = document.cookie.indexOf(";",start);
  if (end == -1) end = document.cookie.length;
  ISO8601 = document.cookie.substring(start,end);
  currDate = ISO8601.split('-');
  currYear  = currDate[0];
  currMonth  = currDate[1];
} else {
  // Use the present date to set the global variables (used to generate the calender)
  currYear  = now.getYear();
  currMonth  = now.getMonth();
  // Some browsers may not be Y2K compliant...
  if (currYear < 1900) currYear += 1900;
}

function Calendar(Month,Year) {
  currDateObj  = new Date(Year,Month,1);

  // Update the global variables (used to generate the calender)
  currMonth  = Month;
  currYear  = Year;
  
  // Perform the basic calculations necessary to generate a calendar
  firstDay  = currDateObj.getDay();  // The day-of-the-week of the first day of the month;
  daysInMonth  = 32 - new Date(Year,Month,32).getDate();
  sevenDayRows = Math.ceil((firstDay + daysInMonth) / 7);
  
  switch (Month) {
  case 0:
    nextMonth  = Month + 1;
    nextYear  = Year;
    prevMonth  = 11;
    prevYear  = Year - 1;
    break;
  
  case 11:
    nextMonth  = 0;
    nextYear  = Year + 1;
    prevMonth  = Month - 1;
    prevYear  = Year;
    break;
  
  default:
    nextMonth  = Month + 1;
    nextYear  = Year;
    prevMonth  = Month - 1;
    prevYear  = Year;
    break;
  }
  
  i = 0; j = 1;
  cbeTraverseTree('preorder',DHTMLC,drawCalendar);

  DHTMLC.resizeTo(230, sevenDayRows * 20 + 60);
  moniker.top(sevenDayRows * 20 + 50);
  prev.innerHtml('<A HREF="javascript:Calendar(prevMonth,prevYear);">' + months[prevMonth].substr(0,3) + '</A>');
  curr.innerHtml(months[Month] + ', ' + Year);
  next.innerHtml('<A HREF="javascript:Calendar(nextMonth,nextYear);">' + months[nextMonth].substr(0,3) + '</A>');
}

function drawCalendar(node,level,branch) {
  var HREF;
  if (level == 2 && branch > 2) {
    if (i >= firstDay && j <= daysInMonth) {
      HREF = 'javascript:void(document.forms[0].elements[0].value=\'' + (currMonth + 1) + '/' + j + '/' + currYear + '\')';
      node.innerHtml('<A HREF="' + HREF + '">' + j++ + '</A>');
      node.innerHtml();node.show();
    } else {
      node.hide();
    }
    i++;
  }
  return true;
}

var clicked, displaying;
var buttons, button1, button2, button3, button4, button5;
var page, wii, htui, will, htgi, wywn;
var cover;

function createSlides(node,level,branch) {
  if (level == 1) {
    with(node) {
      node.moveTo(0,450);
      node.sizeTo(550,420);
    }
  }
  return true;
}

function resetButtonColors(node,level,branch) {
  if (node.id == 'badge1') return true;
  if (level == 1) node.background('#ccffcc');
  return true;
}

function mouseOverListener(e) {
  if (e.cbeCurrentTarget.id == clicked) return true;
  e.cbeCurrentTarget.background('#99ff99');
}

function mouseOutListener(e) {
  if (e.cbeCurrentTarget.id == clicked) return true;
  e.cbeCurrentTarget.background('#ccffcc');
}

function onClickListener(e) {
  cbeTraverseTree('preorder',buttons,resetButtonColors);
  e.cbeCurrentTarget.background('#ffffff');
  clicked = e.cbeCurrentTarget.id;

  if (displaying) eval(displaying).slideTo(0,450,1500);
  switch(e.cbeCurrentTarget.id) {
  case 'button1': displaying = 'wii';  wii.slideTo(0,0,1500);  break;
  case 'button2': displaying = 'will'; will.slideTo(0,0,1500); break;
  case 'button3': displaying = 'wywn'; wywn.slideTo(0,0,1500); break;
  case 'button4': displaying = 'htgi'; htgi.slideTo(0,0,1500); break;
  case 'button5': displaying = 'htui'; htui.slideTo(0,0,1500); break;
  }
}

function windowOnload() {
  page  = cbeGetElementById('page').cbe;
  page.sizeTo(570,450);
  page.clip('auto');

  if (is.ie4up) page.left(171);

  cbeTraverseTree('preorder',page,createSlides);
  // These references will be accessed by eval'ing their names in onClickListener()
  wii  = cbeGetElementById('wii').cbe;
  htui  = cbeGetElementById('htui').cbe;
  will  = cbeGetElementById('will').cbe;
  htgi  = cbeGetElementById('htgi').cbe;
  wywn  = cbeGetElementById('wywn').cbe;

  buttons = cbeGetElementById('buttons').cbe;

  button1 = cbeGetElementById('button1').cbe;
  button1.addEventListener('mouseOver',mouseOverListener);
  button1.addEventListener('mouseOut',mouseOutListener);
  button1.addEventListener('click',onClickListener);

  button2 = cbeGetElementById('button2').cbe;
  button2.addEventListener('mouseOver',mouseOverListener);
  button2.addEventListener('mouseOut',mouseOutListener);
  button2.addEventListener('click',onClickListener);

  button3 = cbeGetElementById('button3').cbe;
  button3.addEventListener('mouseOver',mouseOverListener);
  button3.addEventListener('mouseOut',mouseOutListener);
  button3.addEventListener('click',onClickListener);

  button4 = cbeGetElementById('button4').cbe;
  button4.addEventListener('mouseOver',mouseOverListener);
  button4.addEventListener('mouseOut',mouseOutListener);
  button4.addEventListener('click',onClickListener);

  button5 = cbeGetElementById('button5').cbe;
  button5.addEventListener('mouseOver',mouseOverListener);
  button5.addEventListener('mouseOut',mouseOutListener);
  button5.addEventListener('click',onClickListener);

  cover  = cbeGetElementById('cover').cbe;
  cover.sizeTo(570,450);
  cover.hide();

  DHTMLC  = cbeGetElementById('DHTMLC').cbe;
  prev  = cbeGetElementById('prev').cbe;
  curr  = cbeGetElementById('curr').cbe;
  next  = cbeGetElementById('next').cbe;
  moniker  = cbeGetElementById('moniker').cbe;

  Calendar(currMonth,currYear);
  DHTMLC.clip('auto');
  DHTMLC.show();
}


</script>

</head>
<body>
<div id="buttons">
  <div style="background-color: rgb(204, 255, 204);" id="button1" class="button">First Item</div>
  <div style="background-color: rgb(204, 255, 204);" id="button2" class="button">Second Item</div>
  <div style="background-color: rgb(204, 255, 204);" id="button3" class="button">Third</div>
  <div style="background-color: rgb(204, 255, 204);" id="button4" class="button">Fourth</div>
  <div style="background-color: rgb(255, 255, 255);" id="button5" class="button">Fifth</div>
  
</div>
<div style="width: 568px; height: 448px; visibility: hidden;" id="cover">
  <div id="oops" class="container">
    <p class="title">Oops - There's been an error!</p>
    <p class="content">If this notice remains visible for more than 10-15 seconds please <a href='javascript:alert("This feature is currently under development.");window.location.reload();'>click here</a> to be redirected to the static version of this site.</p>
  </div>
</div>
<div style="width: 568px; height: 448px; clip: rect(0px, 570px, 450px, 0px);" id="page">
  <div style="left: 0px; top: 450px; width: 550px; height: 409px;" id="wii" class="container">
    <p class="title">First Item</p>
    <p class="content">Content</p>
    <p class="content">Content</p>
    <ul class="content">
      <li>1</li>
      <li>2</li>
    </ul>
  </div>

  <div style="width: 550px; height: 409px; left: 0px; top: 450px;" id="will" class="container">
    <div style="float: right;">
    <div style="width: 228px; height: 158px; clip: rect(0px, 230px, 160px, 0px); visibility: inherit;" id="DHTMLC">

      <div id="nav" style="position: absolute; left: 10px; top: 10px;">
        <div id="prev" class="months" style="top: 0px; left: 0px;"><a href="javascript:Calendar(prevMonth,prevYear);">Jul</a></div>
        <div id="curr" class="months" style="top: 0px; left: 45px; width: 118px;">August, 2005</div>
        <div id="next" class="months" style="top: 0px; left: 163px;"><a href="javascript:Calendar(nextMonth,nextYear);">Sep</a></div>
      </div>
      <div id="header" style="position: absolute; left: 10px; top: 30px;">
        <div id="sun_header" class="dotw" style="top: 0px; left: 0px;">Sun</div>
        <div id="mon_header" class="dotw" style="top: 0px; left: 30px;">Mon</div>
        <div id="tue_header" class="dotw" style="top: 0px; left: 60px;">Tue</div>
        <div id="wed_header" class="dotw" style="top: 0px; left: 90px;">Wed</div>
        <div id="thu_header" class="dotw" style="top: 0px; left: 120px;">Thu</div>
        <div id="fri_header" class="dotw" style="top: 0px; left: 150px;">Fri</div>
        <div id="sat_header" class="dotw" style="top: 0px; left: 180px;">Sat</div>
      </div>
      <div id="row1" class="week" style="position: absolute; left: 10px; top: 50px;">
        <div id="sun1" class="days" style="top: 0px; left: 0px; visibility: hidden;">Sun</div>
        <div id="mon1" class="days" style="top: 0px; left: 30px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/1/2005')">1</a></div>
        <div id="tue1" class="days" style="top: 0px; left: 60px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/2/2005')">2</a></div>
        <div id="wed1" class="days" style="top: 0px; left: 90px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/3/2005')">3</a></div>
        <div id="thu1" class="days" style="top: 0px; left: 120px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/4/2005')">4</a></div>
        <div id="fri1" class="days" style="top: 0px; left: 150px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/5/2005')">5</a></div>
        <div id="sat1" class="days" style="top: 0px; left: 180px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/6/2005')">6</a></div>
      </div>
      <div id="row2" style="position: absolute; left: 10px; top: 70px;">
        <div id="sun2" class="days" style="top: 0px; left: 0px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/7/2005')">7</a></div>
        <div id="mon2" class="days" style="top: 0px; left: 30px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/8/2005')">8</a></div>
        <div id="tue2" class="days" style="top: 0px; left: 60px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/9/2005')">9</a></div>
        <div id="wed2" class="days" style="top: 0px; left: 90px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/10/2005')">10</a></div>
        <div id="thu2" class="days" style="top: 0px; left: 120px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/11/2005')">11</a></div>
        <div id="fri2" class="days" style="top: 0px; left: 150px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/12/2005')">12</a></div>
        <div id="sat2" class="days" style="top: 0px; left: 180px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/13/2005')">13</a></div>
      </div>
      <div id="row3" style="position: absolute; left: 10px; top: 90px;">
        <div id="sun3" class="days" style="top: 0px; left: 0px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/14/2005')">14</a></div>
        <div id="mon3" class="days" style="top: 0px; left: 30px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/15/2005')">15</a></div>
        <div id="tue3" class="days" style="top: 0px; left: 60px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/16/2005')">16</a></div>
        <div id="wed3" class="days" style="top: 0px; left: 90px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/17/2005')">17</a></div>
        <div id="thu3" class="days" style="top: 0px; left: 120px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/18/2005')">18</a></div>
        <div id="fri3" class="days" style="top: 0px; left: 150px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/19/2005')">19</a></div>
        <div id="sat3" class="days" style="top: 0px; left: 180px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/20/2005')">20</a></div>
      </div>
      <div id="row4" style="position: absolute; left: 10px; top: 110px;">
        <div id="sun4" class="days" style="top: 0px; left: 0px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/21/2005')">21</a></div>
        <div id="mon4" class="days" style="top: 0px; left: 30px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/22/2005')">22</a></div>
        <div id="tue4" class="days" style="top: 0px; left: 60px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/23/2005')">23</a></div>
        <div id="wed4" class="days" style="top: 0px; left: 90px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/24/2005')">24</a></div>
        <div id="thu4" class="days" style="top: 0px; left: 120px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/25/2005')">25</a></div>
        <div id="fri4" class="days" style="top: 0px; left: 150px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/26/2005')">26</a></div>
        <div id="sat4" class="days" style="top: 0px; left: 180px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/27/2005')">27</a></div>
      </div>
      <div id="row5" style="position: absolute; left: 10px; top: 130px;">
        <div id="sun5" class="days" style="top: 0px; left: 0px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/28/2005')">28</a></div>
        <div id="mon5" class="days" style="top: 0px; left: 30px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/29/2005')">29</a></div>
        <div id="tue5" class="days" style="top: 0px; left: 60px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/30/2005')">30</a></div>
        <div id="wed5" class="days" style="top: 0px; left: 90px; visibility: inherit;"><a href="javascript:void(document.forms[0].elements[0].value='8/31/2005')">31</a></div>
        <div id="thu5" class="days" style="top: 0px; left: 120px; visibility: hidden;">Thu</div>
        <div id="fri5" class="days" style="top: 0px; left: 150px; visibility: hidden;">Fri</div>
        <div id="sat5" class="days" style="top: 0px; left: 180px; visibility: hidden;">Sat</div>
      </div>
      <div id="row6" style="position: absolute; left: 10px; top: 150px;">
        <div id="sun6" class="days" style="top: 0px; left: 0px; visibility: hidden;">Sun</div>
        <div id="mon6" class="days" style="top: 0px; left: 30px; visibility: hidden;">Mon</div>
        <div id="tue6" class="days" style="top: 0px; left: 60px; visibility: hidden;">Tue</div>
        <div id="wed6" class="days" style="top: 0px; left: 90px; visibility: hidden;">Wed</div>
        <div id="thu6" class="days" style="top: 0px; left: 120px; visibility: hidden;">Thu</div>
        <div id="fri6" class="days" style="top: 0px; left: 150px; visibility: hidden;">Fri</div>
        <div id="sat6" class="days" style="top: 0px; left: 180px; visibility: hidden;">Sat</div>
      </div>
    </div>
    <span style="text-align: center;"><form>You selected...<input size="10" type="text"></form></span>
    </div>
  
    <p class="title">2</p>
    <p class="content">LIne</p>
    <ol class="content" type="1">
      <li><span class="title">C</span> - </li>
      <li><span class="title">w</span> s.</li>
      <li><span class="title">days</span> - T</li>
    </ol>
  </div>
  <div style="left: 0px; top: 450px; width: 550px; height: 409px;" id="wywn" class="container">
    <p class="title">3</p>
    <p class="content">.</p>
    <ol class="content" type="1">
      <li>The DHTML Calendar files:
      <ol class="content" type="a">
        <li>,</li>
        <li>d</li>
        <li>.</li>
      </ol>
      </li>
      <li>d
      <ol class="content" type="a">
        <li>cbe_core.js, and</li>
        <li>cbe_util.js.</li>
      </ol>
      </li>
    </ol>
  </div>
  <div style="left: 0px; top: 450px; width: 550px; height: 409px;" id="htgi" class="container">
    <p class="title">H</p>
    <p class="content">e</p>
    <ol class="content" type="1">
      <li>via HTTP, or</li>
      <li>via </a>.</li>
    </ol>
    <p class="content">T</p>
  </div>
  <div style="width: 550px; height: 409px; left: 0px; top: 0px;" id="htui" class="container">
    <p class="title">H</p>
    <p class="content">A</p>
    <ol class="content" type="1">
      <li>R</li>
      <li>R</li>
      <li>U</li>
      <li>E</li>
      <li>I</li>
      <li>I
        <div class="code_ref">
        </div></li>
      <li>n.</li>
    </ol>
  </div>
</div>
</body></html>