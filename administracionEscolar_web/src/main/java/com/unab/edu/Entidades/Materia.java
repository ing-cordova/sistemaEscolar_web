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
	protected int idMateria;
	protected String Nombre_Materia;
	protected Date mtrUltima_Modificacion;
	protected int mtrEstado;

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
	public Date getMtrUltima_Modificacion() {
		return mtrUltima_Modificacion;
	}

	public void setMtrUltima_Modificacion(Date mtrUltima_Modificacion) {
		this.mtrUltima_Modificacion = mtrUltima_Modificacion;
	}

	public int getMtrEstado() {
		return mtrEstado;
	}

	public void setMtrEstado(int mtrEstado) {
		this.mtrEstado = mtrEstado;
	}
}
