/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.Entidades;

import java.util.Date;
import lombok.*;

/**
 *
 * @author BetoCalderon
 */
@Data
public class Persona extends Grados_Academicos{
    protected int idPersona;
    protected String Nombre;
    protected String Apellido;
    protected String Sexo; 
    protected String DUI;
    protected String NIT;
    protected Date Fecha_Nacimiento;
    protected Date Ultima_Modificacion;
    protected int Estado;
}
