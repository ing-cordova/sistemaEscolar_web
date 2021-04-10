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
public class Materia extends Grados_Academicos {
	private int idMateria;
	private String Nombre_Materia;
	protected Date Ultima_Modificacion;
	protected int Estado;

	public int getIdMateria() {
		return idMateria;
	}

	public void setIdMateria(int idMateria) {
		this.idMateria = idMateria;
	}

	public String getNombre_Materia() {
		return Nombre_Materia;
	}

	public void setNombre_Materia(String nombre_Materia) {
		Nombre_Materia = nombre_Materia;
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
