/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import java.util.Calendar;
import java.util.ArrayList;
import Clases.Tipo_de_Presupuesto;
import Clases.Tipo;
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

    public static Date StringttoDate(String fecha)  {
        
	  StringTokenizer st = new StringTokenizer(fecha,"/"); 
	  //con esto creas el tokenizer y le pasas la cadena como parametro
	  int i = 1;
	  int dia= 0 , mes=0, anio=0;
	  while(st.hasMoreTokens()) { //este ciclo es para comprobar cuando se acaba de procesar tu cadena
	      String palabra = st.nextToken();
	      if (i == 1){
		dia = Integer.parseInt(palabra);
	      }else if (i==2) {
		mes = Integer.parseInt(palabra) - 1;
	      }else{
		anio = Integer.parseInt(palabra) - 1900;
	      }
	      i++;	      
	  } 
	    
	  java.sql.Date DateSistema=new java.sql.Date(anio,mes,dia);
	  return DateSistema;	  
    }
    // Retorna la fecha pero en formato DD-MM-YY
    public static String FormatoFechaDMA(String fecha)  {
        
	  StringTokenizer st = new StringTokenizer(fecha,"-"); 
	  //con esto creas el tokenizer y le pasas la cadena como parametro
	  int i = 1;
	  String Dia = "", Mes = "", Anio = "";
	  while(st.hasMoreTokens()) { //este ciclo es para comprobar cuando se acaba de procesar tu cadena
	      String palabra = st.nextToken();
	      if (i == 1){
		Anio = ""+Integer.parseInt(palabra);
	      }else if (i==2) {
		Mes = ""+Integer.parseInt(palabra);
		if (Mes.length() == 1){
		   Mes = "0"+Mes;
		}
	      }else{
		Dia = ""+Integer.parseInt(palabra);
		if (Dia.length() == 1){
		   Dia = "0"+Dia;
		}
	      }
	      i++;	      
	  } 
	  
	  return ""+Dia+"-"+Mes+"-"+Anio;	  
    }
    
     public static String FormatoFloat(String monto)  {
        
	  StringTokenizer st = new StringTokenizer(monto,","); 
	  //con esto creas el tokenizer y le pasas la cadena como parametro
	  int i = 1;
	  String salida = monto;
	  String primero = "", segundo="no";
	  while(st.hasMoreTokens()) { //este ciclo es para comprobar cuando se acaba de procesar tu cadena
	      String palabra = st.nextToken();
	      if (i == 1){
		primero = ""+palabra;
	      }else{
		segundo = ""+palabra;
	      }
	      i++;	      
	  } 
	  if (segundo.equals("no")){
	    salida = primero+".00";
	  }else{
	    salida = primero + "." +segundo;
	    if (segundo.length() == 1) {
	      salida = salida + "0";
	    }
	  }
	  
	  return salida;	  
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
    
    //Agregar un nvo Tipo
    public boolean agregar_NuevoTipo(Tipo u) {

        PreparedStatement psAgregar = null;
        try {

            psAgregar = conexion.prepareStatement("INSERT INTO TDP_DISPONIBLE VALUES (?,?);");
            
            psAgregar.setString(1, u.getTipo());   
            psAgregar.setInt(2, 1);   
            System.out.println(psAgregar.toString());
            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    
    public ArrayList<Tipo> listar_Tipos_existentes() {
        
        ArrayList<Tipo> Tipos = new ArrayList<Tipo>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM TDP_DISPONIBLE ORDER BY TIPO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo u = new Tipo();
                
                //if (Rs.getInt("status") == 1) {                    
                    u.setTipo(Rs.getString("tipo"));
                    Tipos.add(u);
                //}
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Tipos;

    }
    
    //Cambiar Status para un Tipo
    public boolean Eliminacion_deTipo(Tipo u) {

        PreparedStatement psEliminar = null;
        PreparedStatement psConsultar = null;
        try {                       
            
            psEliminar = conexion.prepareStatement("DELETE FROM TDP_DISPONIBLE where tipo = ?;");

            psEliminar.setString(1, u.getTipo());
            System.out.println(psEliminar.toString());

            Integer i = psEliminar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    
    public Tipo seleccionarDatos_Tipo(String s){
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("SELECT * FROM TDP_DISPONIBLE WHERE tipo = ?;");
            psConsultar.setString(1, s);
            
            System.out.println(psConsultar.toString());
            
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            //FormatoFloat();
            Tipo tip = new Tipo();
            tip.setTipo(Rs.getString("tipo"));
            
            
            return tip;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
  
    }
    

    public boolean ModificarDatos_Tipo(Tipo u) {
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("UPDATE TDP_DISPONIBLE SET tipo=? where tipo = ?;");
            psConsultar.setString(1, u.getTipo_nuevo());
            psConsultar.setString(2, u.getTipo());
            Integer i = psConsultar.executeUpdate();

            return i > 0;

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
            psAgregar.setDate(5, StringttoDate(u.getFecha()));
            
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
            //FormatoFloat();
            Tipo_de_Presupuesto pre = new Tipo_de_Presupuesto();
            pre.setCodigo(""+Rs.getInt("codigo"));
            pre.setDescripcion(Rs.getString("descripcion"));
            pre.setTipo(Rs.getString("tipo"));
            NumberFormat monto = new DecimalFormat("#############.##");		
            String s = monto.format(Rs.getFloat("monto"));
            pre.setMonto(""+FormatoFloat(s));                        
            pre.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
            
            
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
            
            psConsultar.setString(1, u.getDescripcion());
            psConsultar.setString(2, u.getTipo());
            psConsultar.setFloat(3, Float.parseFloat(u.getMonto()));                        
            psConsultar.setDate(4, StringttoDate(u.getFecha()));
                        
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
                    u.setMonto(""+FormatoFloat(s));
                    //u.setMonto(""+Rs.getFloat("monto"));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
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

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY TIPO,FECHA;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+FormatoFloat(s));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    
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

            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY TIPO DESC,FECHA;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
                if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+FormatoFloat(s));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    
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
                    u.setMonto(""+FormatoFloat(s));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    
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
                    u.setMonto(""+FormatoFloat(s));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    
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
                    u.setMonto(""+FormatoFloat(s));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    
                    Presupuestos.add(u);
                }
                
                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    } 

    public ArrayList<Tipo_de_Presupuesto> consultarDatos_Tipo_de_presupuesto_Busqueda
        (String tipo1, String tipo2, String tipo3, String tipo4, String fmin, String fmax) {

        ArrayList<Tipo_de_Presupuesto> Presupuestos = new ArrayList<Tipo_de_Presupuesto>();
        PreparedStatement psConsultar = null;
        try {
            int j = 0, k=0, min = 0, max = 0;
            String[] tipos = new String[4];
            String[] fechas = new String[2];
            if (!tipo1.equals("null")) {
                tipos[j] = tipo1;
                j++;
            }
            if (!tipo2.equals("null")) {
                tipos[j] = tipo2;
                j++;
            }
            if (!tipo3.equals("null")) {
                tipos[j] = tipo3;
                j++;
            }
            if (!tipo4.equals("null")) {
                tipos[j] = tipo4;
                j++;
            }
            if (!fmin.equals("")) {
                fechas[k] = fmin;
                min = 1;
                k++;
            }
            if (!fmax.equals("")) {
                fechas[k] = fmax;
                max = 1;
                k++;
            }                        
            
            if (j == 0){
                if (k==0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY TIPO,FECHA;");
                }else if (k==1){
                    //si es 1, kiere decir que la fecha es la min. sino, es la fecha tope.
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE fecha >= ? ORDER BY FECHA;");                        
                        psConsultar.setDate(1, StringttoDate(fechas[0]));
                    }else {
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE fecha <= ? ORDER BY FECHA;");                        
                        psConsultar.setDate(1, StringttoDate(fechas[0]));                        
                    }
                }else if (k==2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE fecha between ? and ? ORDER BY FECHA;");
                    psConsultar.setDate(1, StringttoDate(fechas[0]));                        
                    psConsultar.setDate(2, StringttoDate(fechas[1]));                        
                }
            }else if (j==1){
                if (k==0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO where tipo = ? ORDER BY TIPO,fecha;");
                    psConsultar.setString(1, tipos[0]);
                }else if (k==1){
                    //si es 1, kiere decir que la fecha es la min. sino, es la fecha tope.
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE tipo = ? and fecha >= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setDate(2, StringttoDate(fechas[0]));
                    }else {
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE tipo = ? and fecha <= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setDate(2, StringttoDate(fechas[0]));                        
                    }
                }else if (k==2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE tipo = ? and fecha between ? and ? ORDER BY tipo,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setDate(2, StringttoDate(fechas[0]));                        
                    psConsultar.setDate(3, StringttoDate(fechas[1]));                        
                }
            
            }else if (j==2){
                if (k==0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO where (tipo = ? or tipo = ?) ORDER BY TIPO,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setString(2, tipos[1]);
                }else if (k==1){
                    //si es 1, kiere decir que la fecha es la min. sino, es la fecha tope.
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ?) and fecha >= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setString(2, tipos[1]);
                        psConsultar.setDate(3, StringttoDate(fechas[0]));
                    }else {
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ?) and fecha <= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setString(2, tipos[1]);
                        psConsultar.setDate(3, StringttoDate(fechas[0]));                        
                    }
                }else if (k==2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ?) and fecha between ? and ? ORDER BY tipo,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setString(2, tipos[1]);
                    psConsultar.setDate(3, StringttoDate(fechas[0]));                        
                    psConsultar.setDate(4, StringttoDate(fechas[1]));                        
                }
            
            }else if (j==3){
                if (k==0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO where (tipo = ? or tipo = ? or tipo = ?) ORDER BY TIPO,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setString(2, tipos[1]);
                    psConsultar.setString(3, tipos[2]);
                }else if (k==1){
                    //si es 1, kiere decir que la fecha es la min. sino, es la fecha tope.
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ? or tipo = ?) and fecha >= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setString(2, tipos[1]);
                        psConsultar.setString(3, tipos[2]);
                        psConsultar.setDate(4, StringttoDate(fechas[0]));
                    }else {
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ? or tipo = ?) and fecha <= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setString(2, tipos[1]);
                        psConsultar.setString(3, tipos[2]);
                        psConsultar.setDate(4, StringttoDate(fechas[0]));                        
                    }
                }else if (k==2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ? or tipo = ?) and fecha between ? and ? ORDER BY tipo,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setString(2, tipos[1]);
                    psConsultar.setString(3, tipos[2]);
                    psConsultar.setDate(4, StringttoDate(fechas[0]));                        
                    psConsultar.setDate(5, StringttoDate(fechas[1]));                        
                }
            }else if (j==4){
                if (k==0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO where (tipo = ? or tipo = ? or tipo = ? or tipo = ?) ORDER BY TIPO,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setString(2, tipos[1]);
                    psConsultar.setString(3, tipos[2]);
                    psConsultar.setString(4, tipos[3]);
                }else if (k==1){
                    //si es 1, kiere decir que la fecha es la min. sino, es la fecha tope.
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ? or tipo = ? or tipo = ?) and fecha >= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setString(2, tipos[1]);
                        psConsultar.setString(3, tipos[2]);
                        psConsultar.setString(4, tipos[3]);
                        psConsultar.setDate(5, StringttoDate(fechas[0]));
                    }else {
                        psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ? or tipo = ? or tipo = ?) and fecha <= ? ORDER BY tipo,FECHA;");                        
                        psConsultar.setString(1, tipos[0]);
                        psConsultar.setString(2, tipos[1]);
                        psConsultar.setString(3, tipos[2]);
                        psConsultar.setString(4, tipos[3]);
                        psConsultar.setDate(5, StringttoDate(fechas[0]));                        
                    }
                }else if (k==2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE (tipo = ? or tipo = ? or tipo = ? or tipo = ?) and fecha between ? and ? ORDER BY tipo,FECHA;");
                    psConsultar.setString(1, tipos[0]);
                    psConsultar.setString(2, tipos[1]);
                    psConsultar.setString(3, tipos[2]);
                    psConsultar.setString(4, tipos[3]);
                    psConsultar.setDate(5, StringttoDate(fechas[0]));                        
                    psConsultar.setDate(6, StringttoDate(fechas[1]));                        
                }
            }
            
           // psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO ORDER BY CODIGO;");
            ResultSet Rs = psConsultar.executeQuery();
            Double total = 0.0;
            while (Rs.next()) {
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                
               // if (Rs.getInt("status") == 1) {
                    u.setCodigo(""+Rs.getInt("codigo"));
                    u.setDescripcion(Rs.getString("descripcion"));
                    u.setTipo(Rs.getString("tipo"));
                    //System.out.println("monto = "+Rs.getFloat("monto"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));
                    
                    u.setMonto(""+FormatoFloat(s));
                    //total = total + Double.parseDouble(""+Rs.getFloat("monto"));
                    //u.setMonto(""+Rs.getFloat("monto"));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    if (Rs.getInt("status") == 1){
                        u.setStatus("Habilitado");
                        total = total + Double.parseDouble(""+Rs.getFloat("monto"));
                    }else{
                        u.setStatus("Desabilitado");
                    }
                    
                    Presupuestos.add(u);
               // }
                
            }        
                //System.out.println("total = "+total);
                Tipo_de_Presupuesto u = new Tipo_de_Presupuesto();
                u.setDescripcion("TOTAL monto de Busqueda (Habilitados):");
                NumberFormat monto = new DecimalFormat("#############.##");		
                String s = monto.format(total);
                u.setMonto(""+FormatoFloat(s));
                u.setStatus("");
                Presupuestos.add(u);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }
        
        
        
    //PRESUPUESTOS
    public String agregarDatos_Presupuesto(Presupuesto u) {

        PreparedStatement psAgregar = null, psVerificarFecha = null;
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
                
                psVerificarFecha = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE CODIGO = ?;");            
                psVerificarFecha.setInt(1, codigo_TDP);
                ResultSet RsFecha = psVerificarFecha.executeQuery();
                RsFecha.next();
                Date fechatdp = RsFecha.getDate("fecha");
                Date fecha = StringttoDate(u.getFecha());
                System.out.println("fechatdp = "+fechatdp+" fecha = "+fecha);
                if (fecha.before(fechatdp)){
                    return "Fecha errada";
                }
                
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
                        psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (default,?,?,?,?,?,?);");
                        psAgregar.setInt(1, Integer.parseInt(u.getCodigo_TDP()));   
                        psAgregar.setInt(2, Integer.parseInt(u.getCodigo_lab()));
                        psAgregar.setFloat(3, Float.parseFloat(u.getMonto_asignado()));            
                        psAgregar.setInt(4, 1);
                        psAgregar.setDate(5, StringttoDate(u.getFecha()));
                        psAgregar.setString(6, u.getDescripcion());
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
        PreparedStatement psUpdate = null, psVerificarFecha = null;
        Integer codigo_TDP, codigo_lab;
        Float monto, monto_tdp, monto_final;
        try {

            codigo_TDP = Integer.parseInt(u.getCodigo_TDP());
            psConsultar = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO tdp WHERE tdp.codigo = ? and tdp.status = 1;");
            psConsultar.setInt(1, codigo_TDP);
            ResultSet Rs = psConsultar.executeQuery();
            if (Rs.next()){
                
                psVerificarFecha = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE CODIGO = ?;");            
                psVerificarFecha.setInt(1, codigo_TDP);
                ResultSet RsFecha = psVerificarFecha.executeQuery();
                RsFecha.next();
                Date fechatdp = RsFecha.getDate("fecha");
                Date fecha = StringttoDate(u.getFecha());
                System.out.println("fechatdp = "+fechatdp+" fecha = "+fecha);
                if (fecha.before(fechatdp)){
                    return "Fecha errada";
                }
                
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
                        psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (default,?,?,?,?,?,?);");
                        psAgregar.setInt(1, codigo_TDP);   
                        psAgregar.setInt(2, codigo_lab);
                        psAgregar.setFloat(3, monto);            
                        psAgregar.setInt(4, 1);
                        psAgregar.setDate(5, StringttoDate(u.getFecha()));
                        psAgregar.setString(6, u.getDescripcion());
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

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_tdp in (select codigo from TIPO_DE_PRESUPUESTO)ORDER BY CODIGO_LABORATORIO,FECHA;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                if (Rs.getInt("status") == 1){                    
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto_asignado"));
                    
                    u.setMonto_asignado(""+FormatoFloat(s));
                    //u.setMonto_asignado(""+Rs.getFloat("monto_asignado"));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    u.setDescripcion(""+Rs.getString("descripcion"));
                    u.setId(""+Rs.getInt("id"));
                    u.setNombrelab(NombreLaboratorio(Rs.getInt("codigo_laboratorio")));
                    Presupuestos.add(u);
                }
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Presupuestos;

    }

    
    public String NombreLaboratorio(int codigo) {
        
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("select * from laboratorio  where codigo_laboratorio  = ?;");
            psConsultar.setInt(1, codigo);
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            return Rs.getString("nombre");
            


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return "";

    }
    
    public ArrayList<Presupuesto> consultarDatosIndividual_Presupuesto(Presupuesto pres) {

        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_laboratorio = ? and status = 1 ORDER BY FECHA;");
            psConsultar.setInt(1, Integer.parseInt(pres.getCodigo_lab()));
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                if (Rs.getInt("status") == 1){
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto_asignado"));
                    
                    u.setMonto_asignado(""+FormatoFloat(s));
                    //u.setMonto_asignado(""+Rs.getFloat("monto_asignado"));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
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

            psConsultar = conexion.prepareStatement("(select distinct lab.codigo_laboratorio as codigo_lab, lab.nombre as nombre, SUM(p.monto_asignado) as monto\n" +
                                                    "from laboratorio lab, Presupuesto p, Tipo_de_Presupuesto tdp\n" +
                                                    "where lab.codigo_laboratorio = p.codigo_laboratorio and p.status = 1 and tdp.codigo = p.codigo_tdp\n" +
                                                    "group by lab.codigo_laboratorio\n" +
                                                    "order by lab.codigo_laboratorio)\n" +
                                                    "UNION\n" +
                                                    "(Select codigo_laboratorio, nombre, monto \n" +
                                                    "from laboratorio\n" +
                                                    "where (codigo_laboratorio,nombre) NOT IN (select distinct lab.codigo_laboratorio as codigo_lab, lab.nombre as nombre\n" +
                                                    "        from laboratorio lab, Presupuesto p\n" +
                                                    "        where lab.codigo_laboratorio = p.codigo_laboratorio and p.status = 1\n" +
                                                    "        group by lab.codigo_laboratorio\n" +
                                                    "        order by lab.codigo_laboratorio))\n" +
                                                    "order by codigo_lab;");
            ResultSet Rs = psConsultar.executeQuery();

           
            
            while (Rs.next()) {
                    Laboratorio u = new Laboratorio();                
                    u.setCodigo_lab(""+Rs.getInt("codigo_lab"));
                    u.setNombre(""+Rs.getString("nombre"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto"));                    
                    u.setMonto(""+FormatoFloat(s));
                    //u.setMonto(""+Rs.getFloat("monto"));                    
                    Laboratorios.add(u);                
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return Laboratorios;

    }
    
        public ArrayList<Presupuesto> consultarDatos_Presupuesto_Busqueda
        (String codigo1, String codigo2, String codigo3, String codigo4, 
         String codigo5, String codigo6, String codigo7, String codigo8, String fmin, String fmax) {

        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null;
        try {
            int j = 0, k=0, min = 0, max = 0;
            String[] codigos = new String[8];
            String[] fechas = new String[2];
            if (!codigo1.equals("null")) {
                codigos[j] = codigo1;
                j++;
            }
            if (!codigo2.equals("null")) {
                codigos[j] = codigo2;
                j++;
            }
            if (!codigo3.equals("null")) {
                codigos[j] = codigo3;
                j++;
            }
            if (!codigo4.equals("null")) {
                codigos[j] = codigo4;
                j++;
            }
            if (!codigo5.equals("null")) {
                codigos[j] = codigo5;
                j++;
            }
            if (!codigo6.equals("null")) {
                codigos[j] = codigo6;
                j++;
            }
            if (!codigo7.equals("null")) {
                codigos[j] = codigo7;
                j++;
            }
            if (!codigo8.equals("null")) {
                codigos[j] = codigo8;
                j++;
            }
            
            
            if (!fmin.equals("")) {
                fechas[k] = fmin;
                min = 1;
                k++;
            }
            if (!fmax.equals("")) {
                fechas[k] = fmax;
                max = 1;
                k++;
            }
            
            if (j == 0){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO ORDER BY CODIGO_LABORATORIO,FECHA;");
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    } 
                    psConsultar.setDate(1, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(1, StringttoDate(fechas[0]));
                    psConsultar.setDate(2, StringttoDate(fechas[1]));
                }
            }else if (j == 1){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_laboratorio = ? ORDER BY CODIGO_LABORATORIO,FECHA;");
                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_laboratorio = ? and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_laboratorio = ? and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }                    
                    psConsultar.setDate(2, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where codigo_laboratorio = ? and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                        
                    psConsultar.setDate(2, StringttoDate(fechas[0]));
                    psConsultar.setDate(3, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
            
            }else if (j == 2){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ?) ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(3, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(3, StringttoDate(fechas[0]));
                    psConsultar.setDate(4, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
                psConsultar.setInt(2, Integer.parseInt(codigos[1]));
            }else if (j == 3){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(4, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(4, StringttoDate(fechas[0]));
                    psConsultar.setDate(5, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
                psConsultar.setInt(2, Integer.parseInt(codigos[1]));
                psConsultar.setInt(3, Integer.parseInt(codigos[2]));
            }else if (j == 4){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) ORDER BY CODIGO_LABORATORIO,FECHA;");
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(5, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(5, StringttoDate(fechas[0]));
                    psConsultar.setDate(6, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
                psConsultar.setInt(2, Integer.parseInt(codigos[1]));
                psConsultar.setInt(3, Integer.parseInt(codigos[2]));
                psConsultar.setInt(4, Integer.parseInt(codigos[3]));
                
            
            }else if (j == 5){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(6, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(6, StringttoDate(fechas[0]));
                    psConsultar.setDate(7, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
                psConsultar.setInt(2, Integer.parseInt(codigos[1]));
                psConsultar.setInt(3, Integer.parseInt(codigos[2]));
                psConsultar.setInt(4, Integer.parseInt(codigos[3]));
                psConsultar.setInt(5, Integer.parseInt(codigos[4]));
                
            }else if (j == 6){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(7, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(7, StringttoDate(fechas[0]));
                    psConsultar.setDate(8, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
                psConsultar.setInt(2, Integer.parseInt(codigos[1]));
                psConsultar.setInt(3, Integer.parseInt(codigos[2]));
                psConsultar.setInt(4, Integer.parseInt(codigos[3]));
                psConsultar.setInt(5, Integer.parseInt(codigos[4]));
                psConsultar.setInt(6, Integer.parseInt(codigos[5]));
                
            }else if (j == 7){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(8, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where (codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ? or codigo_laboratorio = ?) and fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(8, StringttoDate(fechas[0]));
                    psConsultar.setDate(9, StringttoDate(fechas[1]));
                }
                psConsultar.setInt(1, Integer.parseInt(codigos[0]));
                psConsultar.setInt(2, Integer.parseInt(codigos[1]));
                psConsultar.setInt(3, Integer.parseInt(codigos[2]));
                psConsultar.setInt(4, Integer.parseInt(codigos[3]));
                psConsultar.setInt(5, Integer.parseInt(codigos[4]));
                psConsultar.setInt(6, Integer.parseInt(codigos[5]));
                psConsultar.setInt(7, Integer.parseInt(codigos[6]));
                
            }else if (j == 8){
                if (k == 0){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                }else if (k == 1){
                    if (min == 1){
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where fecha >= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }else{
                        psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where fecha <= ? ORDER BY CODIGO_LABORATORIO,FECHA;");                                            
                    }
                    psConsultar.setDate(1, StringttoDate(fechas[0]));
                }else if (k == 2){
                    psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO where fecha between ? and ? ORDER BY CODIGO_LABORATORIO,FECHA;");                    
                    psConsultar.setDate(1, StringttoDate(fechas[0]));
                    psConsultar.setDate(2, StringttoDate(fechas[1]));
                }
                
            }
          
                
            
            //psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO ORDER BY CODIGO_LABORATORIO;");
            ResultSet Rs = psConsultar.executeQuery();

            while (Rs.next()) {
                Presupuesto u = new Presupuesto();
                //if (Rs.getInt("status") == 1){                    
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto_asignado"));
                    
                    u.setMonto_asignado(""+FormatoFloat(s));
                    //u.setMonto_asignado(""+Rs.getFloat("monto_asignado"));
                    u.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
                    u.setDescripcion(""+Rs.getString("descripcion"));
                    u.setId(""+Rs.getInt("id"));
                    if (Rs.getInt("status") == 1){
                        u.setStatus("Habilitado");
                        //total = total + Double.parseDouble(""+Rs.getFloat("monto"));
                    }else{
                        u.setStatus("Desabilitado");
                    }
                    u.setNombrelab(NombreLaboratorio(Rs.getInt("codigo_laboratorio")));
                    Presupuestos.add(u);
                //}
            }
                
            return Presupuestos;    

        } catch (SQLException ex) {
            ex.printStackTrace();
            
        }
        return Presupuestos;
        
    }

    
        public Presupuesto seleccionarDatos_Presupuesto(int codigo){
        PreparedStatement psConsultar = null;
        try {
            
            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO WHERE id = ? and status = 1;");
            psConsultar.setInt(1, codigo);
            
            System.out.println(psConsultar.toString());
            
            ResultSet Rs = psConsultar.executeQuery();
            Rs.next();
            
            Presupuesto pre = new Presupuesto();
            pre.setCodigo_TDP(""+Rs.getInt("codigo_tdp"));
            pre.setCodigo_lab(Rs.getString("codigo_laboratorio"));
            pre.setDescripcion(Rs.getString("descripcion"));          
            NumberFormat monto = new DecimalFormat("#############.##");		
            String s = monto.format(Rs.getFloat("monto_asignado"));
            pre.setMonto_asignado(""+FormatoFloat(s));                        
            pre.setFecha(""+FormatoFechaDMA(Rs.getString("fecha")));
            pre.setId(Rs.getString("id"));
            
            
            return pre;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
  
        }


        public String ModificarDatos_Presupuesto(Presupuesto u) {
        PreparedStatement psConsultar = null, psBuscar = null, psBuscarTDP = null, psUpdate= null, psVerificarFecha = null;
        try {
            
            psVerificarFecha = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE CODIGO = ?;");            
            psVerificarFecha.setInt(1, Integer.parseInt(u.getCodigo_TDP()));
            ResultSet RsFecha = psVerificarFecha.executeQuery();
            RsFecha.next();
            Date fechatdp = RsFecha.getDate("fecha");
            Date fecha = StringttoDate(u.getFecha());
            System.out.println("fechatdp = "+fechatdp+" fecha = "+fecha);
            if (fecha.before(fechatdp)){
                return "Fecha errada";
            }
            
            
            Integer i = 0;
            psBuscar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO WHERE ID = ?;");
            psBuscar.setInt(1, Integer.parseInt(u.getId()));
            ResultSet Rs = psBuscar.executeQuery();
            Rs.next();
            int codigotdp_actual = Rs.getInt("codigo_TDP"), 
                    codigotdp_nuevo = Integer.parseInt(u.getCodigo_TDP());            
            Float monto_actual = Rs.getFloat("monto_asignado"), 
                    nuevo_monto = Float.parseFloat(u.getMonto_asignado());
            Float montotdp;
            System.out.println("nuevo monto = "+nuevo_monto +" monto actual = " +monto_actual);
            //si es el mismo codigo de tipo de presupuesto se empieza a chequear los montos
            if (codigotdp_actual == codigotdp_nuevo){                
                if (nuevo_monto > monto_actual) {
                    psBuscarTDP = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE CODIGO = ?;");
                    psBuscarTDP.setInt(1, codigotdp_actual);
                    ResultSet RsTDP = psBuscarTDP.executeQuery();
                    RsTDP.next();
                    montotdp = RsTDP.getFloat("monto");
                    System.out.println("montotdp = "+montotdp);
                    if (montotdp >= nuevo_monto - monto_actual){
                        psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto = ? where codigo = ?;");
                        System.out.println("el psupdate en nuevo monto > montoActual es este = " + psUpdate.toString());
                        psUpdate.setInt(2, codigotdp_actual);
                        psUpdate.setFloat(1, montotdp - (nuevo_monto - monto_actual));  
                        psUpdate.executeUpdate();
                    } else {
                        return "Error en monto";
                    }
                } else if (monto_actual > nuevo_monto) {
                    psBuscarTDP = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE CODIGO = ?;");
                    psBuscarTDP.setInt(1, codigotdp_actual);
                    ResultSet RsTDP = psBuscarTDP.executeQuery();
                    RsTDP.next();
                    montotdp = RsTDP.getFloat("monto");
                    psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto = ? where codigo = ?;");
                    psUpdate.setFloat(1, montotdp + (monto_actual - nuevo_monto));  
                    psUpdate.setInt(2, codigotdp_actual);                    
                    System.out.println("el psupdate es este = " + psUpdate.toString());
                    psUpdate.executeUpdate();
                    
                } 
                psConsultar = conexion.prepareStatement("UPDATE PRESUPUESTO SET codigo_tdp = ?, codigo_laboratorio = ?, descripcion=?, monto_asignado=?, fecha=? where id = ?;");            
                psConsultar.setInt(1, Integer.parseInt(u.getCodigo_TDP()));
                psConsultar.setInt(2, Integer.parseInt(u.getCodigo_lab()));
                psConsultar.setString(3, u.getDescripcion());
                psConsultar.setFloat(4, Float.parseFloat(u.getMonto_asignado()));                                                
                psConsultar.setDate(5, StringttoDate(u.getFecha()));
                psConsultar.setInt(6, Integer.parseInt(u.getId()));                        
                System.out.println(psConsultar.toString());
                i = psConsultar.executeUpdate();

                return "ok";
            //si son codigos de tipo de presupuesto diferentes se procede de la siguiente forma    
            }else {
                montotdp = RsFecha.getFloat("monto");
                if (montotdp >= nuevo_monto){
                    //coigo nuevo
                    psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto = ? where codigo = ?;");
                    psUpdate.setFloat(1, montotdp - nuevo_monto);  
                    psUpdate.setInt(2, codigotdp_nuevo);                    
                    System.out.println("el psupdate es este = " + psUpdate.toString());
                    psUpdate.executeUpdate();
                    
                    //codigo actual
                    psBuscarTDP = conexion.prepareStatement("SELECT * FROM TIPO_DE_PRESUPUESTO WHERE CODIGO = ?;");
                    psBuscarTDP.setInt(1, codigotdp_actual);
                    ResultSet RsTDP = psBuscarTDP.executeQuery();
                    RsTDP.next();
                    montotdp = RsTDP.getFloat("monto");
                    
                    psUpdate = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET monto = ? where codigo = ?;");
                    psUpdate.setFloat(1, montotdp + monto_actual);  
                    psUpdate.setInt(2, codigotdp_actual);                    
                    System.out.println("el psupdate de codigotdp_actual = "+codigotdp_actual+" es este = " + psUpdate.toString());
                    psUpdate.executeUpdate();
                }else{
                    return "Error en monto";
                }
                
                psConsultar = conexion.prepareStatement("UPDATE PRESUPUESTO SET codigo_tdp = ?, codigo_laboratorio = ?, descripcion=?, monto_asignado=?, fecha=? where id = ?;");            
                psConsultar.setInt(1, Integer.parseInt(u.getCodigo_TDP()));
                psConsultar.setInt(2, Integer.parseInt(u.getCodigo_lab()));
                psConsultar.setString(3, u.getDescripcion());
                psConsultar.setFloat(4, Float.parseFloat(u.getMonto_asignado()));                                                
                psConsultar.setDate(5, StringttoDate(u.getFecha()));
                psConsultar.setInt(6, Integer.parseInt(u.getId()));                        
                System.out.println(psConsultar.toString());
                i = psConsultar.executeUpdate();

                return "ok";
            }
            
               
            

        } catch (SQLException ex) {
            ex.printStackTrace();
            return "Failure";
        }
    }        
        
    public boolean Reformulacion_Presupuesto() {
        ArrayList<Presupuesto> Presupuestos = new ArrayList<Presupuesto>();
        PreparedStatement psConsultar = null, psAgregar = null;
        try {
            ArrayList<Laboratorio> Laboratorios = DBMS.getInstance().consultarDatosTotales_Presupuesto(); 
            
            psConsultar = conexion.prepareStatement("SELECT * FROM PRESUPUESTO WHERE status = 1;");
            ResultSet Rs = psConsultar.executeQuery(); 
            while (Rs.next()) {
                    Presupuesto u = new Presupuesto();                                
                    u.setCodigo_TDP(""+Rs.getInt("codigo_TDP"));
                    u.setCodigo_lab(""+Rs.getInt("codigo_laboratorio"));
                    u.setId(""+Rs.getInt("id"));
                    DBMS.getInstance().CambiarStatus_Presupuesto(u);
            } 
                    
            psConsultar = conexion.prepareStatement("select fecha from tipo_de_presupuesto where tipo = 'REFORMULACION';");
            Rs = psConsultar.executeQuery(); 
            Rs.next();
            Date date = Rs.getDate("fecha");
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int year = cal.get(Calendar.YEAR);
            String fecha = "01/01/"+(year+1);
            
            psAgregar = conexion.prepareStatement("UPDATE TIPO_DE_PRESUPUESTO SET fecha = ? WHERE TIPO = 'REFORMULACION';");
            psAgregar.setDate(1, StringttoDate(fecha));
            psAgregar.executeUpdate();
            
            
            int i = 0;
            while (i < Laboratorios.size()) {
                String codigolab = Laboratorios.get(i).getCodigo_lab();
                String monto = Laboratorios.get(i).getMonto();
                
                if (!monto.equals("0.00")) {
                    
                    psAgregar = conexion.prepareStatement("INSERT INTO PRESUPUESTO VALUES (default,?,?,?,?,?,?);");
                    psAgregar.setInt(1, 999);   
                    psAgregar.setInt(2, Integer.parseInt(codigolab));
                    psAgregar.setFloat(3, Float.parseFloat(monto));            
                    psAgregar.setInt(4, 1);
                    psAgregar.setDate(5, StringttoDate(fecha));
                    psAgregar.setString(6, "REFORMULACION");
                    //System.out.println(psAgregar.toString());  
                    psAgregar.executeUpdate();
                }
                
                System.out.println("codigo lab = "+ codigolab +" monto = " +monto);                
                i++;
            }
        
                        
        } catch (SQLException ex) {
            ex.printStackTrace();
        }      
        return true;
    }    /*
    NumberFormat monto = new DecimalFormat("#############.##");		
                    String s = monto.format(Rs.getFloat("monto_asignado"));
                    
                    u.setMonto_asignado(""+FormatoFloat(s));*/


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
