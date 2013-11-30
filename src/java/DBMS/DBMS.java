/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import Clases.Presupuesto;
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
                    "jdbc:postgresql://localhost:5432/prueba",
                    "postgres",
                    "5480254");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean agregarDatos(Presupuesto u) {

        PreparedStatement psAgregar = null;
        try {

            psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (?,?,?);");
            
            psAgregar.setInt(1, u.getCodigo());
            psAgregar.setString(2, u.getTipo());
            psAgregar.setString(3, u.getDescripcion());
            System.out.println(psAgregar.toString());

            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public boolean ModificarDatos(Presupuesto u){
        PreparedStatement psConsultar = null;
        try {
/**
 TOY CAGANDOLA AKI
 * ME FUI PA CLASES
 * MOSK QUE ESTOY ES AKII
 * AKIIIIIIIIIIIII
 */

            psConsultar = conexion.prepareStatement("UPDATE PRESUPUESTO SET codigo=?, descripcion=?, tipo=? where codigo = ?;");
            
            psConsultar.setInt(1, u.getCodigo());
            psConsultar.setString(2, u.getTipo());
            psConsultar.setString(3, u.getDescripcion());
            
            psConsultar.setInt(4, u.getCodigo());
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

            psEliminar = conexion.prepareStatement("DELETE FROM PRESUPUESTO WHERE codigo = ?;");
            
            psEliminar.setInt(1, u.getCodigo());
            System.out.println(psEliminar.toString());

            Integer i = psEliminar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    
    public boolean consultarDatos(Presupuesto u) {

        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO WHERE codigo = ?");
            
            psConsultar.setInt(1, u.getCodigo());
            System.out.println(psConsultar.toString());

            ResultSet Rs = psConsultar.executeQuery();
            
            while (Rs.next()) {
                if((Rs.getString("nombre")).equals("SFAFA"))
                return true;
            }
            
            return false;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
