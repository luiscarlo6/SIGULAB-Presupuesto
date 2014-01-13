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
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import java.sql.Date;
import java.lang.String;
import java.sql.Timestamp; 
import java.util.StringTokenizer; 

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

            psAgregar = conexion.prepareStatement("INSERT INTO TIPO_DE_PRESUPUESTO VALUES (default,?,?,?,?,?);");
            
           // psAgregar.setInt(1, Integer.parseInt(u.getCodigo()));
            psAgregar.setString(1, u.getTipo());
            psAgregar.setString(2, u.getDescripcion());
            psAgregar.setInt(3, 1);            
            psAgregar.setFloat(4, Float.parseFloat(u.getMonto()));                                    
            System.out.println("Fecha en agregar "+u.getFecha());
            
            
            StringTokenizer st = new StringTokenizer(u.getFecha(),"/");             
            int j = 1;
            int dia= 0 , mes=0, anio=0;
            while(st.hasMoreTokens()) {
            String palabra = st.nextToken();
            if (j == 1){
              dia = Integer.parseInt(palabra);
            }else if (j==2) {
              mes = Integer.parseInt(palabra) - 1;
            }else{
              anio = Integer.parseInt(palabra) - 1900;
            }
            j++;
            System.out.println(palabra); //esto nadamas es para ver como funciona te imprime tu balabra
            } 

            System.out.println("la fecha es " + dia +"/"+ mes +"/"+ anio);
            java.sql.Date  DateSistema=new java.sql.Date(anio,mes,dia);
            System.out.println("El date generado es: "+DateSistema);
            
            
            psAgregar.setDate(5, DateSistema);
            
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
            NumberFormat monto = new DecimalFormat("#############.##");		
            String s = monto.format(Rs.getFloat("monto"));
            pre.setMonto(""+s);
            pre.setFecha(""+Rs.getString("fecha"));
            
            
            return pre;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
  
    }
    
    public boolean ModificarDatos_Tipo_de_presupuesto(Tipo_de_Presupuesto u) {
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET descripcion=?, tipo=?, monto=?, fecha=? where codigo = ?;");

            //psConsultar.setInt(1, Integer.parseInt(u.getCodigo_nuevo()));
            psConsultar.setString(1, u.getDescripcion());
            psConsultar.setString(2, u.getTipo());
            psConsultar.setFloat(3, Float.parseFloat(u.getMonto()));
            psConsultar.setString(4, u.getFecha());
            psConsultar.setInt(5, Integer.parseInt(u.getCodigo()));
            
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
        PreparedStatement psConsultar = null;
        try {

            
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO tdp WHERE tdp.codigo = ? and tdp.status = 1;");
            psConsultar.setInt(1, Integer.parseInt(u.getCodigo()));
            ResultSet Rs = psConsultar.executeQuery();
            
            if(!Rs.next()){
                return false;
            }
            
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
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));
                    u.setMonto(""+s);
                    //u.setMonto(""+Rs.getFloat("monto"));
                    u.setFecha(""+Rs.getString("fecha"));
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }
    

    public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto_ordenTipo() {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY TIPO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+s);
                    u.setFecha(""+Rs.getString("fecha"));
                    
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }

    public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto_ordenTipo_descendente() {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY TIPO DESC;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+s);
                    u.setFecha(""+Rs.getString("fecha"));
                    
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }    
    
        public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto_ordenCodigoDescendente() {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY CODIGO DESC;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+s);
                    u.setFecha(""+Rs.getString("fecha"));
                    
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }

    public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto_ordenMonto() {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY MONTO DESC;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+s);
                    u.setFecha(""+Rs.getString("fecha"));
                    
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }    

        public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto_ordenMontoDescendente() {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY MONTO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+s);
                    u.setFecha(""+Rs.getString("fecha"));
                    
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    } 
    
    public String agregarDatos_Presupuesto(Presupuesto u) {

        PreparedStatement psAgregar = null;
        PreparedStatement psConsultar = null;
        PreparedStatement psUpdate = null;
        Integer codigo_TDP;
        Float monto, monto_tdp, monto_final;
        try {

            codigo_TDP = Integer.parseInt(u.getCodigo_TDP());
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO tdp WHERE tdp.codigo = ? and tdp.status = 1;");
            psConsultar.setInt(1, codigo_TDP);
            ResultSet Rs = psConsultar.executeQuery();
            if (Rs.next()){
                psConsultar = conexion.prepareStatement("SELECT * FROM LABORATORIO lab WHERE lab.codigo_laboratorio = ?;");
                psConsultar.setInt(1, Integer.parseInt(u.getCodigo_lab()));
                ResultSet RsLab = psConsultar.executeQuery();
                if (RsLab.next()){
                    monto_tdp = Rs.getFloat("monto");
                    monto = Float.parseFloat(u.getMonto_asignado());
                //System.out.println("monto_tdp = "+monto_tdp+" monto = "+monto);


                    if (monto_tdp >= monto){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO WHERE codigo_tdp = ? and codigo_laboratorio = ? and status = 1;");
                        psConsultar.setInt(1, codigo_TDP);
                        psConsultar.setInt(2, Integer.parseInt(u.getCodigo_lab()));
                        ResultSet RsPresupuesto = psConsultar.executeQuery();
                        /*if (RsPresupuesto.next()) {
                            // Esperando para  ver si se actualiza el ya 
                            // existente o si se bloquea la accion
                            return "Presupuesto a agregar ya existe";
                        }*/
                        psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (default,?,?,?,?,default,?);");
                        psAgregar.setInt(1, Integer.parseInt(u.getCodigo_TDP()));   
                        psAgregar.setInt(2, Integer.parseInt(u.getCodigo_lab()));
                        psAgregar.setFloat(3, Float.parseFloat(u.getMonto_asignado()));            
                        psAgregar.setInt(4, 1);
                        psAgregar.setString(5, u.getDescripcion());
                        System.out.println(psAgregar.toString());
                        Integer i = psAgregar.executeUpdate();
                        if (i>0){
                            psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto=? where codigo = ?;");
                            monto_final = monto_tdp - monto;
                            psUpdate.setFloat(1, monto_final);            
                            psUpdate.setInt(2, codigo_TDP);
                            i = psUpdate.executeUpdate();
                            return "ok";
                        }
                        return "Presupuesto a agregar ya existe";
                    }else{
                        return "El monto indicado excede el presupuesto";
                    }
                } else {
                    return "Codigo de Laboratorio NO encontrado";
                }
            }else{
                return "Codigo de Tipo de Presupuesto NO encontrado";
            }
            

        } catch (SQLException ex) {
            ex.printStackTrace();
            return "fallo";
        }
    }
    
    
    
    public String agregarDatosEquitativo_Presupuesto(Presupuesto u) {

        PreparedStatement psAgregar = null, psConsultarLabExiste = null;
        PreparedStatement psConsultar = null, psConsultarLab = null;
        PreparedStatement psUpdate = null;
        Integer codigo_TDP, codigo_lab;
        Float monto, monto_tdp, monto_final;
        try {

            codigo_TDP = Integer.parseInt(u.getCodigo_TDP());
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO tdp WHERE tdp.codigo = ? and tdp.status = 1;");
            psConsultar.setInt(1, codigo_TDP);
            ResultSet Rs = psConsultar.executeQuery();
            if (Rs.next()){
                psConsultar = conexion.prepareStatement("select count(p) as conteo\n" +
                                        "from (SELECT distinct tdp.codigo_laboratorio FROM "
                                        + "PRESUPUESTO tdp WHERE tdp.codigo_TDP = ? and tdp.status = 1) p;");
                psConsultar.setInt(1, codigo_TDP);
                ResultSet RsCount = psConsultar.executeQuery();
                RsCount.next();
                
                Integer cuenta = RsCount.getInt("conteo");
                monto_tdp = Rs.getFloat("monto"); 
                if (monto_tdp == 0) {
                    return "El monto del presupuesto a asignar es cero";
                }
                monto = monto_tdp / 8;
                String salida = "ok";
                psConsultarLab = conexion.prepareStatement("SELECT * FROM LABORATORIO;");
                System.out.println(psConsultarLab.toString());
                ResultSet RsLab = psConsultarLab.executeQuery();
                
                Integer i = 1;                
                while (RsLab.next()) {
                        codigo_lab = RsLab.getInt("codigo_laboratorio");                        
                        psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (default,?,?,?,?,default,?);");
                        psAgregar.setInt(1, codigo_TDP);   
                        psAgregar.setInt(2, codigo_lab);
                        psAgregar.setFloat(3, monto);            
                        psAgregar.setInt(4, 1);
                        psAgregar.setString(5, u.getDescripcion());
                        i = psAgregar.executeUpdate();
                        System.out.println(psAgregar.toString());
                }
                  
                
                psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto = 0.0 where codigo = ?;");                                           
                psUpdate.setInt(1, codigo_TDP);
                psUpdate.executeUpdate();
                if (cuenta > 0){
                    salida = "Al menos un valor a insertar ya existia en los Presupuestos";
                }
                return salida;
            }else{
                return "Tipo de Presupuesto NO encontrado";
            }               

        } catch (SQLException ex) {
            ex.printStackTrace();
            return "fallo";
        }
    }
    
    public ArrayList<Presupuesto> consultarDatos_Presupuesto() {

        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_tdp in (select codigo from TIPO_DE_PRESUPUESTO)ORDER BY CODIGO_LABORATORIO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                if (Rs.getInt("status") == 1){                    
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    u.setMonto_asignado(""+Rs.getFloat("monto_asignado"));
                    u.setFecha(""+Rs.getString("fecha"));
                    u.setDescripcion(""+Rs.getString("descripcion"));
                    u.setId(""+Rs.getInt("id"));
                    Presupuestos.add(u);
                }
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }

    
    public ArrayList<Presupuesto> consultarDatosIndividual_Presupuesto(Presupuesto pres) {

        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_laboratorio = ? and status = 1;");
            psConsultar.setInt(1, Integer.parseInt(pres.getCodigo_lab()));
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                if (Rs.getInt("status") == 1){
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    u.setMonto_asignado(""+Rs.getFloat("monto_asignado"));
                    u.setFecha(""+Rs.getString("fecha"));
                    u.setDescripcion(""+Rs.getString("descripcion"));
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

            psEliminar = conexion.prepareStatement("UPDATE PRESUPUESTO SET status=0 where codigo_laboratorio = ? and codigo_TDP=? and id = ?;");
            
            psEliminar.setInt(1, Integer.parseInt(u.getCodigo_lab()));
            psEliminar.setInt(2, Integer.parseInt(u.getCodigo_TDP()));
            psEliminar.setInt(3, Integer.parseInt(u.getId()));
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
                                                    "from laboratorio lab, Presupuesto p, Tipo_de_Presupuesto tdp \n" +
                                                    "where lab.codigo_laboratorio = p.codigo_laboratorio and p.status = 1 and tdp.codigo = p.codigo_tdp and tdp.status = 1\n" +
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
                    u.setDescripcion(""+Rs.getString("descripcion"));
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
