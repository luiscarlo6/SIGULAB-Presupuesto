/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions_PresupuestoAsignado;

import static Actions_Presupuesto.busqueda.StringttoDate;
import static Actions_Presupuesto.seleccionTiposBusqueda.RetornarTipos;
import Clases.Tipo_de_Presupuesto;
import Clases.Presupuesto;
import Clases.Tipo;
import DBMS.DBMS;
import java.sql.Date;
import java.util.ArrayList;
import java.util.StringTokenizer;

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
public class busqueda_modificacion extends org.apache.struts.action.Action {

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
        String msg_fecha_minima = "", msg_fecha_maxima="",msg_tipoTodos="", msg_monto = "", msg_tipo = "", msg_fecha= "";
        String valortipo1 = "", valortipo2 = "", valortipo3 = "", valortipo4 = "";
        error = u.validate(mapping, request);
        boolean huboError = false;

        //msg_codigo = u.ValidarCampoCodigo(); 
        //msg_monto = u.ValidarCampoMonto();
        //msg_tipo = u.ValidarCampoTipo();
        valortipo1 = u.getTipobusqueda1();
        valortipo2 = u.getTipobusqueda2();
        valortipo3 = u.getTipobusqueda3();
        valortipo4 = u.getTipobusqueda4();
        msg_fecha_minima = ""+request.getParameter("datepicker1");
        msg_fecha_maxima = ""+request.getParameter("datepicker2");
        /*if (error.size() != 0) {
            huboError = true;
        }
        
        */
        
        msg_tipoTodos = ""+request.getParameter("tipo_todos");
        
        System.out.println("fechaaa minima: "+msg_fecha_minima);
        System.out.println("fechaaa maxima: "+msg_fecha_maxima);
        
        System.out.println("valor tipo 1: "+valortipo1+" valor tipo 2: "+valortipo2+" valor tipo 3: "+valortipo3+" valor tipo 4: "+valortipo4);
        if (msg_tipoTodos.equals("null")){
            if (u.getTipobusqueda1().equals("")){
                valortipo1 = "null";
            }
            if (u.getTipobusqueda3().equals("")){
                valortipo2 = "null";
            }
            if (u.getTipobusqueda3().equals("")){
                valortipo3 = "null";
            }
            if (u.getTipobusqueda4().equals("")){
                valortipo4 = "null";
            }
        }else{
            valortipo1 = "null";
            valortipo2 = "null";
            valortipo3 = "null";
            valortipo4 = "null";
        }
        if (!msg_fecha_minima.equals("") && !msg_fecha_maxima.equals("")){
            Date fecha1 = StringttoDate(msg_fecha_minima);
            Date fecha2 = StringttoDate(msg_fecha_maxima);
            if (fecha2.before(fecha1)){
                    request.setAttribute("busqueda_error",SUCCESS);
                    error.add("fecha", new ActionMessage("error.fecha.solapadasbusqueda"));
                    Presupuesto pre = DBMS.getInstance().seleccionarDatos_Presupuesto(Integer.parseInt(u.getId()));
                    request.setAttribute("datosPres", pre);
                    ArrayList<Tipo> Tipos = DBMS.getInstance().listar_Tipos_existentes();
                    ArrayList<org.apache.struts.util.LabelValueBean> tipos = RetornarTipos(Tipos);
                    session.setAttribute(("tipo"), tipos);
                    u.resetearVariables();
                    saveErrors(request, error);
                    return mapping.findForward(FAILURE);
            }
        }        
                ArrayList<Tipo_de_Presupuesto> Presupuestos = DBMS.getInstance().consultarDatos_Tipo_de_presupuesto_Busqueda
                            (valortipo1,valortipo2,valortipo3,valortipo4,msg_fecha_minima,msg_fecha_maxima);
                session.setAttribute(("presupuesto"), Presupuestos);
                ArrayList<org.apache.struts.util.LabelValueBean> codigos = RetornarCodigos(Presupuestos);
                session.setAttribute(("busqueda"), codigos);
                request.setAttribute("consulta_realizada",SUCCESS);
                System.out.println("ID: "+u.getId());
                //
                Presupuesto pre = DBMS.getInstance().seleccionarDatos_Presupuesto(Integer.parseInt(u.getId()));
                request.setAttribute("datosPres", pre);
                ArrayList<Tipo> Tipos = DBMS.getInstance().listar_Tipos_existentes();
                ArrayList<org.apache.struts.util.LabelValueBean> tipos = RetornarTipos(Tipos);
                session.setAttribute(("tipo"), tipos);
                u.resetearVariables();
                return mapping.findForward(SUCCESS);
            
        
    }
    
    public static ArrayList<org.apache.struts.util.LabelValueBean> RetornarCodigos(ArrayList<Tipo_de_Presupuesto> pres)  {
        
            ArrayList<org.apache.struts.util.LabelValueBean> codigos = new ArrayList<org.apache.struts.util.LabelValueBean>();
            for (int i = 0;i<pres.size();i++){
                if (pres.get(i).getStatus().equals("Habilitado")) {
                 codigos.add(new org.apache.struts.util.LabelValueBean(pres.get(i).getCodigo(),pres.get(i).getCodigo()));
                }
            }
	  
	  
            return codigos;	  
    }
}
