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
public class Actividades extends Materia {
	protected int idActividad;
	protected int idDocente;
	protected String Nombre_Actividad;
	protected double Porcentaje;
	protected Date Fecha_Entrega;
	protected String Estado_Actividad;
	protected Date actUltima_Modificacion;
	protected int actEstado;

	public int getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}

	public int getIdDocente() {
		return idDocente;
	}

	public void setIdDocente(int idDocente) {
		this.idDocente = idDocente;
	}

	public String getNombre_Actividad() {
		return Nombre_Actividad;
	}

	public void setNombre_Actividad(String nombre_Actividad) {
		Nombre_Actividad = nombre_Actividad;
	}

	public double getPorcentaje() {
		return Porcentaje;
	}

	public void setPorcentaje(double porcentaje) {
		Porcentaje = porcentaje;
	}

	public Date getFecha_Entrega() {
		return Fecha_Entrega;
	}

	public void setFecha_Entrega(Date fecha_Entrega) {
		Fecha_Entrega = fecha_Entrega;
	}

	public String getEstado_Actividad() {
		return Estado_Actividad;
	}

	public void setEstado_Actividad(String estado_Actividad) {
		Estado_Actividad = estado_Actividad;
	}

	public Date getActUltima_Modificacion() {
		return actUltima_Modificacion;
	}

	public void setActUltima_Modificacion(Date actUltima_Modificacion) {
		this.actUltima_Modificacion = actUltima_Modificacion;
	}

	public int getActEstado() {
		return actEstado;
	}

	public void setActEstado(int actEstado) {
		this.actEstado = actEstado;
	}
	
}
