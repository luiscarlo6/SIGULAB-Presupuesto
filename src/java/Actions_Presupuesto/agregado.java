/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_Presupuesto;

import Clases.Presupuesto;
import DBMS.DBMS;
import java.util.ArrayList;
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
public class agregado extends org.apache.struts.action.Action {

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
        String msg_codigo_TDP = "", msg_monto = "", msg_codigo_lab = "", msg_fecha="";
        error = u.validate(mapping, request);
        boolean huboError = false;

        msg_codigo_TDP = u.ValidarCampoCodigoTDP(); 
        msg_monto = u.ValidarCampoMonto();
        msg_codigo_lab = u.ValidarCampoCodigoLab(); 

        msg_fecha = request.getParameter("datepicker");               
        //System.out.println("fechaaa: "+request.getParameter("datepicker"));
        
        if ((msg_fecha.equals("null")) || (msg_fecha.equals(""))){
            error.add("fecha", new ActionMessage("error.fecha.required"));
            huboError = true;
        }
        if ((!msg_codigo_TDP.equals("ok")) || (!msg_monto.equals("ok")) || (!msg_codigo_lab.equals("ok"))){
            huboError = true;
        } 
        
        if (huboError) {
            if (!msg_codigo_TDP.equals("ok")){
                if (msg_codigo_TDP.equals("Codigo errado, indique un Numero")){
                    error.add("codigo", new ActionMessage("error.codigo.numero"));
                }else{
                    error.add("codigo", new ActionMessage("error.codigo.mayorquecero"));
                }
            }
            if (!msg_monto.equals("ok")){
                if (msg_monto.equals("Indique un monto")){
                    error.add("monto", new ActionMessage("error.monto.required"));
                }else{
                    error.add("monto", new ActionMessage("error.monto.mayorquecero"));
                }
            }
            if (!msg_codigo_lab.equals("ok")){
                if (msg_codigo_lab.equals("Codigo errado, indique un Numero")){
                    error.add("codigo_lab", new ActionMessage("error.codigo.numero"));
                }else{
                    error.add("codigo_lab", new ActionMessage("error.codigo.mayorquecero"));
                }
            }            
            u.resetearVariables();
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            u.setFecha(msg_fecha);
            String msg_status = DBMS.getInstance().agregarDatos_Presupuesto(u);
            
            
            u.resetearVariables();
            if (msg_status.equals("Codigo de Tipo de Presupuesto NO encontrado")) {
                error.add("codigo", new ActionMessage("error.codigo.TDPNofound"));
                saveErrors(request, error);
                return mapping.findForward(FAILURE);
            } else if (msg_status.equals("El monto indicado excede el presupuesto")) {
                error.add("monto", new ActionMessage("error.monto.exceder"));
                saveErrors(request, error);
                return mapping.findForward(FAILURE);
            } else if (msg_status.equals("Presupuesto a agregar ya existe")){
                error.add("monto", new ActionMessage("error.codigo_lab.existe"));
                saveErrors(request, error);
                return mapping.findForward(FAILURE);
            } else if (msg_status.equals("Codigo de Laboratorio NO encontrado")) {
                error.add("codigo_lab", new ActionMessage("error.codigo_lab.noexiste"));
                saveErrors(request, error);
                return mapping.findForward(FAILURE);
            } else if (msg_status.equals("ok")){
                ArrayList<Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Presupuesto();
                session.setAttribute(("presupuesto"), Presupuestos);
                request.setAttribute("agregado_exitoso",SUCCESS);
                session.setAttribute(("busqueda"), null);

                return mapping.findForward(SUCCESS);
            }
            
            
            return mapping.findForward(FAILURE);
        }
    }
}
