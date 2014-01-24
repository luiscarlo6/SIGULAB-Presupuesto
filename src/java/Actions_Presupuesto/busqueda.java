/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_Presupuesto;

import Clases.Tipo_de_Presupuesto;

import DBMS.DBMS;
import java.sql.Date;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author juanpe
 */
public class busqueda extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Tipo_de_Presupuesto u;
        u = (Tipo_de_Presupuesto) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();
        String msg_fecha_minima = "", msg_fecha_maxima="",msg_tipoTodos="", msg_monto = "", msg_tipo = "", msg_fecha= "";
        String valortipo1 = "", valortipo2 = "", valortipo3 = "", valortipo4 = "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        //msg_codigo = u.ValidarCampoCodigo(); 
        //msg_monto = u.ValidarCampoMonto();
        //msg_tipo = u.ValidarCampoTipo();
        valortipo1 = u.getTipobusqueda1();
        valortipo2 = u.getTipobusqueda2();
        valortipo3 = u.getTipobusqueda3();
        valortipo4 = u.getTipobusqueda4();
        msg_fecha_minima = ""+request.getParameter("datepicker1");
        msg_fecha_maxima = ""+request.getParameter("datepicker2");
        /*if (error.size() != 0) {
            huboError = true;
        }
        
        */
        msg_tipoTodos = ""+request.getParameter("tipo_todos");
        
        System.out.println("tipos: tipobusqueda1 = "+u.getTipobusqueda1()+" tipobusqueda2 = " +u.getTipobusqueda2() +" tipobusqueda3 = "+u.getTipobusqueda3() +" tipobusqueda4 = "+u.getTipobusqueda4());
        
        
        System.out.println("fechaaa minima: "+msg_fecha_minima);
        System.out.println("fechaaa maxima: "+msg_fecha_maxima);
        
        System.out.println("valor tipo 1: "+valortipo1+" valor tipo 2: "+valortipo2+" valor tipo 3: "+valortipo3+" valor tipo 4: "+valortipo4);
        if (msg_tipoTodos.equals("null")){
            if (u.getTipobusqueda1().equals("")){
                valortipo1 = "null";
            }
            if (u.getTipobusqueda3().equals("")){
                valortipo2 = "null";
            }
            if (u.getTipobusqueda3().equals("")){
                valortipo3 = "null";
            }
            if (u.getTipobusqueda4().equals("")){
                valortipo4 = "null";
            }
        }else{
            valortipo1 = "null";
            valortipo2 = "null";
            valortipo3 = "null";
            valortipo4 = "null";
        }
        
        if (!msg_fecha_minima.equals("") && !msg_fecha_maxima.equals("")){
            Date fecha1 = StringttoDate(msg_fecha_minima);
            Date fecha2 = StringttoDate(msg_fecha_maxima);
            if (fecha2.before(fecha1)){
                    request.setAttribute("busqueda_error",SUCCESS);
                    error.add("fecha", new ActionMessage("error.fecha.solapadas"));
                    u.resetearVariables();
                    saveErrors(request, error);
                    return mapping.findForward(FAILURE);
            }
        }
        
                u.resetearVariables();
                ArrayList<Tipo_de_Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Tipo_de_presupuesto_Busqueda
                            (valortipo1,valortipo2,valortipo3,valortipo4,msg_fecha_minima,msg_fecha_maxima);
                session.setAttribute(("presupuesto"), Presupuestos);
                request.setAttribute("consulta_realizada",SUCCESS);
                return mapping.findForward(SUCCESS);
            
        
    }
    
    
    public static Date StringttoDate(String fecha)  {
        
	  StringTokenizer st = new StringTokenizer(fecha,"/"); 
	  //con esto creas el tokenizer y le pasas la cadena como parametro
	  int i = 1;
	  int dia= 0 , mes=0, anio=0;
	  while(st.hasMoreTokens()) { //este ciclo es para comprobar cuando se acaba de procesar tu cadena
	      String palabra = st.nextToken();
	      if (i == 1){
		dia = Integer.parseInt(palabra);
	      }else if (i==2) {
		mes = Integer.parseInt(palabra) - 1;
	      }else{
		anio = Integer.parseInt(palabra) - 1900;
	      }
	      i++;	      
	  } 
	    
	  java.sql.Date DateSistema=new java.sql.Date(anio,mes,dia);
	  return DateSistema;	  
    }
}
