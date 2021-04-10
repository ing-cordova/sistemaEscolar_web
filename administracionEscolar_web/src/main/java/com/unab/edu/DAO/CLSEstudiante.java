/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Estudiante;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author dayan
 */
public class CLSEstudiante {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public ArrayList<Estudiante> MostrarEstudiante() {
        ArrayList<Estudiante> Estudiantes = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_Estudiante()");
            ResultSet resultadoConsulta = Statement.executeQuery();
            while (resultadoConsulta.next()) {
                Estudiante est = new Estudiante();

                est.setIdEstudiante(resultadoConsulta.getInt("idEstudiante"));
                est.setIdPersona(resultadoConsulta.getInt("idPersona"));
                est.setCorreo_Electronico(resultadoConsulta.getString("CorreoElectronico"));
                est.setPass(resultadoConsulta.getString("Pass"));
                est.setIdGradoAcademico(resultadoConsulta.getInt("idGradoAcademico"));
                est.setUltima_Modificacion(resultadoConsulta.getDate("Fecha"));
                est.setEstado(resultadoConsulta.getInt("Estado"));

                Estudiantes.add(est);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Estudiantes;
    }

    public void BorrarEstudiante(Estudiante est) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_D_Estudiante(?)");

            Statement.setInt("PIdEstudiante", est.getIdEstudiante());

            Statement.execute();
            JOptionPane.showMessageDialog(null, "Estudiante eliminado");

            conectar.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void ActualizarEstudiante(Estudiante est) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_Estudiante(?,?,?,?,?,?,?)");
            Statement.setInt("PIdEstudiante", est.getIdEstudiante());
            Statement.setInt("PIdPersona", est.getIdPersona());
            Statement.setString("PCorreoElectronico", est.getCorreo_Electronico());
            Statement.setString("PPass", est.getPass());
            Statement.setInt("PidGradoAcademico", est.getIdGradoAcademico());
            Statement.setDate("PUltimaModificacion", new java.sql.Date(est.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", est.getEstado());

            Statement.execute();
            JOptionPane.showMessageDialog(null, "Estudiante actualizado");

            conectar.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void AgregarEstudiante(Estudiante est) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_I_ESTUDIANTES(?,?,?,?,?,?)");

            Statement.setInt("PidPersona", est.getIdPersona());
            Statement.setString("PCorreo_Electronico", est.getCorreo_Electronico());
            Statement.setString("PPass", est.getPass());
            Statement.setInt("PidGradoAcademico", est.getIdGradoAcademico());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(est.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", est.getEstado());

            Statement.execute();
            System.out.println("Estudiante guardado");

            conectar.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public boolean LoguinEstudiante(String correo, String pass) {

        ArrayList<Estudiante> ListadoCORREOPASS = new ArrayList<>();
        ArrayList<Estudiante> ListarContra = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_LOGUIN_ESTUDIANTES(?,?)");
            Statement.setString("PCorreo_Electronico", correo);
            Statement.setString("Ppass", pass);
            ResultSet resultadoConsulta = Statement.executeQuery();
            while (resultadoConsulta.next()) {

                Estudiante est = new Estudiante();
                est.setCorreo_Electronico(resultadoConsulta.getString("Correo_Electronico"));
                est.setPass(resultadoConsulta.getString("Pass"));
                ListadoCORREOPASS.add(est);
            }

            String correoBD = null;
            String passBD = null;
            for (var iterar : ListadoCORREOPASS) {

                correoBD = iterar.getCorreo_Electronico();
                passBD = iterar.getPass();
            }

            CallableStatement st2 = conectar.prepareCall("call SP_S_CRIP(?)");
            st2.setString("PCripPass", pass);
            ResultSet rs2 = st2.executeQuery();
            while (rs2.next()) {
                Estudiante escrip = new Estudiante();
                escrip.setPass(rs2.getNString("crip"));
                ListarContra.add(escrip);
            }

            String passcrip = null;
            for (var iterar : ListarContra) {

                passcrip = iterar.getPass();
                pass = passcrip;
            }

            if (correoBD != null && passBD != null) {
                if (correoBD.equals(correo) && passBD.equals(pass)) {
                    return true;
                }
            }
            conectar.close();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return false;
    }

    public String RetornoFullName(String correo, String pass) {

        String fullName = "";

        try {

            CallableStatement consulta = conectar.prepareCall("call SP_S_APELLIDOSNOMBRES_E(?,?)");
            consulta.setString("PCorreo", correo);
            consulta.setString("Ppass", pass);
            ResultSet resultado = consulta.executeQuery();

            while (resultado.next()) {

                fullName = resultado.getString("Nombres_Completos");
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error en: \n" + e);
        }

        return fullName;
    }
    
    public int RetornoIdGrado(String correo, String pass) {

        int ID = 0;

        try {

            CallableStatement consulta = conectar.prepareCall("call SP_S_APELLIDOSNOMBRES_E(?,?)");
            consulta.setString("PCorreo", correo);
            consulta.setString("Ppass", pass);
            ResultSet resultado = consulta.executeQuery();

            while (resultado.next()) {

                ID = resultado.getInt("idGradoAcademico");
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error en: \n" + e);
        }

        return ID;
    }
    
    public int RetornoIdEstudiante(String correo, String pass) {

        int ID = 0;

        try {

            CallableStatement consulta = conectar.prepareCall("call SP_S_APELLIDOSNOMBRES_E(?,?)");
            consulta.setString("PCorreo", correo);
            consulta.setString("Ppass", pass);
            ResultSet resultado = consulta.executeQuery();

            while (resultado.next()) {

                ID = resultado.getInt("idEstudiante");
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error en: \n" + e);
        }

        return ID;
    }
    
    public ArrayList<Estudiante> MostrarJoinEstudiantePersona(Estudiante est){
        
    ArrayList <Estudiante> lista =  new ArrayList();
        try {
            CallableStatement st = conectar.prepareCall("call SP_S_JOINESTUDIANTEPERSONA(?)");
            st.setInt("PidEstudiante",est.getIdEstudiante());
            ResultSet rs = st.executeQuery();
            while (rs.next ()){
                Estudiante es = new Estudiante();
                es.setNombre(rs.getString("Nombre"));
                es.setApellido(rs.getString("Apellido"));
                es.setSexo(rs.getString("Sexo"));
                es.setDUI(rs.getString("Dui"));
                es.setNIT(rs.getString("Nit"));
                es.setNombre_GradoAcad(rs.getString("Nombre_GradoAcad"));
                es.setCorreo_Electronico(rs.getString("Correo_Electronico"));
                
                lista.add(es);
                
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, lista);
        } 
        return lista;
    }
}
