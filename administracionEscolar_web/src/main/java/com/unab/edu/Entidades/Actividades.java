/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.Entidades;

import java.util.Date;
import lombok.Data;

/**
 *
 * @author BetoCalderon
 */
@Data
public class Actividades extends Materia{
    protected int idActividad;
    protected int idDocente;
    protected String Nombre_Actividad;
    protected double Porcentaje;
    protected Date Fecha_Entrega;
    protected String Estado_Actividad;
    protected Date Ultima_Modificacion;
    protected int Estado;
}
