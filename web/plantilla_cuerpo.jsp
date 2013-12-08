<%-- 
    Document   : plantilla_cuerpo
    Created on : 03-dic-2013, 22:18:06
    Author     : juanpe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html version="HTML+RDFa 1.0" lang="es" dir="ltr" xmlns="http://www.w3.org/1999/xhtml"
      xmlns:content="http://purl.org/rss/1.0/modules/content/"
      xmlns:dc="http://purl.org/dc/terms/"
      xmlns:foaf="http://xmlns.com/foaf/0.1/"
      xmlns:og="http://ogp.me/ns#"
      xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
      xmlns:sioc="http://rdfs.org/sioc/ns#"
      xmlns:sioct="http://rdfs.org/sioc/types#"
      xmlns:skos="http://www.w3.org/2004/02/skos/core#"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema#">
    <head profile="http://www.w3.org/1999/xhtml/vocab">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="Generator" content="Drupal 7 (http://drupal.org)" />
        <link rel="shortcut icon" href="http://www.ulab.usb.ve/misc/favicon.ico" type="image/vnd.microsoft.icon" />
        <title><tiles:getAsString name="titulo"/></title>
        <style type="text/css" media="all">@import url("http://www.ulab.usb.ve/modules/system/system.base.css?ml8e0y");</style>
        <style type="text/css" media="all">@import url("http://www.ulab.usb.ve/modules/field/theme/field.css?ml8e0y");
            @import url("http://www.ulab.usb.ve/themes/sky/css/user.css?ml8e0y");
            @import url("http://www.ulab.usb.ve/sites/all/modules/views/css/views.css?ml8e0y");</style>
        <style type="text/css" media="all">@import url("http://www.ulab.usb.ve/sites/all/modules/ckeditor/ckeditor.css?ml8e0y");
            @import url("http://www.ulab.usb.ve/sites/all/modules/ctools/css/ctools.css?ml8e0y");</style>
        <style type="text/css" media="all">@import url("http://www.ulab.usb.ve/themes/sky/css/layout.css?ml8e0y");
            @import url("http://www.ulab.usb.ve/themes/sky/css/style.css?ml8e0y");
            @import url("http://www.ulab.usb.ve/themes/sky/css/forms.css?ml8e0y");
            @import url("http://www.ulab.usb.ve/themes/sky/css/colors.css?ml8e0y");</style>
        <style type="text/css" media="print">@import url("http://www.ulab.usb.ve/themes/sky/css/print.css?ml8e0y");</style>

        <!--[if lte IE 7]>
        <link type="text/css" rel="stylesheet" href="http://www.ulab.usb.ve/themes/sky/css/ie.css?ml8e0y" media="all" />
        <![endif]-->
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/jquery.js?v=1.4.4"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/jquery.once.js?v=1.2"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/drupal.js?ml8e0y"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/jquery.cookie.js?v=1.0"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/jquery.form.js?v=2.52"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/ajax.js?v=7.22"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/sites/default/files/languages/es_4XpqCflKazTuXzLphPzjQcs4p_0-3cW6doKJyQdMlBo.js?ml8e0y"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/sites/all/modules/views/js/base.js?ml8e0y"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/misc/progress.js?v=7.22"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/sites/all/modules/views/js/ajax_view.js?ml8e0y"></script>
        <script type="text/javascript" src="http://www.ulab.usb.ve/themes/sky/js/scripts.js?ml8e0y"></script>
        <script type="text/javascript">
            <!--//--><![CDATA[//><!--
        jQuery.extend(Drupal.settings, {"basePath": "\/", "pathPrefix": "", "ajaxPageState": {"theme": "sky", "theme_token": "1mcfSKBygVSp27Fx0CDiUUZ_GAkCPYFfROsiND8pVpQ", "js": {"misc\/jquery.js": 1, "misc\/jquery.once.js": 1, "misc\/drupal.js": 1, "misc\/jquery.cookie.js": 1, "misc\/jquery.form.js": 1, "misc\/ajax.js": 1, "public:\/\/languages\/es_4XpqCflKazTuXzLphPzjQcs4p_0-3cW6doKJyQdMlBo.js": 1, "sites\/all\/modules\/views\/js\/base.js": 1, "misc\/progress.js": 1, "sites\/all\/modules\/views\/js\/ajax_view.js": 1, "themes\/sky\/js\/scripts.js": 1}, "css": {"modules\/system\/system.base.css": 1, "modules\/field\/theme\/field.css": 1, "modules\/user\/user.css": 1, "sites\/all\/modules\/views\/css\/views.css": 1, "sites\/all\/modules\/ckeditor\/ckeditor.css": 1, "sites\/all\/modules\/ctools\/css\/ctools.css": 1, "themes\/sky\/css\/layout.css": 1, "themes\/sky\/css\/style.css": 1, "themes\/sky\/css\/forms.css": 1, "themes\/sky\/css\/colors.css": 1, "themes\/sky\/css\/print.css": 1, "themes\/sky\/css\/ie.css": 1}}, "views": {"ajax_path": "\/views\/ajax", "ajaxViews": {"views_dom_id:f258d0e6a6378f17f545a0c53e3df3ad": {"view_name": "noticias", "view_display_id": "page_1", "view_args": "", "view_path": "noticias", "view_base_path": "noticias", "view_dom_id": "f258d0e6a6378f17f545a0c53e3df3ad", "pager_element": 0}}}});
            //--><!]]>
        </script>
        <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
        </script><![endif]-->
    </head>
    <body class="html not-front not-logged-in two-sidebars page-noticias" >
        <div id="skip-link">
            <a href="" class="element-invisible element-focusable">Pasar al contenido principal</a>
        </div>
        <div id="container" class="container-16">
            <header id="header" class="section section-header clearfix" role="banner">
                <hgroup class="grid-10">
                    <img src="http://www.ulab.usb.ve/sites/default/files/logo_drupal.gif" alt="Inicio"/>
                </hgroup>
            </header>
            <div id="main" class="section section-main clearfix" role="main">
                <div id="content" class="column grid-10 push-3">
                    <div class="breadcrumb"><html:link action="inicio"><p class="leaf">Inicio</p></html:link></div>      <div class="inner">
                        <div id="main-content" class="clearfix">
                            <div class="region region-content">
                                <div class="view view-noticias view-id-noticias view-display-id-page_1 view-dom-id-f258d0e6a6378f17f545a0c53e3df3ad">

                                    <div class="view-content">
                                        

                                        <tiles:insert attribute="cuerpo"/>

                                    </div>

                                </div>  </div>
                        </div>
                    </div>
                </div>
                <div id="sidebar-first" class="sidebar grid-3 pull-10">
                    <div class="region region-sidebar-first">
                        <div id="block-system-main-menu" class="block block-system block-menu first">
                            <div class="inner">
                                <div class="content">
                                    <ul class="menu">
                                        <li class="first leaf"><html:link action="consultar_presupuesto"><p>Presupuesto</p></html:link></li>
                                        <li class="leaf"><html:link action="construccion"><p>Orden de Gastos</p></html:link></li>
                                        <li class="leaf"><html:link action="construccion"><p>Cheques</p></html:link></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div id="sidebar-second" class="sidebar grid-3">
                    <div class="region region-sidebar-second">
                        <div id="block-block-2" class="block block-block first">
                            <div class="inner">
                                <div class="content">
                                    <p><img alt="" src="http://www.ulab.usb.ve/sites/default/files/stikers/logo_ulab.gif" /></p>
                                    <p><img alt="" src="http://www.ulab.usb.ve/sites/default/files/stikers/innovar.gif" /></p>
                                    <p><a href="http://www.ulab.usb.ve/jornadas"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/stickers_jornadas.jpg" /></a></p>
                                    <p><a href="http://159.90.91.211/sites/default/files/catalogo_ulab.pdf"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/cat_ulab.jpg" /></a></p>
                                    <p><a href="http://159.90.91.211/node/26"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/cons_ulab.jpg" /></a></p>
                                    <p><a href="http://159.90.91.211/node/27"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/doc_ulab.jpg" /></a></p>
                                    <p><a href="http://159.90.91.211/node/25"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/comit_ulab.jpg" /></a></p>
                                    <p><a href="https://www.facebook.com/pages/Unidad-de-Laboratorios-USB/173900382644914" target="_blank"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/stikers/facebook.gif" /></a></p>
                                    <p><img alt="" src="http://www.ulab.usb.ve/sites/default/files/somosusb.gif" /></p>
                                    <p> </p>
                                    <p> </p>
                                    <p> </p>
                                    <p> </p>
                                    <p> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer id="footer" class="section section-footer clearfix" role="footer">
                <div class="region region-footer">
                    <div id="block-block-1" class="block block-block first">
                        <div class="inner">
                            <div class="content">
                                <table align="left" border="0" cellpadding="1" cellspacing="1"><tr><td valign="bottom" width="95">
                                            <a href="http://www.usb.ve"><img alt="" src="http://www.ulab.usb.ve/sites/default/files/cebolla_70_45.jpg" /></a>
                                            <td valign="bottom">
                                                <a href="http://www.usb.ve/home/node/68">e-virtual</a> | <a href="https://webmail.usb.ve/" target="_blank">Correo</a> |<a href="http://www.usb.ve/buscador.php" target="_blank"> </a><a href="https://esopo.usb.ve">esopo</a> |<a href="http://www.usb.ve/buscador.php" target="_blank"> </a><a href="http://www.youtube.com/canalusb" target="_blank">canalUSB</a> | <a href="http://www.usb.ve/agenda.php" target="_blank">Agenda Cultural</a> | <a href="http://usbnoticias.info/" target="_blank">USBnoticias</a> |<span> </span><span> </span><a href="http://www.usb.ve/home/node/55">Calendario</a> |<br />
                                                Sede Sartenejas, Baruta, Edo. Miranda - Apartado 89000 - Cable Unibolivar - Caracas Venezuela. Teléfono +58 0212-9063111<br />
                                                Sede Litoral, Camurí Grande, Edo. Vargas Parroquia Naiguatá. Teléfono +58 0212-9069000<br />
                                                Diseñada y desarrollada por la Dirección de Servicios Multimedia <a href="mailto:webmaster@usb.ve">webmaster@usb.ve</a></td>
                                    </tr></table><p> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
