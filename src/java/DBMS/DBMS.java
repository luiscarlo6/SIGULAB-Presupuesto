/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import java.util.ArrayList;
import Clases.Tipo_de_Presupuesto;
import Clases.Cheque;
import Clases.Laboratorio;
import Clases.Presupuesto;
import Clases.Usuario;        
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */
public class DBMS {

    private static Connection conexion;

    protected DBMS() {
    }
    private static DBMS instance = null;

    public static DBMS getInstance() {
        if (null == DBMS.instance) {
            DBMS.instance = new DBMS();
        }
        conectar();
        return DBMS.instance;
    }

    public static boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver");
//            La forma de esto debe ser la siguiente:
//                     conexion = DriverManager.getConnection(
//                    "jdbc:postgresql://localhost:5432/<database>",
//                    "<nombre de usuario psql>",
//                    "<clave de usuario psql>");
            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/sigulab",
                    "postgres",
                    "postgres");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    
    public boolean seleccionarDatos_Usuario(Usuario u){
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("SELECT * FROM USUARIO WHERE usbid = ? and contrasena = ?;");            
            psConsultar.setString(1, u.getUsbid());
            psConsultar.setString(2, u.getContrasena());
            
            System.out.println(psConsultar.toString());
            
            ResultSet Rs = psConsultar.executeQuery();
            
            if (Rs.next()){
                return true;
            }
            
            
            return false;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        
  
    }
    
    
    // TIPO DE PRESUPUESTO
    public boolean agregarDatos_Tipo_de_presupuesto(Tipo_de_Presupuesto u) {

        PreparedStatement psAgregar = null;
        try {

            psAgregar = conexion.prepareStatement("INSERT INTO TIPO_DE_PRESUPUESTO VALUES (?,?,?,?,?,?,?,?);");
            
            psAgregar.setInt(1, Integer.parseInt(u.getCodigo()));
            psAgregar.setString(2, u.getTipo());
            psAgregar.setString(3, u.getDescripcion());
            psAgregar.setInt(4, 1);            
            psAgregar.setFloat(5, Float.parseFloat(u.getMonto()));
            psAgregar.setInt(6, Integer.parseInt(u.getDia()));
            psAgregar.setString(7, u.getMes());
            psAgregar.setInt(8, Integer.parseInt(u.getAno()));
            
            
            System.out.println(psAgregar.toString());

            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Tipo_de_Presupuesto seleccionarDatos_Tipo_de_presupuesto(int codigo){
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE codigo = ? and status = 1;");
            psConsultar.setInt(1, codigo);
            
            System.out.println(psConsultar.toString());
            
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            
            Tipo_de_Presupuesto pre = new Tipo_de_Presupuesto();
            pre.setCodigo(""+Rs.getInt("codigo"));
            pre.setDescripcion(Rs.getString("descripcion"));
            pre.setTipo(Rs.getString("tipo"));
            
            pre.setMonto(""+Rs.getFloat("monto"));
            pre.setDia(""+Rs.getInt("dia"));
            pre.setMes(Rs.getString("mes"));
            pre.setAno(""+Rs.getInt("ano"));
            
            
            return pre;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
  
    }
    
    public boolean ModificarDatos_Tipo_de_presupuesto(Tipo_de_Presupuesto u) {
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET descripcion=?, tipo=?, monto=?, dia=?, mes=?, ano=? where codigo = ?;");

            //psConsultar.setInt(1, Integer.parseInt(u.getCodigo_nuevo()));
            psConsultar.setString(1, u.getDescripcion());
            psConsultar.setString(2, u.getTipo());
            psConsultar.setFloat(3, Float.parseFloat(u.getMonto()));
            psConsultar.setInt(4, Integer.parseInt(u.getDia()));
            psConsultar.setString(5, u.getMes());
            psConsultar.setInt(6, Integer.parseInt(u.getAno()));
            psConsultar.setInt(7, Integer.parseInt(u.getCodigo()));
            
            System.out.println(psConsultar.toString());

            Integer i = psConsultar.executeUpdate();

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean CambiarStatus_Tipo_de_presupuesto(Tipo_de_Presupuesto u) {

        PreparedStatement psEliminar = null;
        try {

            psEliminar = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET status=0 where codigo = ?;");

            psEliminar.setInt(1, Integer.parseInt(u.getCodigo()));
            System.out.println(psEliminar.toString());

            Integer i = psEliminar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto() {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY CODIGO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    u.setMonto(""+Rs.getFloat("monto"));
                    u.setDia(""+Rs.getInt("dia"));
                    u.setMes(Rs.getString("mes"));
                    u.setAno(""+Rs.getInt("ano"));
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }
    
    // PRESUPUESTO 
    
    public boolean agregarDatos_Presupuesto(Presupuesto u) {

        PreparedStatement psAgregar = null;
        PreparedStatement psConsultar = null;
        PreparedStatement psUpdate = null;
        Integer codigo_TDP;
        Float monto, monto_tdp, monto_final;
        try {

            codigo_TDP = Integer.parseInt(u.getCodigo_TDP());
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO tdp WHERE tdp.codigo = ?;");
            psConsultar.setInt(1, codigo_TDP);
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            monto_tdp = Rs.getFloat("monto");
            monto = Float.parseFloat(u.getMonto_asignado());
            System.out.println("monto_tdp = "+monto_tdp+" monto = "+monto);
            
            
            if (monto_tdp >= monto){
                psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (?,?,?,?);");
                psAgregar.setInt(1, Integer.parseInt(u.getCodigo_TDP()));   
                psAgregar.setInt(2, Integer.parseInt(u.getCodigo_lab()));
                psAgregar.setFloat(3, Float.parseFloat(u.getMonto_asignado()));            
                psAgregar.setInt(4, 1);
                System.out.println(psAgregar.toString());
                Integer i = psAgregar.executeUpdate();
                if (i>0){
                    psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto=? where codigo = ?;");
                    monto_final = monto_tdp - monto;
                    psUpdate.setFloat(1, monto_final);            
                    psUpdate.setInt(2, codigo_TDP);
                    i = psUpdate.executeUpdate();
                    return i > 0;
                }
                return (i>0);
            }else{
                return false;
            }
            
            

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    
    
    public boolean agregarDatosEquitativo_Presupuesto(Presupuesto u) {

        PreparedStatement psAgregar = null;
        PreparedStatement psConsultar = null, psConsultarLab = null;
        PreparedStatement psUpdate = null;
        Integer codigo_TDP, codigo_lab;
        Float monto, monto_tdp, monto_final;
        try {

            codigo_TDP = Integer.parseInt(u.getCodigo_TDP());
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO tdp WHERE tdp.codigo = ?;");
            psConsultar.setInt(1, codigo_TDP);
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            monto_tdp = Rs.getFloat("monto");
            monto = monto_tdp / 8;
            
            psConsultarLab = conexion.prepareStatement("SELECT * FROM LABORATORIO ORDER BY CODIGO_LABORATORIO;");
            ResultSet RsLab = psConsultarLab.executeQuery();
            Integer i = 1;
            while (RsLab.next()) {
                    codigo_lab = RsLab.getInt("codigo_laboratorio");
                    psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (?,?,?,?);");
                    psAgregar.setInt(1, codigo_TDP);   
                    psAgregar.setInt(2, codigo_lab);
                    psAgregar.setFloat(3, monto);            
                    psAgregar.setInt(4, 1);
                    i = psAgregar.executeUpdate();
            }
            psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto = 0.0 where codigo = ?;");           
            psUpdate.setInt(1, codigo_TDP);
            psUpdate.executeUpdate();
            return i > 0;
                        

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<Presupuesto> consultarDatos_Presupuesto() {

        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO ORDER BY CODIGO_LABORATORIO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                if (Rs.getInt("status") == 1){
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    u.setMonto_asignado(""+Rs.getFloat("monto_asignado"));
                    u.setFecha(""+Rs.getString("fecha"));
                    Presupuestos.add(u);
                }
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }
    
    
    public boolean CambiarStatus_Presupuesto(Presupuesto u) {

        PreparedStatement psEliminar = null;
        try {

            psEliminar = conexion.prepareStatement("UPDATE PRESUPUESTO SET status=0 where codigo_laboratorio = ? and codigo_TDP=?;");

            psEliminar.setInt(1, Integer.parseInt(u.getCodigo_lab()));
            psEliminar.setInt(2, Integer.parseInt(u.getCodigo_TDP()));
            System.out.println(psEliminar.toString());

            Integer i = psEliminar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<Laboratorio> consultarDatosTotales_Presupuesto() {

        ArrayList<Laboratorio> Laboratorios = new ArrayList<Laboratorio>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("select distinct lab.codigo_laboratorio as codigo_lab, lab.nombre as nombre, SUM(p.monto_asignado) as monto\n" +
                                                    "from laboratorio lab, Presupuesto p \n" +
                                                    "where lab.codigo_laboratorio = p.codigo_laboratorio and p.status = 1 \n" +
                                                    "group by lab.codigo_laboratorio \n" +
                                                    "order by lab.codigo_laboratorio;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Laboratorio u = new Laboratorio();
                
                    u.setCodigo_lab(""+Rs.getInt("codigo_lab"));
                    u.setNombre(""+Rs.getString("nombre"));
                    u.setMonto(""+Rs.getFloat("monto"));                    
                    Laboratorios.add(u);
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Laboratorios;

    }
    
    // LISTADO DE LABORATORIOS
    public ArrayList<Laboratorio> consultarDatos_Laboratorio() {

        ArrayList<Laboratorio> Laboratorios = new ArrayList<Laboratorio>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM LABORATORIO ORDER BY CODIGO_LABORATORIO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Laboratorio u = new Laboratorio();                                
                    u.setNombre(""+Rs.getString("nombre"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    Laboratorios.add(u);
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Laboratorios;

    }
    
    
    
    // CHEQUE
    
    public boolean agregarDatos_Cheque(Cheque u) {

        PreparedStatement psAgregar = null;
        try {

            psAgregar = conexion.prepareStatement("INSERT INTO CHEQUE VALUES (?,?,?,?);");

            psAgregar.setInt(1, u.getCodigo());
            psAgregar.setDouble(2, u.getMonto());
            psAgregar.setString(3, u.getFecha());
            psAgregar.setString(4, u.getStatus());
            System.out.println(psAgregar.toString());

            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
     
      public ArrayList<Cheque> consultarDatos_Cheque() {

        ArrayList<Cheque> Cheques = new ArrayList<Cheque>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM CHEQUE;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Cheque u = new Cheque();
                
                u.setCodigo(Rs.getInt("codigo"));
                u.setStatus(Rs.getString("status"));
                u.setFecha(Rs.getString("fecha"));
                u.setMonto(Rs.getDouble("monto"));
                
                Cheques.add(u);
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Cheques;

    }
      
      
    public boolean Modificar_Cheque(Cheque u) {
        PreparedStatement psModificar = null;
        try {
            /**
             * TOY CAGANDOLA AKI ME FUI PA CLASES MOSK QUE ESTOY ES AKII
             * AKIIIIIIIIIIIII
             */

            psModificar = conexion.prepareStatement("UPDATE CHEQUE SET status=? where codigo = ?;");

            psModificar.setString(1, u.getStatus());
            psModificar.setInt(2, u.getCodigo());
            System.out.println(psModificar.toString());

            Integer i = psModificar.executeUpdate();

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }  
}
