package com.unab.edu.Controladores;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSDocente;
import com.unab.edu.DAO.CLSPersona;
import com.unab.edu.Entidades.Docente;
import com.unab.edu.Entidades.Persona;

/**
 * Servlet implementation class ControllerDocente
 */
public class ControllerDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerDocente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());		
		
		Date date = new Date();
		CLSPersona clsPersona = new CLSPersona();
		CLSDocente clsDoce = new CLSDocente();
		
		Persona persona = new Persona();
		Docente Doce = new Docente();		
		
		String Evaluar = request.getParameter("Eliminar");
		String Agregar = request.getParameter("Guardar");

		String Id = request.getParameter("Id");
		String Id2 = request.getParameter("Id2");	
		String Correo_Electronico = request.getParameter("Correo_Electronico");
		String Pass = request.getParameter("Pass");
		String Especialidad = request.getParameter("Especialidad");
		
		String Nombres = request.getParameter("nombres");
		String Apellidos = request.getParameter("apellidos");
		String Sexo = request.getParameter("sexo");
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
		String FechaNacimiento = request.getParameter("birthdate");
		Date fecha = null;
		try {
			fecha = formatoDelTexto.parse(FechaNacimiento);
		} catch (Exception e) {
			// TODO: handle exception
		}
		String Dui = request.getParameter("Dui");
		String Nit = request.getParameter("Nit");
		int ultimo = clsPersona.RetornoLastID() + 1;

		
		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				Doce.setIdDocente(Integer.parseInt(Id));
				clsDoce.BorrarDocente(Doce);
				response.sendRedirect("Docente.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
			
			persona.setNombre(Nombres);
			persona.setApellido(Apellidos);
			persona.setSexo(Sexo);
			persona.setDUI(Dui);
			persona.setNIT(Nit);
			persona.setFecha_Nacimiento(fecha);
			persona.setUltima_Modificacion(date);
			persona.setEstado(1);
			
			Doce.setCorreo_Electronico(Correo_Electronico);
			Doce.setPass(Pass);
			Doce.setEspecialidad(Especialidad);
			Doce.setIdPersona(ultimo);
			Doce.setDocUltima_Modificacion(date);
			Doce.setDocEstado(1);
			
			System.out.println(Id);
			System.out.println(Id2);
			
			if(Id2 == "" || Id2 == null || Id == "" || Id == null) {
				
				
				clsPersona.AgregarPersona(persona);
				clsDoce.AgregarDocente(Doce);
				System.out.println(ultimo);
				response.sendRedirect("Docente.jsp");
			}
			else {
				persona.setIdPersona(Integer.parseInt(Id2));
				clsPersona.ActualizarPersona(persona);
				
				Doce.setIdDocente(Integer.parseInt(Id));
				Doce.setIdPersona(Integer.parseInt(Id2));
				clsDoce.ActualizarDocente(Doce);
				response.sendRedirect("Docente.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Gson json = new Gson();	
		CLSDocente clsDoc= new CLSDocente();	
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsDoc.JoinDocentes()));
	}

}
