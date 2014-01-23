/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_Tipo;

import Clases.Tipo;
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
public class modificado extends org.apache.struts.action.Action {

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
        if (!msg_tipo.equals("ok")) {
            huboError = true;
        }
        
        
        if (huboError) {
            u.resetearVariables();            
            if (!msg_tipo.equals("ok")){
                error.add("tipo", new ActionMessage("error.tipo.indicar"));
            }
            saveErrors(request, error);            
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            Tipo tip = DBMS.getInstance().seleccionarDatos_Tipo(u.getTipo());
            u.resetearVariables();
            if (tip != null) {
                request.setAttribute("datosPres", tip);
                return mapping.findForward(SUCCESS);
            } else {
                error.add("codigo", new ActionMessage("error.codigo.noexiste_deshabilitado"));
                saveErrors(request, error);
                //u.setError("***Codigo no existe o esta deshabilitado***");
                return mapping.findForward(FAILURE);
            }
        }
    }
}

