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
public class Materias_Docentes extends Materia{
    protected int idMateriaDocente;
    protected int idDocente;
    protected Date Ultima_Modificacion;
    protected int Estado;
}
