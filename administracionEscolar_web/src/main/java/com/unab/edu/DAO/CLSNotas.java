/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Materia;
import com.unab.edu.Entidades.Notas;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author dayan
 */
public class CLSNotas {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public ArrayList<Notas> MostrarNota() {
        ArrayList<Notas> Nota = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_NOTAS()");
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Notas nota = new Notas();

                nota.setIdNota(resultadoConsulta.getInt("idNota"));
                nota.setIdEstudiante(resultadoConsulta.getInt("idEstudiante"));
                nota.setIdMateria(resultadoConsulta.getInt("idMateria"));
                nota.setPeriodo1(resultadoConsulta.getDouble("Periodo1"));
                nota.setPeriodo2(resultadoConsulta.getDouble("Periodo2"));
                nota.setPeriodo3(resultadoConsulta.getDouble("Periodo3"));
                nota.setNotaFinal(resultadoConsulta.getDouble("Nota_Final"));
                nota.setRecuperacion(resultadoConsulta.getDouble("Recuperacion"));
                nota.setUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                nota.setEstado(resultadoConsulta.getInt("Estado"));

                Nota.add(nota);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Nota;
    }

    public void BorrarNotas(Notas not) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_D_NOTAS(?)");

            Statement.setInt("PIdNotas", not.getIdNota());

            Statement.execute();
            JOptionPane.showMessageDialog(null, "Notas eliminadas");

            conectar.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void ActualizarNotas(Notas not) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_NOTA_ALUMNO(?,?,?,?,?,?,?)");
            Statement.setInt("PidNota", not.getIdNota());
            Statement.setDouble("PP1", not.getPeriodo1());
            Statement.setDouble("PP2", not.getPeriodo2());
            Statement.setDouble("PP3", not.getPeriodo3());
            Statement.setDouble("PFinal", not.getNotaFinal());
            Statement.setDouble("PRepo", not.getRecuperacion());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(not.getUltima_Modificacion().getTime()));

            Statement.execute();
            JOptionPane.showMessageDialog(null, "Notas actualizada");

            conectar.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void AgregarNotas(Notas not) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_I_NOTAS(?,?,?,?,?,?,?,?,?)");

            Statement.setInt("PidEstudiante", not.getIdEstudiante());
            Statement.setInt("PidMateria", not.getIdMateria());
            Statement.setDouble("PPeriodo1", not.getPeriodo1());
            Statement.setDouble("PPeriodo2", not.getPeriodo2());
            Statement.setDouble("PPeriodo3", not.getPeriodo3());
            Statement.setDouble("PNota_Final", not.getNotaFinal());
            Statement.setDouble("PRecuperacion", not.getRecuperacion());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(not.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", not.getEstado());

            Statement.execute();
            System.out.println("Notas guardada");

            //conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public ArrayList<Notas> MostrarNotaByStudente(Notas n) {
        ArrayList<Notas> Nota = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_NOTAS_ALUMNO(?)");
            Statement.setInt("PidEstudiante", n.getIdEstudiante());
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Notas nota = new Notas();
                nota.setIdMateria(resultadoConsulta.getInt("idMateria"));
                nota.setNombre_Materia(resultadoConsulta.getString("Nombre_Materia"));
                nota.setPeriodo1(resultadoConsulta.getDouble("Periodo1"));
                nota.setPeriodo2(resultadoConsulta.getDouble("Periodo2"));
                nota.setPeriodo3(resultadoConsulta.getDouble("Periodo3"));
                nota.setNotaFinal(resultadoConsulta.getDouble("Nota_Final"));
                nota.setRecuperacion(resultadoConsulta.getDouble("Recuperacion"));

                Nota.add(nota);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Nota;
    }

    public ArrayList<Notas> NOTAS_PUBLICADAS(Notas n) {
        ArrayList<Notas> Nota = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_PUBLICAR_NOTAS(?)");
            Statement.setInt("PidMateria", n.getIdMateria());
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Notas nota = new Notas();
                nota.setIdNota(resultadoConsulta.getInt("idNota"));
                nota.setIdEstudiante(resultadoConsulta.getInt("idEstudiante"));
                nota.setCorreo_Electronico(resultadoConsulta.getString("Correo_Electronico"));
                nota.setPeriodo1(resultadoConsulta.getDouble("Periodo1"));
                nota.setPeriodo2(resultadoConsulta.getDouble("Periodo2"));
                nota.setPeriodo3(resultadoConsulta.getDouble("Periodo3"));
                nota.setNotaFinal(resultadoConsulta.getDouble("Nota_Final"));
                nota.setRecuperacion(resultadoConsulta.getDouble("Recuperacion"));

                Nota.add(nota);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Nota;
    }

    public boolean Verificar_Materias(int idEstudiante) {

        boolean verifica = false;

        try {

            CallableStatement st = conectar.prepareCall("call SP_S_VERIFICAR_MATERIAS(?)");
            st.setInt("PidEstudiante", idEstudiante);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                verifica = true;
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

        return verifica;
    }
}
