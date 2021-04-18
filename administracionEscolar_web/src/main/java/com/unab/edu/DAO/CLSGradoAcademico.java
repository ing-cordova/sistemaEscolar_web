/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Grados_Academicos;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author dayan
 */
public class CLSGradoAcademico {
    
    ConexionBD claseConectar = new ConexionBD();
        Connection conectar = claseConectar.RetornarConexion();
        
    public  ArrayList<Grados_Academicos> MostrarGradoAcademico(){
    ArrayList<Grados_Academicos> GradoAcad = new ArrayList<> ();
    
        try {
        CallableStatement Statement = conectar.prepareCall("call SP_S_GRADOS_ACADEMICOS()");
        ResultSet resultadoConsulta = Statement.executeQuery();
        
        while(resultadoConsulta.next()){
              Grados_Academicos gradAcad = new Grados_Academicos();
              
              gradAcad.setIdGradoAcademico(resultadoConsulta.getInt("idGradoAcademico"));
              gradAcad.setNombre_GradoAcad(resultadoConsulta.getString("Nombre_GradoAcad"));
              gradAcad.setUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
              gradAcad.setEstado(resultadoConsulta.getInt("Estado"));
              
              GradoAcad.add(gradAcad);
          }
            conectar.close();
        } catch (Exception e) {
        }
        return GradoAcad ;
    } 
    
    public void BorrarGradoAcademico(Grados_Academicos gradAca){
        
        try {
           CallableStatement Statement = conectar.prepareCall("call SP_D_GRADOS_ACADEMICOS(?)");
           
           Statement.setInt("PIdGradoAcademico", gradAca.getIdGradoAcademico());
           
           Statement.execute();
           JOptionPane.showMessageDialog(null, "Datos eliminados con éxito");
           
           conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public void ActualizarGradoAcademico(Grados_Academicos gradAca){
        
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_GRADOS_ACADEMICOS(?,?,?,?)");
            
            Statement.setInt("PIdGradoAcademico", gradAca.getIdGradoAcademico());
            Statement.setString("PNombreGradoAcademico", gradAca.getNombre_GradoAcad());
            Statement.setDate("PUltimaModificacion", new java.sql.Date(gradAca.getUltima_Modificacion().getTime())); 
            Statement.setInt("PEstado", gradAca.getEstado());
            
            Statement.execute();
            JOptionPane.showMessageDialog(null, "Datos actualizados con éxito");
            
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public void AgregarGradoAcademico(Grados_Academicos gradAca){
    
        try {
            
            CallableStatement Statement = conectar.prepareCall("call SP_I_GRADOS_ACADEMICOS(?,?,?,?,?)");
            
            Statement.setInt("PIdGradoAcademico", gradAca.getIdGradoAcademico());
            Statement.setString("PNombreGradoAcademico", gradAca.getNombre_GradoAcad());
            Statement.setDate("PUltimaModificacion", new java.sql.Date(gradAca.getUltima_Modificacion().getTime())); 
            Statement.setInt("PEstado", gradAca.getEstado());
            
            Statement.execute();
            JOptionPane.showMessageDialog(null, "Datos agregados con éxito");
            
            conectar.close();
        } catch (Exception e) {
      }
    }
}
