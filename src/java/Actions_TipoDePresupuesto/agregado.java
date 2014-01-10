/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_TipoDePresupuesto;

import Clases.Tipo_de_Presupuesto;

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
        Tipo_de_Presupuesto u;
        u = (Tipo_de_Presupuesto) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();
        String msg_codigo = "", msg_monto = "", msg_tipo = "", msg_fecha= "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        //msg_codigo = u.ValidarCampoCodigo(); 
        msg_monto = u.ValidarCampoMonto();
        msg_tipo = u.ValidarCampoTipo();
        msg_fecha = u.VerificarFecha();
        /*if (error.size() != 0) {
            huboError = true;
        }
        */
        if (/*(!msg_codigo.equals("ok")) ||*/ (!msg_monto.equals("ok")) || (!msg_tipo.equals("ok")) || (!msg_fecha.equals("ok"))){
            huboError = true;
        }       
            
        if (huboError) {
            
            /*if (!msg_codigo.equals("ok")){
                if (msg_codigo.equals("Codigo errado, indique un Numero")){
                    error.add("codigo", new ActionMessage("error.codigo.numero"));
                }else{
                    error.add("codigo", new ActionMessage("error.codigo.mayorquecero"));
                }
            }*/
            if (!msg_monto.equals("ok")){
                if (msg_monto.equals("Indique un monto")){
                    error.add("monto", new ActionMessage("error.monto.required"));
                }else{
                    error.add("monto", new ActionMessage("error.monto.mayorquecero"));
                }
            }
            if (!msg_tipo.equals("ok")){
                error.add("tipo", new ActionMessage("error.tipo.required"));
            }
            if (!msg_fecha.equals("ok")){
                error.add("fecha", new ActionMessage("error.fecha.errada"));
            }
            u.resetearVariables();
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            boolean agrego = DBMS.getInstance().agregarDatos_Tipo_de_presupuesto(u);
            u.resetearVariables();
            if (agrego) {
                ArrayList<Tipo_de_Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Tipo_de_presupuesto();
                session.setAttribute(("presupuesto"), Presupuestos);
                request.setAttribute("agregado_exitoso",SUCCESS);
                return mapping.findForward(SUCCESS);
            } else {
                //error.add("codigo", new ActionMessage("error.codigo.existe"));
                //saveErrors(request, error);
                //u.setError_tipo();
                return mapping.findForward(FAILURE);
            }
        }
    }
}
