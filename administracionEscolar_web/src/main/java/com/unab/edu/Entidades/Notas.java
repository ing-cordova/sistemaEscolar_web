/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.Entidades;

import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author BetoCalderon
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class Notas extends Materia{
    protected int idNota;
    protected int idEstudiante;
    protected String Correo_Electronico;
    protected double Periodo1;
    protected double Periodo2;
    protected double Periodo3;  
    protected double NotaFinal;
    protected double Recuperacion;
    protected Date Ultima_Modificacion;
    protected int Estado;
    
}
