/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_PresupuestoAsignado;

import static Actions_Presupuesto.busqueda.StringttoDate;
import Clases.Presupuesto;
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
public class busqueda_presupuesto extends org.apache.struts.action.Action {

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
        String codigo1 = "", codigo2 = "", codigo3 = "", codigo4 = "";
        String codigo5 = "", codigo6 = "", codigo7 = "", codigo8 = "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        //msg_codigo = u.ValidarCampoCodigo(); 
        //msg_monto = u.ValidarCampoMonto();
        //msg_tipo = u.ValidarCampoTipo();
        codigo1 = ""+request.getParameter("ulab");
        codigo2 = ""+request.getParameter("laba");
        codigo3 = ""+request.getParameter("labb");
        codigo4 = ""+request.getParameter("labc");
        codigo5 = ""+request.getParameter("ulad");
        codigo6 = ""+request.getParameter("labe");
        codigo7 = ""+request.getParameter("labf");
        codigo8 = ""+request.getParameter("labg");
        msg_fecha_minima = ""+request.getParameter("datepicker1");
        msg_fecha_maxima = ""+request.getParameter("datepicker2");
        /*if (error.size() != 0) {
            huboError = true;
        }
        
        */
        
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
        
                ArrayList<Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Presupuesto_Busqueda
                            (codigo1,codigo2,codigo3,codigo4,codigo5,codigo6,codigo7,codigo8,msg_fecha_minima,msg_fecha_maxima);
                session.setAttribute(("presupuesto"), Presupuestos);
                ArrayList<org.apache.struts.util.LabelValueBean> codigos = RetornarCodigos(Presupuestos);
                session.setAttribute(("busqueda"), codigos);
                request.setAttribute("consulta_realizada",SUCCESS);
                return mapping.findForward(SUCCESS);
            
        
    }
    
    public static ArrayList<org.apache.struts.util.LabelValueBean> RetornarCodigos(ArrayList<Presupuesto> pres)  {
        
            ArrayList<org.apache.struts.util.LabelValueBean> codigos = new ArrayList<org.apache.struts.util.LabelValueBean>();
            for (int i = 0;i<pres.size();i++){
                //OJO AKI!
                 codigos.add(new org.apache.struts.util.LabelValueBean(pres.get(i).getCodigo_TDP(),pres.get(i).getCodigo_TDP()));
            }
	  
	  
            return codigos;	  
    }
}
