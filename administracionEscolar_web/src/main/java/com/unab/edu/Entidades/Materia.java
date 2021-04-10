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
@EqualsAndHashCode(callSuper=false)
public class Materia extends Grados_Academicos {
    private int idMateria;
    private String Nombre_Materia;
    protected Date Ultima_Modificacion;
    protected int Estado;
}
