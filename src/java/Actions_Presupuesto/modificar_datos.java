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
        
        Presupuesto u;
        u = (Presupuesto) form;
        HttpSession session = request.getSession(true);
        String msg_codigo_TDP = "", msg_monto = "", msg_codigo_lab = "", msg_fecha="";
        ActionErrors error = new ActionErrors();

        error = u.validate(mapping, request);
        boolean huboError = false;

        /*if (error.size() != 0) {
            huboError = true;
            
        }*/
        //msg_fecha = u.VerificarFecha(); 
        msg_codigo_TDP = u.ValidarCampoCodigoTDP(); 
        msg_monto = u.ValidarCampoMonto();
        msg_codigo_lab = u.ValidarCampoCodigoLab(); 
        msg_fecha = request.getParameter("datepicker");
        System.out.println("la fecha es en modificar_datos = "+msg_fecha);
        if ((msg_fecha.equals("null")) || (msg_fecha.equals(""))){
            error.add("fecha", new ActionMessage("error.fecha.required"));
            huboError = true;
        }
            
        if (!msg_codigo_TDP.equals("ok")){
            if (msg_codigo_TDP.equals("Codigo errado, indique un Numero")){
                    error.add("codigo", new ActionMessage("error.codigo.numero"));
            }else{
                error.add("codigo", new ActionMessage("error.codigo.mayorquecero"));
            }
            huboError = true;
        }
        if (!msg_monto.equals("ok")){
            if (msg_monto.equals("Indique un monto")){
                    error.add("monto", new ActionMessage("error.monto.required"));
            }else{
                    error.add("monto", new ActionMessage("error.monto.mayorquecero"));
            }
            huboError = true;
        }
        if (!msg_codigo_lab.equals("ok")){
            error.add("codigo_lab", new ActionMessage("error.codigo_lab.noexiste"));              
            huboError = true;
        }
        System.out.println("ID = "+u.getId());
        if (huboError) {
            Presupuesto pre = DBMS.getInstance().seleccionarDatos_Presupuesto(Integer.parseInt(u.getId()));            
            u.resetearVariables();
            request.setAttribute("datosPres", pre);            
            request.setAttribute("modificacion_fallida",SUCCESS);
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else 
            
            {
                u.setFecha(msg_fecha);
                boolean modifico = DBMS.getInstance().ModificarDatos_Presupuesto(u);
                //u.resetearVariables();
                if (modifico) {
                    u.resetearVariables();
                    ArrayList<Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Presupuesto();
                    session.setAttribute(("presupuesto"), Presupuestos);
                    request.setAttribute("modificacion_exitosa",SUCCESS);
                    return mapping.findForward(SUCCESS);
                } else {
                    //u.resetearVariables();
                    //Presupuesto pre = DBMS.getInstance().seleccionarDatos_Tipo_de_presupuesto(Integer.parseInt(u.getCodigo_TDP()));
                    //request.setAttribute("datosPres", pre);
                    u.resetearVariables();
                    error.add("codigo", new ActionMessage("error.codigo.modificando"));
                    saveErrors(request, error);
                    request.setAttribute("modificacion_fallida",SUCCESS);
                    return mapping.findForward(FAILURE);
            }
        }
        
        
    }
}
