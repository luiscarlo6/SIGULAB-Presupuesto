/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_Presupuesto;

import Clases.Presupuesto;
import DBMS.DBMS;
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
public class asignado_equitativo extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    
    private static final String OTHER = "other";
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
        error = u.validate(mapping, request);
        boolean huboError = false;
        String msg_codigo_TDP = "";
                
        msg_codigo_TDP = u.ValidarCampoCodigoTDP(); 

        if (!msg_codigo_TDP.equals("ok")){
            huboError = true;
        }
  
        if (huboError) {
            u.resetearVariables();
            if (msg_codigo_TDP.equals("Codigo errado, indique un Numero")){
                error.add("codigo", new ActionMessage("error.codigo.numero"));
            }else{
                error.add("codigo", new ActionMessage("error.codigo.mayorquecero"));
            }
            saveErrors(request, error);            
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            String msg_status = DBMS.getInstance().agregarDatosEquitativo_Presupuesto(u);
            u.resetearVariables();
            if (msg_status.equals("ok")) {
                return mapping.findForward(SUCCESS);
            } else if (msg_status.equals("Tipo de Presupuesto NO encontrado")) {
                error.add("codigo", new ActionMessage("error.codigo.TDPNofound"));
                saveErrors(request, error);            
                return mapping.findForward(FAILURE);
            }else if (msg_status.equals("El monto del presupuesto a asignar es cero")) {
                error.add("check", new ActionMessage("error.check.NadaQueAgregar"));
                saveErrors(request, error);            
                return mapping.findForward(OTHER);
            } else if (msg_status.equals("Al menos un valor a insertar ya existia en los Presupuestos")) {
                error.add("check", new ActionMessage("error.check.alert"));
                //saveErrors(request, error);            
                return mapping.findForward(SUCCESS);
            } 
            return mapping.findForward(FAILURE);
        }
    }
}
