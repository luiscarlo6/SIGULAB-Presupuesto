/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_TipoDePresupuesto;

import Clases.Tipo_de_Presupuesto;
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
public class modificar_datos extends org.apache.struts.action.Action {

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
        String msg_fecha = "", msg_monto = "", msg_tipo = "";
        ActionErrors error = new ActionErrors();

        error = u.validate(mapping, request);
        boolean huboError = false;

        /*if (error.size() != 0) {
            huboError = true;
            
        }*/
        msg_fecha = u.VerificarFecha(); 
        msg_monto = u.ValidarCampoMonto();
        msg_tipo = u.ValidarCampoTipo();

        if ((!msg_fecha.equals("ok")) || (!msg_monto.equals("ok")) || (!msg_tipo.equals("ok"))){
            huboError = true;
        }
        
        if (huboError) {
            
            //u.resetearVariables();
            if (!msg_fecha.equals("ok")){
                u.setError(msg_fecha);
            }
            if (!msg_monto.equals("ok")){
                u.setError_monto(msg_monto);
            }
            if (!msg_tipo.equals("ok")){
                u.setError_tipo(msg_tipo);
            }
            error.add("codigo", new ActionMessage("error.codigo.modificando"));
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else 
            
            {
                boolean modifico = DBMS.getInstance().ModificarDatos_Tipo_de_presupuesto(u);
                //u.resetearVariables();
                if (modifico) {
                    //u.resetearVariables();
                    //request.setAttribute("datosPres", pre);
                    return mapping.findForward(SUCCESS);
                } else {
                    error.add("codigo", new ActionMessage("error.codigo.modificando"));
                    saveErrors(request, error);
                    return mapping.findForward(FAILURE);
            }
        }
        
        
    }
}
