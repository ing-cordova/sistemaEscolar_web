/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Actividades_Estudiantes;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.interfaces.RSAKey;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author AndresC
 */
public class CLSActividades_Alumno {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public void Insertar_Actividad(Actividades_Estudiantes ae) {

        try {
            CallableStatement statement = conectar.prepareCall("call SP_I_ACTIVIDADES_ESTUDIANTES(?,?,?,?,?,?,?,?)");
            statement.setInt("PidEstudiante", ae.getIdEstudiante());
            statement.setInt("PidActividad", ae.getIdActividad());
            statement.setInt("PidMateria", ae.getIdMateria());
            statement.setDouble("PNota", ae.getNota_Obtenida());
            statement.setBytes("PArchivo", ae.getArchivo());
            statement.setString("PEstado_Act", ae.getEstado_Actividad());
            statement.setDate("PUltima_Modificacion", new java.sql.Date(ae.getUltima_Modificacion().getTime()));
            statement.setInt("PEstado", ae.getEstado());
            statement.execute();
            JOptionPane.showMessageDialog(null, "¡Se envió la tarea con éxito!");

            conectar.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public void Actualizar_Actividad(Actividades_Estudiantes ae) {

        try {
            CallableStatement statement = conectar.prepareCall("call SP_U_ACTIVIDADES_ESTUDIANTES(?,?,?,?)");
            statement.setInt("PidActividadEst", ae.getIdActividadEstudiante());
            statement.setInt("PidEstudiante", ae.getIdEstudiante());
            statement.setDouble("PNotaFinal", ae.getNota_Obtenida());
            statement.setDate("PUltima_Modificacion", new java.sql.Date(ae.getUltima_Modificacion().getTime()));
            statement.execute();

            JOptionPane.showMessageDialog(null, "¡Se ha calificado esta actividad con éxito!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public void Anular_Envio(Actividades_Estudiantes ae){
        
        try {
            CallableStatement statement = conectar.prepareCall("call SP_ANULAR_ENVIO(?,?)");
            statement.setInt("PidActividadEst", ae.getIdActividadEstudiante());
            statement.setInt("PidEstudiante", ae.getIdEstudiante());
            statement.execute();
            JOptionPane.showMessageDialog(null, "¡Se ha anulado el envío con éxito!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    public boolean Verificar_Entrega(Actividades_Estudiantes ae) {

        boolean verifica = false;

        try {
            CallableStatement statement = conectar.prepareCall("call SP_S_VALIDAR_ENTREGA (?,?)");
            statement.setInt("PidEstudiante", ae.getIdEstudiante());
            statement.setInt("PidActividad", ae.getIdActividad());
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                verifica = true;
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

        return verifica;
    }

    public ArrayList<Actividades_Estudiantes> Mostrar_Acts_Alumnos(Actividades_Estudiantes ae) {

        ArrayList<Actividades_Estudiantes> Listado = new ArrayList<>();

        try {

            CallableStatement st = conectar.prepareCall("call SP_S_ACTIVS_ALUMNOS(?,?)");
            st.setInt("PidMateria", ae.getIdMateria());
            st.setInt("PidActividad", ae.getIdActividad());
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                Actividades_Estudiantes actividad = new Actividades_Estudiantes();
                actividad.setIdActividadEstudiante(rs.getInt("idActividadEstudiante"));
                actividad.setIdEstudiante(rs.getInt("idEstudiante"));
                actividad.setCorreo_Electronico(rs.getString("Correo_Electronico"));
                actividad.setNombre_Actividad(rs.getString("Nombre_Actividad"));
                actividad.setArchivo(rs.getBytes("Archivo"));
                actividad.setPorcentaje(rs.getDouble("Porcentaje"));
                actividad.setNota_Obtenida(rs.getDouble("Nota_Obtenida"));
                actividad.setEstado_Actividad(rs.getString("Estado_Actividad"));

                Listado.add(actividad);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

        return Listado;
    }

    public ArrayList<Actividades_Estudiantes> Mostrar_Todas_Actividades(Actividades_Estudiantes ae) {

        ArrayList<Actividades_Estudiantes> Listado = new ArrayList<>();

        try {

            CallableStatement st = conectar.prepareCall("call SP_S_VER_ACTIVIDADES(?)");
            st.setInt("PidEstudiante", ae.getIdEstudiante());
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                Actividades_Estudiantes actividad = new Actividades_Estudiantes();
                actividad.setIdActividadEstudiante(rs.getInt("idActividadEstudiante"));
                actividad.setNombre_Materia(rs.getString("Nombre_Materia"));
                actividad.setNombre_Actividad(rs.getString("Nombre_Actividad"));
                actividad.setPorcentaje(rs.getDouble("Porcentaje"));
                actividad.setNota_Obtenida(rs.getDouble("Nota_Obtenida"));
                actividad.setEstado_Actividad(rs.getString("Estado_Actividad"));
                actividad.setArchivo(rs.getBytes("Archivo"));

                Listado.add(actividad);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

        return Listado;
    }

    public void Ejecutar_PDF(int id) {

        PreparedStatement sentencia = null;
        ResultSet resultado = null;
        byte[] archivo = null;

        try {
            //Consulta nativa hacia MySQL
            sentencia = conectar.prepareStatement("SELECT Archivo FROM actividades_estudiantes WHERE idActividadEstudiante = ?;");
            sentencia.setInt(1, id);
            resultado = sentencia.executeQuery();

            
            if (resultado.next()) {
                archivo = resultado.getBytes(1);
            }

            InputStream input = new ByteArrayInputStream(archivo);

            int sizeInput = input.available();
            System.out.println("> Tamaño:" + sizeInput + " bytes");
            byte[] datosPDF = new byte[sizeInput];

            //Leemos PDF(bytes, - , tamaño)
            input.read(datosPDF, 0, sizeInput);

            //Guardamos la salida en un archivo pdf temporal.
            OutputStream out = new FileOutputStream("new.pdf");
            out.write(datosPDF);
            //Abrir Archivo
            out.close();
            input.close();
            sentencia.close();
            resultado.close();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al abrir el archivo: \n\n" + e);
        }
    }
    
    public void Reenviar_Actividad(Actividades_Estudiantes ae){
        
        try {
            CallableStatement statement = conectar.prepareCall("call SP_S_REENVIAR_ACTIVIDAD(?,?,?,?)");
            statement.setInt("PidActEstudent", ae.getIdActividadEstudiante());
            statement.setInt("PidEstudiante", ae.getIdEstudiante());
            statement.setBytes("PArchivo", ae.getArchivo());
            statement.setDate("PUltima_Modificacion", new java.sql.Date(ae.getUltima_Modificacion().getTime()));
            statement.execute();
           
            JOptionPane.showMessageDialog(null, "¡Tu tarea ha sido modificada con éxito!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
}
