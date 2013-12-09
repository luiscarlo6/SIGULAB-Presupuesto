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
public class Presupuesto extends org.apache.struts.action.ActionForm {

    /* forward name="success" path="" */
    private String codigo;
    private String tipo;
    private String descripcion;
    private String error;
    private String error_tipo;
    private String codigo_nuevo;

    
    
    public String getError_tipo() {
        return error_tipo;
    }

    public void setError_tipo() {
        this.error_tipo = "Seleccione un Tipo";
    }

    
    
    public String getCodigo_nuevo() {
        return codigo_nuevo;
    }

    public void setCodigo_nuevo(String codigo_nuevo) {
        this.codigo_nuevo = codigo_nuevo;
    }

  

    public String getError() {
        return error;
    }
    
        
    public void setError() {
        this.error = "Codigo errado o ya existe, intente de nuevo";
    }

    public void setError1() {
        this.error = "Codigo errado o no existe, intente de nuevo";
    }

    public void resetearVariables() {
        this.codigo = "";
        this.tipo = "";
        this.descripcion = "";
        //this.codigo_nuevo = "";
        this.error="";
        this.error_tipo="";
                
    }
    
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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
        try {
            valor=Integer.parseInt(getCodigo());
            if (valor<=0){
                throw new Exception();
            }
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
    
    
    public ActionErrors validate_codigo_nuevo(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        Integer valor;
        try {
            valor=Integer.parseInt(""+getCodigo_nuevo());
            if (valor<=0){
                throw new Exception();
            }
            System.out.println("codigo nuevo ="+getCodigo_nuevo());
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Estoy entro de error codigo nuevo ="+getCodigo_nuevo());
            errors.add("codigo_nuevo", new ActionMessage("error.codigo_nuevo.errado"));

        }
        
        return errors;
        
        
        //return mapping.findForward("SUCCESS");
    }
    
    

    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }
}
