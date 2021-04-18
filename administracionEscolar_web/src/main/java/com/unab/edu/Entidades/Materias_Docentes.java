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
public class Materias_Docentes extends Materia {
	protected int idMateriaDocente;
	protected int idDocente;
	protected Date Ultima_Modificacion;
	protected int Estado;

	public int getIdMateriaDocente() {
		return idMateriaDocente;
	}

	public void setIdMateriaDocente(int idMateriaDocente) {
		this.idMateriaDocente = idMateriaDocente;
	}

	public int getIdDocente() {
		return idDocente;
	}

	public void setIdDocente(int idDocente) {
		this.idDocente = idDocente;
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
