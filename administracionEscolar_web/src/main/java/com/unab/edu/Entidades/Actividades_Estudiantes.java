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
public class Actividades_Estudiantes extends Actividades {
	protected int idActividadEstudiante;
	protected int idEstudiante;
	protected String Correo_Electronico;
	protected int idMateria;
	protected double Nota_Obtenida;
	protected byte[] Archivo;
	protected Date Ultima_Modificacion;
	protected int Estado;

	public int getIdActividadEstudiante() {
		return idActividadEstudiante;
	}

	public void setIdActividadEstudiante(int idActividadEstudiante) {
		this.idActividadEstudiante = idActividadEstudiante;
	}

	public int getIdEstudiante() {
		return idEstudiante;
	}

	public void setIdEstudiante(int idEstudiante) {
		this.idEstudiante = idEstudiante;
	}

	public String getCorreo_Electronico() {
		return Correo_Electronico;
	}

	public void setCorreo_Electronico(String correo_Electronico) {
		Correo_Electronico = correo_Electronico;
	}

	public int getIdMateria() {
		return idMateria;
	}

	public void setIdMateria(int idMateria) {
		this.idMateria = idMateria;
	}

	public double getNota_Obtenida() {
		return Nota_Obtenida;
	}

	public void setNota_Obtenida(double nota_Obtenida) {
		Nota_Obtenida = nota_Obtenida;
	}

	public byte[] getArchivo() {
		return Archivo;
	}

	public void setArchivo(byte[] archivo) {
		Archivo = archivo;
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
