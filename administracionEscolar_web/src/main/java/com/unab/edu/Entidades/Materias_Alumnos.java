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
public class Materias_Alumnos {
    protected int idMateriaAlumno;
    protected int idEstudiante;
    protected int idMateria;
    protected Date Ultima_Modificacion;
    protected int Estado;
    
	public int getIdMateriaAlumno() {
		return idMateriaAlumno;
	}
	public void setIdMateriaAlumno(int idMateriaAlumno) {
		this.idMateriaAlumno = idMateriaAlumno;
	}
	public int getIdEstudiante() {
		return idEstudiante;
	}
	public void setIdEstudiante(int idEstudiante) {
		this.idEstudiante = idEstudiante;
	}
	public int getIdMateria() {
		return idMateria;
	}
	public void setIdMateria(int idMateria) {
		this.idMateria = idMateria;
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
