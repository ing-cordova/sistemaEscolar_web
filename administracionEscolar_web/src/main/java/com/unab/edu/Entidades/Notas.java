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
public class Notas extends Materia {
	protected int idNota;
	protected int idEstudiante;
	protected String Correo_Electronico;
	protected double Periodo1;
	protected double Periodo2;
	protected double Periodo3;
	protected double NotaFinal;
	protected double Recuperacion;
	protected Date ntUltima_Modificacion;
	protected int ntEstado;

	public int getIdNota() {
		return idNota;
	}

	public void setIdNota(int idNota) {
		this.idNota = idNota;
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

	public double getPeriodo1() {
		return Periodo1;
	}

	public void setPeriodo1(double periodo1) {
		Periodo1 = periodo1;
	}

	public double getPeriodo2() {
		return Periodo2;
	}

	public void setPeriodo2(double periodo2) {
		Periodo2 = periodo2;
	}

	public double getPeriodo3() {
		return Periodo3;
	}

	public void setPeriodo3(double periodo3) {
		Periodo3 = periodo3;
	}

	public double getNotaFinal() {
		return NotaFinal;
	}

	public void setNotaFinal(double notaFinal) {
		NotaFinal = notaFinal;
	}

	public double getRecuperacion() {
		return Recuperacion;
	}

	public void setRecuperacion(double recuperacion) {
		Recuperacion = recuperacion;
	}

	public Date getNtUltima_Modificacion() {
		return ntUltima_Modificacion;
	}

	public void setNtUltima_Modificacion(Date ntUltima_Modificacion) {
		this.ntUltima_Modificacion = ntUltima_Modificacion;
	}

	public int getNtEstado() {
		return ntEstado;
	}

	public void setNtEstado(int ntEstado) {
		this.ntEstado = ntEstado;
	}


}
