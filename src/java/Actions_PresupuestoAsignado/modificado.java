/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions_PresupuestoAsignado;

import static Actions_Presupuesto.seleccionTiposBusqueda.RetornarTipos;
import Clases.Presupuesto;
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
        Presupuesto u;
        u = (Presupuesto) form;
        HttpSession session = request.getSession(true);
        
        ActionErrors error = new ActionErrors();
        error = u.validate(mapping, request);
        System.out.println("id = " + u.getId());
            Presupuesto pre = DBMS.getInstance().seleccionarDatos_Presupuesto(Integer.parseInt(u.getId()));
            u.resetearVariables();
            if (pre != null) {
                request.setAttribute("datosPres", pre);
                ArrayList<Tipo> Tipos = DBMS.getInstance().listar_Tipos_existentes();
                ArrayList<org.apache.struts.util.LabelValueBean> tipos = RetornarTipos(Tipos);
                session.setAttribute(("tipo"), tipos);
                return mapping.findForward(SUCCESS);
            } else {
                //u.setError("***Codigo no existe o esta deshabilitado***");
                return mapping.findForward(FAILURE);
            }

    }
}
