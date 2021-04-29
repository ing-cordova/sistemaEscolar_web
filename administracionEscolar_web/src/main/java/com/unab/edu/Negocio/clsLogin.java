package com.unab.edu.Negocio;

import com.unab.edu.DAO.CLSAdministrador;
import com.unab.edu.DAO.CLSDocente;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.Entidades.Docente;
import com.unab.edu.Entidades.Estudiante;

public class clsLogin {

	public int TipoUsuario(String email, String password) {
		
		int tipo = 0;
		
		CLSEstudiante clsStudent = new CLSEstudiante();
		CLSDocente clsTeacher = new CLSDocente();
		CLSAdministrador clsAdmin = new CLSAdministrador();
		
		var accessStudent = clsStudent.LoguinEstudiante(email, password);
		var accessTeacher = clsTeacher.LoguinDocente(email, password);
		var accessAdmin = clsAdmin.LoguinAdministrador(email, password);
		
		if(accessStudent == true) {
			tipo = 1;
		}
		else if(accessTeacher == true) {
			tipo = 2;
		}
		else if(accessAdmin == true) {
			tipo = 3;
		}
		else {
			System.out.println("> Usuario no encontrado.");
		}
		
		return tipo;
	}
}
