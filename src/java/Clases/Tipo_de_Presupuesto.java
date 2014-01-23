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
public class Tipo_de_Presupuesto extends org.apache.struts.action.ActionForm {

    /* forward name="success" path="" */
    private String codigo;
    private String tipo;
    private String descripcion;
    private String codigo_nuevo;
    
    private String monto;
    private String monto_restante;
    private String dia;
    private String mes;
    private String ano;
    
    private String fecha;
    private String status;
    
    private String tipobusqueda1;
    private String tipobusqueda2;
    private String tipobusqueda3;
    private String tipobusqueda4;
    
    
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    


    public void resetearVariables() {
        this.codigo = "";
        this.tipo = "";
        this.descripcion = "";
        this.monto="";
        this.dia="";
        this.mes="";
        this.ano="";
        this.fecha="";
        this.tipobusqueda1 = "";
        this.tipobusqueda2 = "";
        this.tipobusqueda3 = "";
        this.tipobusqueda4 = "";
        //this.codigo_nuevo = "";

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

    public String getMonto_restante() {
        return monto_restante;
    }

    public void setMonto_restante(String monto_restante) {
        this.monto_restante = monto_restante;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();   
        return errors;
        
        
        //return mapping.findForward("SUCCESS");
    }
    
    public String ValidarCampoCodigo(){
        Integer codigo ;
        try{
            try{
                codigo = Integer.parseInt(getCodigo());
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
    
    public String VerificarFecha()  {
        String mes = getMes();
        Integer dia = Integer.parseInt(getDia()), ano = Integer.parseInt(getAno());  
        try{
		if ((mes.equals("ENERO")) || (mes.equals("MARZO")) || (mes.equals("MAYO")) || (mes.equals("JULIO")) || (mes.equals("AGOSTO")) || (mes.equals("OCTUBRE")) || (mes.equals("DICIEMBRE"))){
		    if ((dia > 31) || (dia < 1)){                    
                        throw new Exception();
                    }
                    
		}else if (mes.equals("FEBRERO")){
		    if (ano % 4 == 0){
                        if ((dia > 29) || (dia < 1)){
                            throw new Exception();
                        }
                    }else{
                        if ((dia > 28) || (dia < 1)){
                            throw new Exception();
                        }
                    }
		}else{
		    if ((dia > 30) || (dia < 1)){                  
                        throw new Exception();
                    }
		}
                
          }catch (Exception e){
                return "La fecha indicada es errada";
          }
          return "ok";      
    }
    
    @Override
    public String toString() {
        return "presupuesto{" + "codigo=" + codigo + ", tipo=" + tipo + ", descripcion=" + descripcion + '}';
    }
}
