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
public class Docente extends Persona {
	protected int idDocente;
	protected String Correo_Electronico;
	protected String Pass;
	protected String Especialidad;
	protected Date docUltima_Modificacion;
	protected int docEstado;

	public int getIdDocente() {
		return idDocente;
	}

	public void setIdDocente(int idDocente) {
		this.idDocente = idDocente;
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

	public String getEspecialidad() {
		return Especialidad;
	}

	public void setEspecialidad(String especialidad) {
		Especialidad = especialidad;
	}

	public Date getDocUltima_Modificacion() {
		return docUltima_Modificacion;
	}

	public void setDocUltima_Modificacion(Date docUltima_Modificacion) {
		this.docUltima_Modificacion = docUltima_Modificacion;
	}

	public int getDocEstado() {
		return docEstado;
	}

	public void setDocEstado(int docEstado) {
		this.docEstado = docEstado;
	}
}
