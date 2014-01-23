/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_Presupuesto;

import static Actions_Presupuesto.seleccionTipos.RetornarTipos;
import Clases.Tipo;
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
       Tipo_de_Presupuesto u;
        u = (Tipo_de_Presupuesto) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();
        String msg_codigo = "";
        error = u.validate(mapping, request);
        boolean huboError = false;
        msg_codigo = u.ValidarCampoCodigo();
        
        if (!msg_codigo.equals("ok")) {
            huboError = true;
        }
        if (huboError) {
            if (msg_codigo.equals("Codigo errado, indique un Numero")){
                error.add("codigo", new ActionMessage("error.codigo.numero"));
            }else{
                error.add("codigo", new ActionMessage("error.codigo.mayorquecero"));
            }
            u.resetearVariables();
            //u.setError(msg_codigo);
            saveErrors(request, error);
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {
            Tipo_de_Presupuesto pre = DBMS.getInstance().seleccionarDatos_Tipo_de_presupuesto(Integer.parseInt(u.getCodigo()));
            u.resetearVariables();
            if (pre != null) {
                
                ArrayList<Tipo> Tipos = DBMS.getInstance().listar_Tipos_existentes();
                ArrayList<org.apache.struts.util.LabelValueBean> tipos = RetornarTipos(Tipos);
                session.setAttribute(("tipo"), tipos);
        
                request.setAttribute("datosPres", pre);
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

