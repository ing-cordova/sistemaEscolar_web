package com.unab.edu.Controladores;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.unab.edu.DAO.CLSPersona;

import com.unab.edu.Entidades.Persona;


/**
 * Servlet implementation class ControllerPersona
 */
public class ControllerPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPersona() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Date date = new Date();
		String Evaluar = request.getParameter("Eliminar");
		String Agregar = request.getParameter("Guardar");

		String Id = request.getParameter("Id");
		String Persona = request.getParameter("Persona");
		String Apellido = request.getParameter("Apellido");
		String Sexo = request.getParameter("Sexo");
		String DUI = request.getParameter("DUI");
		String NIT = request.getParameter("NIT");
		String Fecha_Nacimiento = request.getParameter("Fecha_Nacimiento");
		
		
		/*response.getWriter().append(json.toJson(Fecha_Nacimiento));
		
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
		
		Date fecha = null;
		try {
			fecha = formatoDelTexto.parse(Fecha_Nacimiento);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		*/

		Persona per = new Persona();
		CLSPersona clsper = new CLSPersona();

		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				per.setIdPersona(Integer.parseInt(Id));
				clsper.BorrarPersona(per);
				response.sendRedirect("Persona.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
			
			per.setNombre(Persona);
			per.setApellido(Apellido);
			per.setSexo(Sexo);
			per.setDUI(DUI);
			per.setNIT(NIT);
			per.setFecha_Nacimiento(Fecha_Nacimiento);
			per.setUltima_Modificacion(date);
			per.setEstado(1);
			
			System.out.println(Id);
			
			if(Id == "" || Id == null) {
				
				clsper.AgregarPersona(per);
				response.sendRedirect("Persona.jsp");
			}
			else {
				per.setIdPersona(Integer.parseInt(Id));
				clsper.ActualizarPersona(per);
				response.sendRedirect("Persona.jsp");
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
		CLSPersona clsPersona = new CLSPersona();
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsPersona.MostrarPersona()));
	}

}
