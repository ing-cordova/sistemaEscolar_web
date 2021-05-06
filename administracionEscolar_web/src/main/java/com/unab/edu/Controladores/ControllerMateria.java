package com.unab.edu.Controladores;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSMateria;
import com.unab.edu.Entidades.Materia;

/**
 * Servlet implementation class ControllerMateria
 */
public class ControllerMateria extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerMateria() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Date date = new Date();
		String Evaluar = request.getParameter("Eliminar");
		String Agregar = request.getParameter("Guardar");

		String Id = request.getParameter("Id");
		String Materia = request.getParameter("Materia");
		String GradoAcad = request.getParameter("GradoAcad");
		String IdGrado = request.getParameter("IdGrado");

		Materia materia = new Materia();
		CLSMateria clsMateria = new CLSMateria();

		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				materia.setIdMateria(Integer.parseInt(Id));
				clsMateria.BorrarMateria(materia);
				response.sendRedirect("Materia.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
			
			materia.setIdGradoAcademico(Integer.parseInt(GradoAcad));
			materia.setNombre_Materia(Materia);
			materia.setUltima_Modificacion(date);
			materia.setEstado(1);
			
			System.out.println(Id);
			
			if(Id == "" || Id == null) {
				
				clsMateria.AgregarMateria(materia);
				response.sendRedirect("Materia.jsp");
			}
			else {
				materia.setIdMateria(Integer.parseInt(Id));
				clsMateria.ActualizarMateria(materia);
				response.sendRedirect("Materia.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		Gson json = new Gson();
		CLSMateria clsMateria = new CLSMateria();
		
		String combo = request.getParameter("GradoAcad");
		System.out.println(combo);
		
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsMateria.MostrarTodasMateria()));
		
	}

}
