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
	protected Date mdUltima_Modificacion;
	protected int mdEstado;

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

	public Date getMdUltima_Modificacion() {
		return mdUltima_Modificacion;
	}

	public void setMdUltima_Modificacion(Date mdUltima_Modificacion) {
		this.mdUltima_Modificacion = mdUltima_Modificacion;
	}

	public int getMdEstado() {
		return mdEstado;
	}

	public void setMdEstado(int mdEstado) {
		this.mdEstado = mdEstado;
	}


}
