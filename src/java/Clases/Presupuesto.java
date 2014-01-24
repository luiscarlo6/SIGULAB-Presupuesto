/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

import java.sql.Date;
import java.util.StringTokenizer;
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
    private String id;
    private String codigo_TDP;
    private String codigo_lab;
    private String monto_asignado;  
    private String fecha;    
    private String descripcion;
    private String status;
    private String nombrelab;
    
    private String tipo;
    private String tipobusqueda1;
    private String tipobusqueda2;
    private String tipobusqueda3;
    private String tipobusqueda4;
    

    public void resetearVariables() {
        this.codigo_TDP = "";
        this.codigo_lab = "";
        this.monto_asignado="";
        this.descripcion="";
        this.status ="";
        this.nombrelab = "";
        this.tipobusqueda1 = "";
        this.tipobusqueda2 = "";
        this.tipobusqueda3 = "";
        this.tipobusqueda4 = "";
        this.tipo = "";
    }    

    public String getCodigo_TDP() {
        return codigo_TDP;
    }

    public void setCodigo_TDP(String codigo_TDP) {
        this.codigo_TDP = codigo_TDP;
    }

    public String getCodigo_lab() {
        return codigo_lab;
    }

    public void setCodigo_lab(String codigo_lab) {
        this.codigo_lab = codigo_lab;
    }

    public String getMonto_asignado() {
        return monto_asignado;
    }

    public void setMonto_asignado(String monto_asignado) {
        this.monto_asignado = monto_asignado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }        

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNombrelab() {
        return nombrelab;
    }

    public void setNombrelab(String nombrelab) {
        this.nombrelab = nombrelab;
    }

    public String getTipobusqueda1() {
        return tipobusqueda1;
    }

    public void setTipobusqueda1(String tipobusqueda1) {
        this.tipobusqueda1 = tipobusqueda1;
    }

    public String getTipobusqueda2() {
        return tipobusqueda2;
    }

    public void setTipobusqueda2(String tipobusqueda2) {
        this.tipobusqueda2 = tipobusqueda2;
    }

    public String getTipobusqueda3() {
        return tipobusqueda3;
    }

    public void setTipobusqueda3(String tipobusqueda3) {
        this.tipobusqueda3 = tipobusqueda3;
    }

    public String getTipobusqueda4() {
        return tipobusqueda4;
    }

    public void setTipobusqueda4(String tipobusqueda4) {
        this.tipobusqueda4 = tipobusqueda4;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
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
    
    
    public String ValidarCampoCodigoTDP(){
        Integer codigo ;
        try{
            try{
                codigo = Integer.parseInt(this.getCodigo_TDP());
            }catch (NumberFormatException e){
                return "Codigo errado, indique un Numero";
            }
            if (codigo <= 0){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Codigo errado, indique un Numero mayor a 0";
        }        
        return "ok";
    }
    
    public String ValidarCampoCodigoLab(){
        Integer codigo ;
        try{
            try{
                codigo = Integer.parseInt(getCodigo_lab());
            }catch (NumberFormatException e){
                return "Codigo errado, indique un Numero";
            }
            if (codigo <= 0){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Codigo errado, indique un Numero mayor a 0";
        }        
        return "ok";
    }
    
    
    public String ValidarCampoMonto(){
        Float monto ;
        try{
            try{
                monto = Float.parseFloat(getMonto_asignado());
            }catch (Exception e){
                return "Indique un monto";
            }
            if (monto <= 0.0){
                throw new Exception();
            }
        }catch (Exception e) {
            return "Indique un monto mayor que 0.0";
        }        
        return "ok";
    }
    
    /*
    
    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }*/
}
