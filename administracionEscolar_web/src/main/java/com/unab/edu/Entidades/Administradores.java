package com.unab.edu.Entidades;

import java.util.Date;

public class Administradores extends Persona{

	protected int idAdministrador;
	protected String Correo_Electronico;
	protected String Pass;
	protected Date admUltima_Modificacion;
	protected int admEstado;
	
	public int getIdAdministrador() {
		return idAdministrador;
	}
	public void setIdAdministrador(int idAdministrador) {
		this.idAdministrador = idAdministrador;
	}
	public String getCorreo_Electronico() {
		return Correo_Electronico;
	}
	public void setCorreo_Electronico(String correo_Electronico) {
		Correo_Electronico = correo_Electronico;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	public Date getAdmUltima_Modificacion() {
		return admUltima_Modificacion;
	}
	public void setAdmUltima_Modificacion(Date admUltima_Modificacion) {
		this.admUltima_Modificacion = admUltima_Modificacion;
	}
	public int getAdmEstado() {
		return admEstado;
	}
	public void setAdmEstado(int admEstado) {
		this.admEstado = admEstado;
	}
}
