package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Docente;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class CLSDocente {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public ArrayList<Docente> MostrarDocente() {
        ArrayList<Docente> Docentes = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_DOCENTES()");
            ResultSet resultadoConsulta = Statement.executeQuery();

            while (resultadoConsulta.next()) {
                Docente prof = new Docente();

                prof.setIdDocente(resultadoConsulta.getInt("idDocente"));
                prof.setIdPersona(resultadoConsulta.getInt("idPersona"));
                prof.setCorreo_Electronico(resultadoConsulta.getString("Correo_Electronico"));
                prof.setPass(resultadoConsulta.getString("Pass"));
                prof.setEspecialidad(resultadoConsulta.getString("Especialidad"));
                prof.setDocUltima_Modificacion(resultadoConsulta.getDate("Ultima_Modificacion"));
                prof.setDocEstado(resultadoConsulta.getInt("Estado"));

                Docentes.add(prof);
            }
            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Docentes;
    }

    public void BorrarDocente(Docente profe) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_D_DOCENTES(?)");
            Statement.setInt("PidDocente", profe.getIdDocente());

            Statement.execute();
            System.out.println("DOCENTE ELIMINADO");

            conectar.close();
        } catch (SQLException e) {
            System.out.println("ERROR AL ELIMINAR DOCENTE" + e);
        }
    }

    public void ActualizarDocente(Docente profe) {

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_U_DOCENTES(?,?,?,?,?,?,?)");
            Statement.setInt("PidDocente", profe.getIdDocente());
            Statement.setInt("PidPersona", profe.getIdPersona());
            Statement.setString("PCorreo_Electronico", profe.getCorreo_Electronico());
            Statement.setString("PPass", profe.getPass());
            Statement.setString("PEspecialidad", profe.getEspecialidad());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(profe.getDocUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", profe.getDocEstado());

            Statement.execute();
            System.out.println("Docente Actualizado");

            conectar.close();
        } catch (SQLException e) {
            System.out.println("Ha ocurrido un error en CLSDocente/ActualizarDocente " + e);
        }
    }

    public void AgregarDocente(Docente profe) {
        try {
            CallableStatement Statement = conectar.prepareCall("call SP_I_DOCENTES(?,?,?,?,?,?)");
            Statement.setInt("PidPersona", profe.getIdPersona());
            Statement.setString("PCorreo_Electronico", profe.getCorreo_Electronico());
            Statement.setString("PPass", profe.getPass());
            Statement.setString("PEspecialidad", profe.getEspecialidad());
            Statement.setDate("PUltima_Modificacion", new java.sql.Date(profe.getDocUltima_Modificacion().getTime()));
            Statement.setInt("PEstado", profe.getDocEstado());

            Statement.execute();
            System.out.println("Docente guardado");

            conectar.close();

        } catch (SQLException e) {
            System.out.println("ERROR" + e);
        }
    }

    public boolean LoguinDocente(String correo, String pass) {

        ArrayList<Docente> ListadoCORREOPASS = new ArrayList<>();
        ArrayList<Docente> ListarContra = new ArrayList<>();

        try {
            CallableStatement Statement = conectar.prepareCall("call SP_S_LOGUIN_DOCENTES(?,?)");
            Statement.setString("PCorreo_Electronico", correo);
            Statement.setString("PPass", pass);
            ResultSet resultadoConsulta = Statement.executeQuery();
            while (resultadoConsulta.next()) {

                Docente doce = new Docente();
                doce.setCorreo_Electronico(resultadoConsulta.getString("Correo_Electronico"));
                doce.setPass(resultadoConsulta.getString("Pass"));
                ListadoCORREOPASS.add(doce);
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
                Docente escrip = new Docente();
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

            CallableStatement consulta = conectar.prepareCall("call SP_S_APELLIDOSNOMBRES_D(?,?)");
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

    public ArrayList<Docente> MostrarJoinDocentePersona(Docente Dos) {

        ArrayList<Docente> lista = new ArrayList<>();
        try {
            CallableStatement st = conectar.prepareCall("Call SP_S_JOIN_DOCENTEPERSONA(?)");
            st.setInt("PidDocente",Dos.getIdDocente());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Docente Do = new Docente();

                Do.setNombre(rs.getString("Nombre"));
                Do.setApellido(rs.getString("Apellido"));
                Do.setSexo(rs.getString("Sexo"));
                Do.setDUI(rs.getString("Dui"));
                Do.setNIT(rs.getString("Nit"));
                Do.setEspecialidad(rs.getString("Especialidad"));
                Do.setCorreo_Electronico(rs.getString("Correo_Electronico"));

                lista.add(Do);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, lista);
        }
        return lista;
    }
    
    public int RetornoIdDocente(String correo, String pass) {

        int ID = 0;

        try {

            CallableStatement consulta = conectar.prepareCall("call SP_S_APELLIDOSNOMBRES_D(?,?)");
            consulta.setString("PCorreo", correo);
            consulta.setString("Ppass", pass);
            ResultSet resultado = consulta.executeQuery();

            while (resultado.next()) {

                ID = resultado.getInt("idDocente");
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error en: \n" + e);
        }

        return ID;
    }
    
    public ArrayList<Docente> JoinDocentes() {

        ArrayList<Docente> lista = new ArrayList<>();
        try {
            CallableStatement st = conectar.prepareCall("call SP_S_JOINDOCENTES()");
            ResultSet rs = st.executeQuery();
            System.out.println("> Paso 1");
            while (rs.next()) {
            	System.out.println("> Paso 2 " + rs.getString("Nombre"));
                Docente Do = new Docente();
                Do.setIdDocente(rs.getInt("idDocente"));
                Do.setIdPersona(rs.getInt("idPersona"));
                Do.setNombre(rs.getString("Nombre"));
                Do.setApellido(rs.getString("Apellido"));
                Do.setSexo(rs.getString("Sexo"));
                Do.setDUI(rs.getString("Dui"));
                Do.setNIT(rs.getString("Nit"));
                Do.setFecha_Nacimiento(rs.getString("Fecha_Nacimiento"));
                Do.setCorreo_Electronico(rs.getString("Correo_Electronico"));
                Do.setPass(rs.getString("Pass"));
                Do.setEspecialidad(rs.getString("Especialidad"));
                Do.setDocUltima_Modificacion(rs.getDate("Ultima_Modificacion"));
                Do.setDocEstado(rs.getInt("Estado"));
                lista.add(Do);
            }
            System.out.println("> Paso 3");
        } catch (Exception e) {
            System.out.println("> Algo salio mal en: CLSDocente.");
        }
        return lista;
    }

    public boolean EmailValidate(String correo){

        boolean validar = false;
        try {
            CallableStatement consulta = conectar.prepareCall("call SP_VALIDAREMAILDOCENTE(?)");
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
}
