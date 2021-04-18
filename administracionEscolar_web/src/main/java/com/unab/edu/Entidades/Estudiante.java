/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.Entidades;

import java.util.Date;

/**
 *
 * @author BetoCalderon
 */

public class Estudiante extends Persona {
	protected int idEstudiante;
	protected int idPersona;
	protected String Correo_Electronico;
	protected String Pass;
	protected int idGradoAcademico;
	protected Date Ultima_Modificacion;
	protected int Estado;
	//Por si hay un error a la hora de mostrar, eliminar esta linea
	//y extender GradosAcademicos en la Entidad Persona.
	protected String Nombre_GradoAcad;

	public int getIdEstudiante() {
		return idEstudiante;
	}

	public void setIdEstudiante(int idEstudiante) {
		this.idEstudiante = idEstudiante;
	}

	public int getIdPersona() {
		return idPersona;
	}

	public void setIdPersona(int idPersona) {
		this.idPersona = idPersona;
	}

	public String getCorreo_Electronico() {
		return Correo_Electronico;
	}

	public void setCorreo_Electronico(String correo_Electronico) {
		Correo_Electronico = correo_Electronico;
	}

	public String getPass() {
		return Pass;
	}

	public void setPass(String pass) {
		Pass = pass;
	}

	public int getIdGradoAcademico() {
		return idGradoAcademico;
	}

	public void setIdGradoAcademico(int idGradoAcademico) {
		this.idGradoAcademico = idGradoAcademico;
	}

	public Date getUltima_Modificacion() {
		return Ultima_Modificacion;
	}

	public void setUltima_Modificacion(Date ultima_Modificacion) {
		Ultima_Modificacion = ultima_Modificacion;
	}

	public int getEstado() {
		return Estado;
	}

	public void setEstado(int estado) {
		Estado = estado;
	}
	public String getNombre_GradoAcad() {
		return Nombre_GradoAcad;
	}

	public void setNombre_GradoAcad(String nombre_GradoAcad) {
		Nombre_GradoAcad = nombre_GradoAcad;
	}
}
