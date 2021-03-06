/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Docente;
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
            CallableStatement Statement = conectar.prepareCall("call SP_S_ESTUDIANTES()");
            ResultSet resultadoConsulta = Statement.executeQuery();
            while (resultadoConsulta.next()) {
                Estudiante est = new Estudiante();

                est.setIdEstudiante(resultadoConsulta.getInt("idEstudiante"));
                est.setIdPersona(resultadoConsulta.getInt("idPersona"));
                est.setCorreo_Electronico(resultadoConsulta.getString("CorreoElectronico"));
                est.setPass(resultadoConsulta.getString("Pass"));
                est.setIdGradoAcademico(resultadoConsulta.getInt("idGradoAcademico"));
                est.setEstUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                est.setEstEstado(resultadoConsulta.getInt("Estado"));
                Estudiantes.add(est);
            }
            conectar.close();
        } catch (Exception e) {
            
            System.out.println("Ha ocurrido un error en: ClsEstudiante/MostrarEstudiante" + e);
        }
        return Estudiantes;
    }

    public void BorrarEstudiante(Estudiante est) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_D_ESTUDIANTES(?)");

            Statement.setInt("PidEstudiante", est.getIdEstudiante());

            Statement.execute();
            //JOptionPane.showMessageDialog(null, "Estudiante eliminado con exito");
            System.out.println("Estudiante eliminado con exito");

            conectar.close();
        } catch (SQLException e) {
            //JOptionPane.showMessageDialog(null, e);
            System.out.println("Ha ocurrido un error, vendo de CLSEstudiante/BorrarEstudiante" + e);
        }
    }

    public void ActualizarEstudiante(Estudiante est) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_ESTUDIANTE(?,?,?,?,?,?,?)");
            Statement.setInt("PidEstudiante", est.getIdEstudiante());
            Statement.setInt("PidPersona", est.getIdPersona());
            Statement.setString("PCorreo_Electronico", est.getCorreo_Electronico());
            Statement.setString("PPass", est.getPass());
            Statement.setInt("PidGradoAcademico", est.getIdGradoAcademico());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(est.getEstUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", est.getEstEstado());

            Statement.execute();
            System.out.println("Estudiante actualizado con exito");
            conectar.close();

        } catch (SQLException e) {
           
        	System.out.println("Ocurrio un error en CLSEstudiante/ActualizarEstudiante" + e);
        }
    }

    public void AgregarEstudiante(Estudiante est) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_I_ESTUDIANTES(?,?,?,?,?,?)");

            Statement.setInt("PidPersona", est.getIdPersona());
            Statement.setString("PCorreo_Electronico", est.getCorreo_Electronico());
            Statement.setString("PPass", est.getPass());
            Statement.setInt("PidGradoAcademico", est.getIdGradoAcademico());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(est.getEstUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", est.getEstEstado());

            Statement.execute();
            System.out.println("Estudiante guardado con Exito");

            conectar.close();
        } catch (SQLException e) {
           
            System.out.println("Ha ocurrido un error en CLSEstudiante/AgregarEstudiante" + e);
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
            System.out.println("Ha ocurrido un error en: RetornoFullName" + e);
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
            System.out.println("Ha ocurrido un error en: ReternoIdGrado" + e);
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
            System.out.println("Ha ocurrido un error en: RetornoIdEstudiante" + e);
        }

        return ID;
    }

    public boolean EmailValidate(String correo){

        boolean validar = false;
        try {
            CallableStatement consulta = conectar.prepareCall("call SP_VALIDAREMAILESTUDIANTE(?)");
            consulta.setString("email", correo);
            ResultSet resultado = consulta.executeQuery();

            while(resultado.next()){
                System.out.println("=> Email existente.");
                validar = true;
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error en: EmailValidate" + e);
        }
        return validar;
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
            System.out.println("Ha ocurrido un error en: MostrarJoinEstudiantePersna" + e);
        } 
        return lista;
    }
    
    public ArrayList<Estudiante> JoinEstudiante(){
        
        ArrayList <Estudiante> lista =  new ArrayList<>();
            try {
                CallableStatement st = conectar.prepareCall("call SP_S_JOINESTUDIANTE()");
                ResultSet rs = st.executeQuery();
                System.out.println("> Paso 1");
                while (rs.next ()){
                	System.out.println("> Paso 2 " + rs.getString("Nombre"));
                    Estudiante es = new Estudiante();
                    es.setIdEstudiante(rs.getInt("idEstudiante"));
                    es.setIdPersona(rs.getInt("idPersona"));
                    es.setNombre(rs.getString("Nombre"));
                    es.setApellido(rs.getString("Apellido"));
                    es.setSexo(rs.getString("Sexo"));
                    es.setDUI(rs.getString("DUI"));
                    es.setNIT(rs.getString("NIT"));
                    es.setFecha_Nacimiento(rs.getString("Fecha_Nacimiento"));
                    es.setCorreo_Electronico(rs.getString("Correo_Electronico"));
                    es.setPass(rs.getString("Pass"));
                    es.setIdGradoAcademico(rs.getInt("idGradoAcademico"));
                    es.setNombre_GradoAcad(rs.getString("Nombre_GradoAcad"));
                    es.setEstUltima_Modificacion(rs.getDate("Ultima_Modificacion"));
                    es.setEstEstado(rs.getInt("Estado"));
                    lista.add(es);
                    
                }
                System.out.println("> Paso 3");
            } catch (Exception e) {
            	System.out.println("> Algo salio mal en: CLSEstudiante/JoinEstudiante.");
            } 
            return lista;
        }
}
