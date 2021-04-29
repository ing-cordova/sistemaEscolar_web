package com.unab.edu.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.unab.edu.Conexion.ConexionBD;
import com.unab.edu.Entidades.Administradores;
import com.unab.edu.Entidades.Docente;

public class CLSAdministrador {

	ConexionBD claseConectar = new ConexionBD();
	Connection conectar = claseConectar.RetornarConexion();

	public void AgregarAdministrador(Administradores admin) {

		try {
			CallableStatement statement = conectar.prepareCall("call SP_I_ADMINISTRADORES(?,?,?,?)");
			statement.setInt("PidPersona", admin.getIdPersona());
			statement.setString("PCorreo_Electronico", admin.getCorreo_Electronico());
			statement.setString("PPass", admin.getPass());
			statement.setDate("PUltima_Modificacion", new java.sql.Date(admin.getAdmUltima_Modificacion().getTime()));

			statement.execute();
			System.out.println("> Administrador guardado");
			conectar.close();

		} catch (Exception e) {
			System.out.println("> Ocurrió un error en CLSAdministrador: " + e);
		}
	}

	public boolean LoguinAdministrador(String correo, String pass) {

		ArrayList<Administradores> ListadoCORREOPASS = new ArrayList<>();
		ArrayList<Administradores> ListarContra = new ArrayList<>();

		try {
			CallableStatement Statement = conectar.prepareCall("call SP_S_LOGUIN_ADMINISTRADOR(?,?)");
			Statement.setString("PCorreo_Electronico", correo);
			Statement.setString("Ppass", pass);
			ResultSet resultadoConsulta = Statement.executeQuery();
			while (resultadoConsulta.next()) {

				Administradores admin = new Administradores();
				admin.setCorreo_Electronico(resultadoConsulta.getString("Correo_Electronico"));
				admin.setPass(resultadoConsulta.getString("Pass"));
				ListadoCORREOPASS.add(admin);
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
				Administradores escrip = new Administradores();
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
			System.out.println("> Ha ocurrido un error en CLSAdministrador/Login" + e);
		}

		return false;
	}

	public String MostrarAdministrador(Administradores admin) {
		String fullname = "";
		try {
			CallableStatement statement = conectar.prepareCall("call SP_S_APELLIDOSNOMBRES_A(?,?)");
			statement.setString("PCorreo", admin.getCorreo_Electronico());
			statement.setString("Ppass", admin.getPass());
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				fullname = result.getString("Nombres_Completos");
			}
		} catch (Exception e) {
			System.out.println("Ocurrio un error en CLSAdministrador/MostrarAdministrador " + e);
		}
		return fullname;
	}
}
