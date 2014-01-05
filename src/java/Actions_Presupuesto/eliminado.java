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

/**
 *
 * @author juanpe
 */
public class eliminado extends org.apache.struts.action.Action {

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
        error = u.validate(mapping, request);
        boolean huboError = false;
        if (error.size() != 0) {
            huboError = true;
        }
        
        if (huboError) {
            saveErrors(request, error);
            u.resetearVariables();
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            boolean elimino = DBMS.getInstance().CambiarStatus_Presupuesto(u);
            u.resetearVariables();
            if (elimino) {
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAILURE);
            }
        }
    }
}
