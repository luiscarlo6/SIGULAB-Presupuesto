/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import java.util.ArrayList;
import Clases.Presupuesto;
import Clases.Cheque;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jidc28
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

    public boolean agregarDatos(Presupuesto u) {

        PreparedStatement psAgregar = null;
        try {

            psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (?,?,?,?);");

            psAgregar.setInt(1, Integer.parseInt(u.getCodigo()));
            psAgregar.setString(2, u.getTipo());
            psAgregar.setString(3, u.getDescripcion());
            psAgregar.setInt(4, 1);
            System.out.println(psAgregar.toString());

            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Presupuesto seleccionarDatos_Presupuesto(int codigo){
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO WHERE codigo = ?;");
            psConsultar.setInt(1, codigo);
            
            System.out.println(psConsultar.toString());
            
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            
            Presupuesto pre = new Presupuesto();
            pre.setCodigo(""+Rs.getInt("codigo"));
            pre.setDescripcion(Rs.getString("descripcion"));
            pre.setTipo(Rs.getString("tipo"));
            
            
            return pre;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
  
    }
    
    public boolean ModificarDatos(Presupuesto u) {
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("UPDATE PRESUPUESTO SET codigo=?, descripcion=?, tipo=? where codigo = ?;");

            psConsultar.setInt(1, Integer.parseInt(u.getCodigo_nuevo()));
            psConsultar.setString(2, u.getDescripcion());
            psConsultar.setString(3, u.getTipo());
            psConsultar.setInt(4, Integer.parseInt(u.getCodigo()));
            
            System.out.println(psConsultar.toString());

            Integer i = psConsultar.executeUpdate();

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean EliminarDatos(Presupuesto u) {

        PreparedStatement psEliminar = null;
        try {

            psEliminar = conexion.prepareStatement("UPDATE PRESUPUESTO SET status=0 where codigo = ?;");

            psEliminar.setInt(1, Integer.parseInt(u.getCodigo()));
            System.out.println(psEliminar.toString());

            Integer i = psEliminar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public ArrayList<Presupuesto> consultarDatos() {

        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO ORDER BY CODIGO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }
    
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
