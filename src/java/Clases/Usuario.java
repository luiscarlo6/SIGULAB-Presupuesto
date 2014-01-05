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
public class Usuario extends org.apache.struts.action.ActionForm {

    /* forward name="success" path="" */
    private String usbid;
    private String contrasena;   
    
    private String error_usbid;
    private String error_contrasena;
    private String error_general;
    
    

    public void resetearVariables() {
        this.usbid = "";
        this.contrasena = "";
        this.error_contrasena="";
        this.error_usbid="";
        this.error_general="";
    }    

    public String getUsbid() {
        return usbid;
    }

    public void setUsbid(String usbid) {
        this.usbid = usbid;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getError_usbid() {
        return error_usbid;
    }

    public void setError_usbid(String error_usbid) {
        this.error_usbid = error_usbid;
    }

    public String getError_contrasena() {
        return error_contrasena;
    }

    public void setError_contrasena(String error_contrasena) {
        this.error_contrasena = error_contrasena;
    }

    public String getError_general() {
        return error_general;
    }

    public void setError_general(String error_general) {
        this.error_general = error_general;
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
    
    
    public String ValidarCampoUsbid(){        
        try{            
            if (this.usbid.equals("")){
                throw new Exception();
            }
        }catch (Exception e) {
            return "USBID esta vacio, ingrese su USBID";
        }        
        return "ok";
    }
    
    public String ValidarCampoContrasena(){
        Integer codigo;
        try{            
            if (this.contrasena.equals("")){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Contrasena vacia, ingrese contrasena";
        }
        
        try{            
            if (this.contrasena.length() < 6){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Longitud de contrasena debe ser mayor a 5";
        }
        
        return "ok";
    }
    
    /*
    
    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }*/
}