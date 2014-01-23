/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author juanpe
 */
public class Tipo extends org.apache.struts.action.ActionForm {

    /* forward name="success" path="" */
    private String tipo;
    private String tipo_nuevo;
    
    

    public void resetearVariables() {
        this.tipo = "";
        this.tipo_nuevo = "";
    }    

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo_nuevo() {
        return tipo_nuevo;
    }

    public void setTipo_nuevo(String tipo_nuevo) {
        this.tipo_nuevo = tipo_nuevo;
    }

    

    
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

    /**peos para comparar la entrada!!**///
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        Integer valor;
        Float monto;
        try {
            /*valor=Integer.parseInt(getCodigo());
            if (valor<=0){
                throw new Exception();
            }*/
            //System.out.println(""+getMonto());
            /*monto=Float.parseFloat(getMonto());
            if (monto<=0.0){
                throw new Exception();
            }*/
            /*valor = 0;
            if (this.getCodigo_nuevo() != null){
                valor=Integer.parseInt(getCodigo_nuevo());
                if (valor<=0){
                throw new Exception();
                }
            }*/
            
        } catch (Exception e) {
            e.printStackTrace();
            errors.add("codigo", new ActionMessage("error.codigo.errado"));

        }
        
        return errors;
        
        
        //return mapping.findForward("SUCCESS");
    }
    
    public String ValidarCampoTipo(){
        String tipo ;
        
        try{
            tipo = getTipo();
            if (tipo.equals("")){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Debe seleccionar un Tipo";
        }
        return "ok";
    }
    
    public String ValidarCampoTipoNuevo(){
        String tipo ;
        
        try{
            tipo = getTipo_nuevo();
            if (tipo.equals("")){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Debe seleccionar un Tipo";
        }
        return "ok";
    }
    
    /*
    
    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }*/
}
