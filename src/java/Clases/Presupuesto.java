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
    private String codigo_nuevo;
    
    private String monto;
    private String dia;
    private String mes;
    private String ano;
    
    private String error;
    private String error_tipo;
    private String error_monto;
    private String error_modificando;
    
    
    
    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }
    
    public String getCodigo_nuevo() {
        return codigo_nuevo;
    }

    public void setCodigo_nuevo(String codigo_nuevo) {
        this.codigo_nuevo = codigo_nuevo;
    }

    
    public String getError_monto() {
        return error_monto;
    }
   
    
    public String getError_tipo() {
        return error_tipo;
    }

    public String getError() {
        return error;
    }

    public String getError_modificando() {
        return error_modificando;
    }

    
    public void setError(String error) {
        this.error = error;
    }

    public void setError_tipo(String error_tipo) {
        this.error_tipo = error_tipo;
    }

    public void setError_monto(String error_monto) {
        this.error_monto = error_monto;
    }
    
    
    public void setError_modificando(String error_modificando) {
        this.error_modificando = error_modificando;
    }


    public void resetearVariables() {
        this.codigo = "";
        this.tipo = "";
        this.descripcion = "";
        this.monto="";
        this.dia="";
        this.mes="";
        this.ano="";
        //this.codigo_nuevo = "";
        this.error="";
        this.error_tipo="";
        this.error_monto="";
        this.error_modificando = "";        
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
        Float monto;
        try {
            valor=Integer.parseInt(getCodigo());
            if (valor<=0){
                throw new Exception();
            }
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
    
    public String ValidarCampoCodigo(){
        Integer codigo ;
        try{
            try{
                codigo = Integer.parseInt(getCodigo());
            }catch (NumberFormatException e){
                this.setError("Codigo errado, indique un Numero");
                return "Codigo errado, indique un Numero";
            }
            if (codigo <= 0){
                throw new Exception();
            }
        }catch (Exception e) {
            this.setError("Codigo errado, indique un Numero mayor a 0");
            return "Codigo errado, indique un Numero mayor a 0";
        }        
        return "ok";
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
    
    public String ValidarCampoMonto(){
        Float monto ;
        try{
            try{
                monto = Float.parseFloat(getMonto());
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
    

    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }
}
