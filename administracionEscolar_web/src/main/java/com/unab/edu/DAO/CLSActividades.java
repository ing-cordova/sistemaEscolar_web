/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.DAO;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Actividades;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author AndresC
 */
public class CLSActividades {

    ConexionBD claseConectar = new ConexionBD();
    Connection conectar = claseConectar.RetornarConexion();

    public void AgregarActividad(Actividades act) {

        try {
            CallableStatement statement = conectar.prepareCall("call SP_I_ACTIVIDAD(?,?,?,?,?,?,?,?)");
            statement.setInt("PidDocente", act.getIdDocente());
            statement.setInt("PidMateria", act.getIdMateria());
            statement.setString("PNombre_Actividad", act.getNombre_Actividad());
            statement.setDouble("PPorcentaje", act.getPorcentaje());
            statement.setString("PFecha_Entrega", act.getFecha_Entrega());
            statement.setString("PEstado_Actividad", act.getEstado_Actividad());
            statement.setDate("PUltima_Modificacion", new java.sql.Date(act.getActUltima_Modificacion().getTime()));
            statement.setInt("PEstado", act.getActEstado());

            statement.execute();
            System.out.println("Actividad guardada con exito!!!");
            conectar.close();
        } catch (Exception e) {

            System.out.println("Ha ocurrido un error en CLSActividades/AgregarActividad " + e);
        }
    }

    public ArrayList<Actividades> MostrarActividades() {

        ArrayList<Actividades> actividades = new ArrayList<>();
        try {
            CallableStatement statement = conectar.prepareCall("call SP_S_MOSTRAR_ACTS()");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                Actividades act = new Actividades();
                act.setIdActividad(rs.getInt("idActividad"));
                act.setIdMateria(rs.getInt("idMateria"));
                act.setNombre_Materia(rs.getString("Nombre_Materia"));
                act.setNombre_Actividad(rs.getString("Nombre_Actividad"));
                act.setPorcentaje(rs.getDouble("Porcentaje"));
                act.setFecha_Entrega(rs.getString("Fecha_Entrega"));
                actividades.add(act);
            }

            conectar.close();
        } catch (Exception e) {
        }
        return actividades;
    }

    public void ActualizarActividad(Actividades act) {

        try {
            CallableStatement st = conectar.prepareCall("call SP_U_ACTIVIDAD(?,?,?,?,?,?,?,?)");
            st.setInt("PidActividad", act.getIdActividad());
            st.setInt("PidDocente", act.getIdDocente());
            st.setInt("PidMateria", act.getIdMateria());
            st.setString("PNombre_Actividad", act.getNombre_Actividad());
            st.setDouble("PPorcentaje", act.getPorcentaje());
            st.setString("PFecha_Entrega", act.getFecha_Entrega());
            st.setDate("PUltima_Modificacion", new java.sql.Date(act.getActUltima_Modificacion().getTime()));
            st.setInt("PEstado", act.getActEstado());

            st.execute();
            System.out.println("Actividad actualizada con exito!!");

            conectar.close();
        } catch (Exception e) {

            System.out.println("Ha ocurrido un error en CLSActividades/ActualizarActividad " + e);
        }
    }

    public void EliminarActividad(Actividades act) {

        try {
            CallableStatement st = conectar.prepareCall("call SP_D_ACTIVIDAD(?)");
            st.setInt("PidActividad", act.getIdActividad());

            st.execute();
            System.out.println("Actividad eliminada con exito!!");

            conectar.close();
        } catch (Exception e) {

            System.out.println("Hubo un error en CLSActividades/EliminarActividad: " + e);
        }
    }

    public ArrayList<Actividades> Mostrar_Tareas_By_Materia(Actividades act) {

        ArrayList<Actividades> lista = new ArrayList<>();
        try {
            CallableStatement statement = conectar.prepareCall("call SP_S_MOSTRAR_TAREAS(?)");
            statement.setInt("PidMateria", act.getIdMateria());
            ResultSet rs = statement.executeQuery();
            
            while(rs.next()){
                
                Actividades activ = new Actividades();
                activ.setIdActividad(rs.getInt("idActividad"));
                activ.setNombre_Actividad(rs.getString("Nombre_Actividad"));
                activ.setPorcentaje(rs.getDouble("Porcentaje"));
                activ.setFecha_Entrega(rs.getString("Fecha_Entrega"));
                activ.setEstado_Actividad(rs.getString("Estado_Actividad"));
                
                lista.add(activ);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

        return lista;
    }
}
