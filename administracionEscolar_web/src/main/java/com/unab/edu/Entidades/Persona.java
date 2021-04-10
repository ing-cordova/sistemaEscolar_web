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
public class Persona extends Grados_Academicos {
	protected int idPersona;
	protected String Nombre;
	protected String Apellido;
	protected String Sexo;
	protected String DUI;
	protected String NIT;
	protected Date Fecha_Nacimiento;
	protected Date Ultima_Modificacion;
	protected int Estado;

	public int getIdPersona() {
		return idPersona;
	}

	public void setIdPersona(int idPersona) {
		this.idPersona = idPersona;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getApellido() {
		return Apellido;
	}

	public void setApellido(String apellido) {
		Apellido = apellido;
	}

	public String getSexo() {
		return Sexo;
	}

	public void setSexo(String sexo) {
		Sexo = sexo;
	}

	public String getDUI() {
		return DUI;
	}

	public void setDUI(String dUI) {
		DUI = dUI;
	}

	public String getNIT() {
		return NIT;
	}

	public void setNIT(String nIT) {
		NIT = nIT;
	}

	public Date getFecha_Nacimiento() {
		return Fecha_Nacimiento;
	}

	public void setFecha_Nacimiento(Date fecha_Nacimiento) {
		Fecha_Nacimiento = fecha_Nacimiento;
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
