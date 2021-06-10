package com.unab.edu.Controladores;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.DAO.CLSGradoAcademico;
import com.unab.edu.DAO.CLSPersona;
import com.unab.edu.Entidades.Administradores;
import com.unab.edu.Entidades.Estudiante;
import com.unab.edu.Entidades.Persona;

/**
 * Servlet implementation class ControllerRegistroEstudiante
 */
public class ControllerRegistroEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerRegistroEstudiante() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Gson json = new Gson();
		Date date = new Date();
		CLSPersona clsPersona = new CLSPersona();
		CLSEstudiante clsEstudiante = new CLSEstudiante();
		
		Persona persona = new Persona();
		Estudiante estudiante = new Estudiante();
		
		String Nombres = request.getParameter("nombres2");
		String Apellidos = request.getParameter("apellidos2");
		String Sexo = request.getParameter("sexo");
		String GradoAcademico = request.getParameter("carreras");
		String FechaNacimiento = request.getParameter("birthdate");
		
		String DUI = request.getParameter("dui2");
		String NIT = request.getParameter("nit2");
		String EMAIL = request.getParameter("email2");
		String Password = request.getParameter("pass2");
		int ultimo = clsPersona.RetornoLastID() + 1;

		var validarcorreo = clsEstudiante.EmailValidate(EMAIL);
		System.out.println("=> ¿Encontraste el email? R//" + validarcorreo);
		
		String mensaje = ""; 
		try {
			if(validarcorreo == true){
				mensaje = "existeemail";
				response.getWriter().append(json.toJson(mensaje));
			}
			else{
				persona.setNombre(Nombres);
				persona.setApellido(Apellidos);
				persona.setSexo(Sexo);
				persona.setDUI(DUI);
				persona.setNIT(NIT);
				persona.setFecha_Nacimiento(String.valueOf(FechaNacimiento));
				persona.setUltima_Modificacion(date);
				persona.setEstado(1);
				clsPersona.AgregarPersona(persona);
				
				estudiante.setCorreo_Electronico(EMAIL);
				estudiante.setPass(Password);
				estudiante.setIdPersona(ultimo);
				estudiante.setIdGradoAcademico(Integer.parseInt(GradoAcademico));
				estudiante.setEstUltima_Modificacion(date);
				estudiante.setEstEstado(1);
				mensaje = "Registrado";
				response.getWriter().append(json.toJson(mensaje));
				clsEstudiante.AgregarEstudiante(estudiante);
				System.out.println(ultimo);
			}
		} catch (Exception e) {
			mensaje = "Error";
			response.getWriter().append(json.toJson(mensaje));
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Gson json = new Gson();
		
		CLSGradoAcademico clsGrado = new CLSGradoAcademico();
		
		response.setCharacterEncoding("UTF8");
	    response.getWriter().append(json.toJson(clsGrado.MostrarGradoAcademico()));
	}

}
