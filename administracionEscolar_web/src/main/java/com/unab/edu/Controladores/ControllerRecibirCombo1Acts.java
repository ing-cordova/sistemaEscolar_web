package com.unab.edu.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSActividades;
import com.unab.edu.Entidades.Actividades;

/**
 * Servlet implementation class ControllerRecibirCombo1Acts
 */
public class ControllerRecibirCombo1Acts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerRecibirCombo1Acts() {
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
		String combo1 = request.getParameter("combo1");
		System.out.println("IdCombo1 por AJAX: " + combo1);
		
		CLSActividades clsActs = new CLSActividades();
        Actividades m = new Actividades();
        m.setIdMateria(Integer.parseInt(combo1));
        
        response.setCharacterEncoding("UTF8");
        response.getWriter().append(json.toJson(clsActs.Mostrar_Tareas_By_Materia(m)));
	}

}
