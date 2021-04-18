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
public class Grados_Academicos {
	protected int idGradoAcademico;
	protected String Nombre_GradoAcad;
	protected Date Ultima_Modificacion;
	protected int Estado;

	public int getIdGradoAcademico() {
		return idGradoAcademico;
	}

	public void setIdGradoAcademico(int idGradoAcademico) {
		this.idGradoAcademico = idGradoAcademico;
	}

	public String getNombre_GradoAcad() {
		return Nombre_GradoAcad;
	}

	public void setNombre_GradoAcad(String nombre_GradoAcad) {
		Nombre_GradoAcad = nombre_GradoAcad;
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
}
