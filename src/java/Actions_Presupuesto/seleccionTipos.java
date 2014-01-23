/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_Presupuesto;

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
public class seleccionTipos extends org.apache.struts.action.Action {

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
        HttpSession session = request.getSession(true);
        
        ArrayList<Tipo_de_Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Tipo_de_presupuesto();
        session.setAttribute(("presupuesto"), Presupuestos);
            
        
        
        ArrayList<Tipo> Tipos = DBMS.getInstance().listar_Tipos_existentes();
        ArrayList<org.apache.struts.util.LabelValueBean> tipos = RetornarTipos(Tipos);
        session.setAttribute(("tipo"), tipos);
        return mapping.findForward(SUCCESS);
    }
    
    
    public static ArrayList<org.apache.struts.util.LabelValueBean> RetornarTipos(ArrayList<Tipo> pres)  {
        
            ArrayList<org.apache.struts.util.LabelValueBean> codigos = new ArrayList<org.apache.struts.util.LabelValueBean>();
            codigos.add(new org.apache.struts.util.LabelValueBean());
            for (int i = 0;i<pres.size();i++){
                
                 codigos.add(new org.apache.struts.util.LabelValueBean(pres.get(i).getTipo(),pres.get(i).getTipo()));
                
            }
	  
	  
            return codigos;	  
    }
    
}
