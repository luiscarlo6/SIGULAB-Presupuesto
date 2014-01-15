/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_Presupuesto;

import DBMS.DBMS;
import Clases.Presupuesto;
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
 * @author 
 */
public class consulta_individual extends org.apache.struts.action.Action {
    /* forward name="success" path="" */

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
    private static final String OTHER = "other";
    
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
        
        HttpSession session = request.getSession(true);
        Presupuesto u;
        u = (Presupuesto) form;
        
        ActionErrors error = new ActionErrors();
        String msg_codigo_lab = "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        msg_codigo_lab = u.ValidarCampoCodigoLab(); 
        
        if (!msg_codigo_lab.equals("ok")){
            huboError = true;
        } 
        
        if (huboError) {            
            if (msg_codigo_lab.equals("Codigo errado, indique un Numero")){
                error.add("codigo", new ActionMessage("error.codigo.vacio"));
            }else{
                error.add("codigo", new ActionMessage("error.codigo.mayorquecero"));               
            }     
            u.resetearVariables();
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            
        } else {
            ArrayList<Presupuesto> Presupuestos = DBMS.getInstance().consultarDatosIndividual_Presupuesto(u);
            u.resetearVariables();

                session.setAttribute(("presupuesto"), Presupuestos);
                request.setAttribute("consulta_realizada",SUCCESS);
                return mapping.findForward(SUCCESS);
 
         
            
            
        }
    }                        
        
}
