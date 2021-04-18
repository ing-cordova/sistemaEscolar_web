/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Materias_Alumnos;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author dayan
 */
public class CLSMateriaAlumno {
    ConexionBD claseConectar = new ConexionBD();
        Connection conectar = claseConectar.RetornarConexion();
        
    public  ArrayList<Materias_Alumnos> MostrarMateriaAlumno(){
    ArrayList<Materias_Alumnos> MateriaAlumno = new ArrayList<> ();
    
        try {
        CallableStatement Statement = conectar.prepareCall("call SP_S_MATERIAS_ALUMNOS()");
        ResultSet resultadoConsulta = Statement.executeQuery();
        
        while(resultadoConsulta.next()){
              Materias_Alumnos MatAlum = new Materias_Alumnos();
              
              MatAlum.setIdMateriaAlumno(resultadoConsulta.getInt("idMateriaAlumno"));
              MatAlum.setIdEstudiante(resultadoConsulta.getInt("idEstudiante"));
              MatAlum.setIdMateria(resultadoConsulta.getInt("idMateria"));
              MatAlum.setUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
              MatAlum.setEstado(resultadoConsulta.getInt("Estado"));
              
              MateriaAlumno.add(MatAlum);
          }
            conectar.close();
        } catch (Exception e) {
        }
        return MateriaAlumno;
    } 
    
    public void BorrarMateriaAlumno(Materias_Alumnos matAlum){
        
        try {
           CallableStatement Statement = conectar.prepareCall("call SP_D_MATERIAS_ALUMNOS(?)");
           
           Statement.setInt("JIdMateriaAlumno", matAlum.getIdMateriaAlumno());
           
           Statement.execute();
           JOptionPane.showMessageDialog(null, "Datos eliminados con éxito");
           
           conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public void ActualizarMateriaAlumno(Materias_Alumnos matAlum){
        
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_MATERIAS_ALUMNOS(?,?,?,?,?)");
            
            Statement.setInt("PidMateriaAlumno", matAlum.getIdMateriaAlumno());
            Statement.setInt("PidEstudiante", matAlum.getIdEstudiante());
            Statement.setInt("PidMateria", matAlum.getIdMateria());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(matAlum.getUltima_Modificacion().getTime())); 
            Statement.setInt("PEstado", matAlum.getEstado());
            
            Statement.execute();
            JOptionPane.showMessageDialog(null, "Datos actualizados con éxito");
            
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public void AgregarMateriaAlumno(Materias_Alumnos matAlum){
    
        try {
            
            CallableStatement Statement = conectar.prepareCall("call SP_I_MATERIAS_ALUMNOS(?,?,?,?)");
            Statement.setInt("PidEstudiante", matAlum.getIdEstudiante());
            Statement.setInt("PidMateria", matAlum.getIdMateria());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(matAlum.getUltima_Modificacion().getTime())); 
            Statement.setInt("PEstado", matAlum.getEstado());
            
            Statement.execute();
            System.out.println("Datos agregados con éxito");
            
            conectar.close();
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
}
