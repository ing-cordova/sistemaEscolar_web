package com.unab.edu.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.DAO.CLSNotas;
import com.unab.edu.Entidades.Notas;

/**
 * Servlet implementation class ControllerNotasEstudiante
 */
public class ControllerNotasEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerNotasEstudiante() {
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
		
		HttpSession sesion = (HttpSession) request.getSession();
		
		String email = String.valueOf(sesion.getAttribute("correo"));
		String password = String.valueOf(sesion.getAttribute("pass"));
		
		CLSEstudiante clsEstudiante = new CLSEstudiante();
		CLSNotas clsNotas = new CLSNotas();
		
		//Obteniendo idEstudiante
		var enviarIdEstudiante = clsEstudiante.RetornoIdEstudiante(email, password);
		System.out.println(enviarIdEstudiante);
		
		//Seteando idEstudiante
		Notas nota = new Notas();
		nota.setIdEstudiante(enviarIdEstudiante);
		
		//Enviando hacia el Front
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsNotas.MostrarNotaByStudente(nota)));
	}

}
