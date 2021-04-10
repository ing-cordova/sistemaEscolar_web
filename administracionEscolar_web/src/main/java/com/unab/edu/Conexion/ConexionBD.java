/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unab.edu.Conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author patty
 */
public class ConexionBD {

    private Connection coon;

    public ConexionBD() {
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            coon = DriverManager.getConnection("jdbc:mysql://localhost/administracionescolar", "root", "root");
            System.out.println("> Conexión establecida con éxito.");

        } catch (Exception e) {
            System.out.println("> Error en la Conexión." + e);
        }
    }

    public Connection RetornarConexion() {
        return coon;
    }

}
