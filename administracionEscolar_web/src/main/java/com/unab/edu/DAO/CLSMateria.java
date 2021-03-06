/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Materia;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author dayan
 */
public class CLSMateria {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public ArrayList<Materia> MostrarMateria(Materia materia) {
        ArrayList<Materia> Materias = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_MATERIAS(?)");
            Statement.setInt("PidGrado_Academico", materia.getIdGradoAcademico());
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Materia mat = new Materia();
                mat.setIdMateria(resultadoConsulta.getInt("idMateria"));
                mat.setIdGradoAcademico(resultadoConsulta.getInt("idGradoAcademico"));
                mat.setNombre_Materia(resultadoConsulta.getString("Nombre_Materia"));
                mat.setUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                mat.setEstado(resultadoConsulta.getInt("Estado"));

                Materias.add(mat);
            }
            conectar.close();
        } catch (Exception e) {
            //JOptionPane.showMessageDialog(null, e);
        }
        return Materias;
   }
    
    public ArrayList<Materia> MostrarTodasMateria() {
        ArrayList<Materia> Materias = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_MATERIAS_ALL()");
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Materia mat1 = new Materia();
                mat1.setIdMateria(resultadoConsulta.getInt("idMateria"));
                mat1.setIdGradoAcademico(resultadoConsulta.getInt("idGradoAcademico"));
                mat1.setNombre_GradoAcad(resultadoConsulta.getString("Nombre_GradoAcad"));
                mat1.setNombre_Materia(resultadoConsulta.getString("Nombre_Materia"));
                mat1.setMtrUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                mat1.setMtrEstado(resultadoConsulta.getInt("Estado"));

                Materias.add(mat1);
            }
            conectar.close();
        } catch (Exception e) {
            //JOptionPane.showMessageDialog(null, e);
        	System.out.println(e);
        }
        
        return Materias;
    }
    
    public ArrayList<Materia> MostrarMateria() {
        ArrayList<Materia> Materias = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_ALL_MATERIAS()");
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Materia mat = new Materia();
                mat.setIdMateria(resultadoConsulta.getInt("idMateria"));
                mat.setIdGradoAcademico(resultadoConsulta.getInt("idGradoAcademico"));
                mat.setNombre_Materia(resultadoConsulta.getString("Nombre_Materia"));
                mat.setUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                mat.setEstado(resultadoConsulta.getInt("Estado"));

                Materias.add(mat);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Materias;
    }

    public void BorrarMateria(Materia mate) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_D_MATERIAS(?)");

            Statement.setInt("PidMateria", mate.getIdMateria());

            Statement.execute();
            //JOptionPane.showMessageDialog(null, "Materia eliminada");
            System.out.println("Materia eliminada");

            conectar.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void ActualizarMateria(Materia mate) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_MATERIAS(?,?,?,?,?)");

            Statement.setInt("PidMateria", mate.getIdMateria());
            Statement.setInt("PidGradoAcademico", mate.getIdGradoAcademico());
            Statement.setString("PNombre_Materia", mate.getNombre_Materia());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(mate.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", mate.getEstado());

            Statement.execute();
            //JOptionPane.showMessageDialog(null, "Materia actualizada");
            System.out.println("Materia actualizada");

            conectar.close();

        } catch (SQLException e) {
            //JOptionPane.showMessageDialog(null, e);
        	System.out.println("ERROR EN CLSMATERIA" + e);
        }
    }

    public void AgregarMateria(Materia mate) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_I_MATERIAS(?,?,?,?)");
            Statement.setInt("PidGradoAcademico", mate.getIdGradoAcademico());
            Statement.setString("PNombre_Materia", mate.getNombre_Materia());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(mate.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", mate.getEstado());

            Statement.execute();
            //JOptionPane.showMessageDialog(null, "Materia guardada");
            System.out.println("Materia guardada");

            conectar.close();
        } catch (SQLException e) {
            //JOptionPane.showMessageDialog(null, e);
        	System.out.println("ERROR EN CLSMATERIA" + e);
        }
    }
}
