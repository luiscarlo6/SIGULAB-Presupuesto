/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_Tipo;

import Clases.Tipo_de_Presupuesto;

import Clases.Tipo;
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
public class newTipo extends org.apache.struts.action.Action {

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
        
        Tipo u;
        u = (Tipo) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();
        String msg_tipo = "";
        error = u.validate(mapping, request);
        boolean huboError = false;
        
        msg_tipo = u.ValidarCampoTipo();        
                      
        
        
        if (!msg_tipo.equals("ok")){
            huboError = true;
        }       
            
        if (huboError) {                        
            if (!msg_tipo.equals("ok")){
                error.add("tipo", new ActionMessage("error.tipo.indicar"));
            }
            
            u.resetearVariables();
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            boolean agrego = DBMS.getInstance().agregar_NuevoTipo(u);
            u.resetearVariables();
            if (agrego) {
                ArrayList<Tipo> Tipos = DBMS.getInstance().listar_Tipos_existentes();
                session.setAttribute(("tipo"), Tipos);
                request.setAttribute("agregado_Tipo",SUCCESS);
                return mapping.findForward(SUCCESS);
            } else {
                error.add("tipo", new ActionMessage("error.tipo.existe"));
                saveErrors(request, error);                
                return mapping.findForward(FAILURE);
            }
        }
    }
}
