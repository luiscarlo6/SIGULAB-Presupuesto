/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_Usuario;

import Clases.Usuario;
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
public class chequear extends org.apache.struts.action.Action {

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
        Usuario u;
        u = (Usuario) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();
        String msg_usbid = "", msg_contrasena = "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        msg_contrasena = u.ValidarCampoContrasena(); 
        msg_usbid = u.ValidarCampoUsbid();
        
        /*if (error.size() != 0) {
            huboError = true;
        }
        */
        if ((!msg_usbid.equals("ok")) || (!msg_contrasena.equals("ok"))){
            huboError = true;
        }
            
        if (huboError) {
            saveErrors(request, error);
            u.resetearVariables();
            if (!msg_usbid.equals("ok")){
                u.setError_usbid(msg_usbid);
            }
            if (!msg_contrasena.equals("ok")){
                u.setError_contrasena(msg_contrasena);
            }
            
            
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            boolean chequeo = DBMS.getInstance().seleccionarDatos_Usuario(u);
            u.resetearVariables();
            if (chequeo) {
                return mapping.findForward(SUCCESS);
            } else {
                u.setError_general("Combinacion de usbid y contrasena invalidos");
                //u.setError_tipo();
                return mapping.findForward(FAILURE);
            }
        }
    }
}
