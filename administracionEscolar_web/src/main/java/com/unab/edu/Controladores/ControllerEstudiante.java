package com.unab.edu.Controladores;

import java.io.IOException;
import java.sql.CallableStatement;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.Entidades.Estudiante;

/**
 * Servlet implementation class ControllerEstudiante
 */
public class ControllerEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerEstudiante() {
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
		String Id2 = request.getParameter("Id2");	
		String Correo_Electronico = request.getParameter("Correo_Electronico");
		String Pass = request.getParameter("Pass");
		String Nombre_GradoAcad = request.getParameter("Nombre_GradoAcad");
		
		
		Estudiante estudiante = new Estudiante();
		CLSEstudiante clsEstudiante = new CLSEstudiante();

		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				estudiante.setIdEstudiante(Integer.parseInt(Id));
				clsEstudiante.BorrarEstudiante(estudiante);
				response.sendRedirect("Estudiante.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
						

			estudiante.setIdPersona(Integer.parseInt(Id2));
			estudiante.setCorreo_Electronico(Correo_Electronico);
			estudiante.setPass(Pass);
			estudiante.setNombre_GradoAcad(Nombre_GradoAcad);		
			estudiante.setEstUltima_Modificacion(date);
			estudiante.setEstEstado(1);
			
			System.out.println(Id);
			System.out.println(Id2);
			
			if(Id == "" || Id == null || Id2 == "" || Id2 == null) {
				
				clsEstudiante.AgregarEstudiante(estudiante);
				response.sendRedirect("Estudiante.jsp");
			}
			else {
				estudiante.setIdEstudiante(Integer.parseInt(Id));
				estudiante.setIdPersona(Integer.parseInt(Id2));			
				clsEstudiante.ActualizarEstudiante(estudiante);
				response.sendRedirect("Estudiante.jsp");
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
		CLSEstudiante clsestudiante = new CLSEstudiante();

		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsestudiante.JoinEstudiante()));
		
	}

}
