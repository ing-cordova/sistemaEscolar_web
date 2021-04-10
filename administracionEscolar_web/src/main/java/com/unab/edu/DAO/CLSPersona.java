/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Persona;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 *
 * @author dayan
 */
public class CLSPersona {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public ArrayList<Persona> MostrarPersona() {
        ArrayList<Persona> Personas = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_PERSONAS()");
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Persona persona = new Persona();

                persona.setIdPersona(resultadoConsulta.getInt("idPersona"));
                persona.setNombre(resultadoConsulta.getString("Nombre"));
                persona.setApellido(resultadoConsulta.getString("Apellido"));
                persona.setSexo(resultadoConsulta.getString("Sexo"));
                persona.setDUI(resultadoConsulta.getString("DUI"));
                persona.setNIT(resultadoConsulta.getString("NIT"));
                persona.setFecha_Nacimiento(resultadoConsulta.getDate("Fecha_Nacimiento"));
                persona.setUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                persona.setEstado(resultadoConsulta.getInt("Estado"));

                Personas.add(persona);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Personas;
    }

    public int RetornoLastID(){
        
        int retorno = 0;
        
        try {
            CallableStatement consulta = conectar.prepareCall("call SP_S_ULTIMAPERSONA()");
            ResultSet resultado = consulta.executeQuery();
            
            while(resultado.next()){
                
                retorno = resultado.getInt("idPersona");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Ha ocurrido un error en: \n\n\n\n" + e);
        }
        
        return retorno;
    }


    public void BorrarPersona(Persona per) {

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_D_PERSONAS(?)");

            Statement.setInt("PidPersona", per.getIdPersona());

            Statement.execute();
            JOptionPane.showMessageDialog(null, "Persona eliminada");

            conectar.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void ActualizarPersona(Persona per) {

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_PERSONAS ?,?,?,?,?,?,?,?,?)");

            Statement.setInt("PidPersona", per.getIdPersona());
            Statement.setString("PNombre", per.getNombre());
            Statement.setString("PApellido", per.getApellido());
            Statement.setString("PSexo", per.getSexo());
            Statement.setString("PDui", per.getDUI());
            Statement.setString("PNit", per.getNIT());
            Statement.setDate("PFecha_Nacimiento", new java.sql.Date(per.getFecha_Nacimiento().getTime()));
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(per.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", per.getEstado());

            Statement.execute();
            JOptionPane.showMessageDialog(null, "Persona actualizada");

            conectar.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void AgregarPersona(Persona per) {

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_I_PERSONAS(?,?,?,?,?,?,?,?)");

            Statement.setString("PNombre", per.getNombre());
            Statement.setString("PApellido", per.getApellido());
            Statement.setString("PSexo", per.getSexo());
            Statement.setString("PDui", per.getDUI());
            Statement.setString("PNit", per.getNIT());
            Statement.setDate("PFecha_Nacimiento", new java.sql.Date(per.getFecha_Nacimiento().getTime()));
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(per.getUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", per.getEstado());

            Statement.execute();
            System.out.println("Persona guardada");

            conectar.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
}
