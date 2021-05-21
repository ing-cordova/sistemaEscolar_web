package com.unab.edu.Controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSDocente;
import com.unab.edu.DAO.CLSMateriaDocente;
import com.unab.edu.Entidades.Materias_Docentes;

/**
 * Servlet implementation class ControllerPublicarNotas
 */
public class ControllerPublicarNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicarNotas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Gson json = new Gson();
		CLSMateriaDocente clsMateria = new CLSMateriaDocente();
		
        Materias_Docentes m = new Materias_Docentes();   
        System.out.println("IdDocente: " + ControllerLogin.envioIdDocenteeeee);
        
        m.setIdDocente(ControllerLogin.envioIdDocenteeeee);
        response.setCharacterEncoding("UTF8");
        response.getWriter().append(json.toJson(clsMateria.ShowMateriasByDocente(m)));
	}

}
