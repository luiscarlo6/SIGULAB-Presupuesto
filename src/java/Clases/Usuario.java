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
       

    public void resetearVariables() {
        this.usbid = "";
        this.contrasena = "";
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
        
        if (getUsbid() == null || getUsbid().length() < 1) {
            errors.add("usbid", new ActionMessage("error.usbid.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        
        if (getContrasena() == null || getContrasena().length() < 1) {
            errors.add("contrasena", new ActionMessage("error.contrasena.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }
            
    /*
    
    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }*/
}