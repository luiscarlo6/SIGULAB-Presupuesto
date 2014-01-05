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
public class Laboratorio extends org.apache.struts.action.ActionForm {

    /* forward name="success" path="" */
    private String nombre;
    private String codigo_lab;   
    private String monto;
    

    public void resetearVariables() {
        this.nombre = "";
        this.codigo_lab = "";
        this.monto = "";
        

    }    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo_lab() {
        return codigo_lab;
    }

    public void setCodigo_lab(String codigo_lab) {
        this.codigo_lab = codigo_lab;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
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
    /*
    
    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }*/
}