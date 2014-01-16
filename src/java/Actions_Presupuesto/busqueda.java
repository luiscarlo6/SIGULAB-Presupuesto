/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_Presupuesto;

import Clases.Tipo_de_Presupuesto;
import Clases.Presupuesto;
import DBMS.DBMS;
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
        Presupuesto u;
        u = (Presupuesto) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();
        String msg_fecha_minima = "", msg_fecha_maxima="", msg_monto = "", msg_tipo = "", msg_fecha= "";
        String valortipo1 = "", valortipo2 = "", valortipo3 = "", valortipo4 = "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        //msg_codigo = u.ValidarCampoCodigo(); 
        //msg_monto = u.ValidarCampoMonto();
        //msg_tipo = u.ValidarCampoTipo();
        valortipo1 = ""+request.getParameter("tipo1");
        valortipo2 = ""+request.getParameter("tipo2");
        valortipo3 = ""+request.getParameter("tipo3");
        valortipo4 = ""+request.getParameter("tipo4");
        msg_fecha_minima = ""+request.getParameter("datepicker1");
        msg_fecha_maxima = ""+request.getParameter("datepicker2");
        /*if (error.size() != 0) {
            huboError = true;
        }
        
        */
        
        System.out.println("fechaaa minima: "+msg_fecha_minima);
        System.out.println("fechaaa maxima: "+msg_fecha_maxima);
        
        System.out.println("valor tipo 1: "+valortipo1+" valor tipo 2: "+valortipo2+" valor tipo 3: "+valortipo3+" valor tipo 4: "+valortipo4);
        
                ArrayList<Tipo_de_Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Tipo_de_presupuesto_Busqueda
                            (valortipo1,valortipo2,valortipo3,valortipo4,msg_fecha_minima,msg_fecha_maxima);
                session.setAttribute(("presupuesto"), Presupuestos);
                ArrayList<org.apache.struts.util.LabelValueBean> codigos = RetornarCodigos(Presupuestos);
                session.setAttribute(("busqueda"), codigos);
                request.setAttribute("consulta_realizada",SUCCESS);
                return mapping.findForward(SUCCESS);
            
        
    }
    
    public static ArrayList<org.apache.struts.util.LabelValueBean> RetornarCodigos(ArrayList<Tipo_de_Presupuesto> pres)  {
        
            ArrayList<org.apache.struts.util.LabelValueBean> codigos = new ArrayList<org.apache.struts.util.LabelValueBean>();
            for (int i = 0;i<pres.size();i++){
                 codigos.add(new org.apache.struts.util.LabelValueBean(pres.get(i).getCodigo(),pres.get(i).getCodigo()));
            }
	  
	  
            return codigos;	  
    }
}
