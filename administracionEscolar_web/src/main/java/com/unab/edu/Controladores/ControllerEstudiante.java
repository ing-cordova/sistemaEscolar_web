package com.unab.edu.Controladores;

import java.io.IOException;
import java.sql.CallableStatement;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.annotations.JsonAdapter;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.DAO.CLSPersona;
import com.unab.edu.Entidades.Estudiante;
import com.unab.edu.Entidades.Persona;

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
		
		Gson json = new Gson();
		String mensaje = "";
		Date date = new Date();
		String Evaluar = request.getParameter("Eliminar");
		String Agregar = request.getParameter("Guardar");
		
		String Id = request.getParameter("Id");
		String Id2 = request.getParameter("Id2");
		
		Estudiante estudiante = new Estudiante();
		Persona persona = new Persona();
		CLSEstudiante clsEstudiante = new CLSEstudiante();
		CLSPersona clsPersona = new CLSPersona();
		
		String Nombres = request.getParameter("Nombres2");
		String Apellidos = request.getParameter("Apellidos2");
		String Email = request.getParameter("Email2");
		String Pass = request.getParameter("Pass2");
		String GradoAcad = request.getParameter("GradoAcad");
		String IdGrado = request.getParameter("IdGrado");
		String Sexo = request.getParameter("Sexo");
		String dui = request.getParameter("dui2");
		String nit = request.getParameter("nit2");
		String FechaNacimiento = request.getParameter("birthdate");
		
		
		int ultimo = clsPersona.RetornoLastID() + 1;
		var validarcorreo = clsEstudiante.EmailValidate(Email);
		System.out.println("=> ¿Encontraste el email? R//" + validarcorreo);
		
		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				estudiante.setIdEstudiante(Integer.parseInt(Id));
				
				clsEstudiante.BorrarEstudiante(estudiante);
				response.sendRedirect("Estudiante.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
			persona.setNombre(Nombres);
			persona.setApellido(Apellidos);
			persona.setSexo(Sexo);
			persona.setDUI(dui);
			persona.setNIT(nit);
			persona.setFecha_Nacimiento(FechaNacimiento);
			persona.setUltima_Modificacion(date);
			persona.setEstado(1);
			
			
			estudiante.setIdPersona(ultimo);
			estudiante.setCorreo_Electronico(Email);
			estudiante.setPass(Pass);
			estudiante.setIdGradoAcademico(Integer.parseInt(GradoAcad));
			estudiante.setEstUltima_Modificacion(date);
			estudiante.setEstEstado(1);
			
			System.out.println(Id);
			System.out.println(Id2);
			
			persona.setIdPersona(Integer.parseInt(Id2));
			clsPersona.ActualizarPersona(persona);
			
			estudiante.setIdEstudiante(Integer.parseInt(Id));
			estudiante.setIdPersona(Integer.parseInt(Id2));
			clsEstudiante.ActualizarEstudiante(estudiante);
			mensaje = "Actualizado";
			response.getWriter().append(json.toJson(mensaje));
			//response.sendRedirect("Estudiante.jsp");
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
		
		String combo = request.getParameter("GradoAcad");
		System.out.println(combo);

		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsestudiante.JoinEstudiante()));
		
	}

}
