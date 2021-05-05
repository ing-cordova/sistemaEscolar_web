package com.unab.edu.Controladores;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSDocente;
import com.unab.edu.Entidades.Docente;

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
		String Evaluar = request.getParameter("Eliminar");
		String Agregar = request.getParameter("Guardar");

		String Id = request.getParameter("Id");
		String Id2 = request.getParameter("Id2");	
		String Correo_Electronico = request.getParameter("Correo_Electronico");
		String Pass = request.getParameter("Pass");
		String Especialidad = request.getParameter("Especialidad");

		Docente Doce = new Docente();
		CLSDocente clsDoce = new CLSDocente();

		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				Doce.setIdDocente(Integer.parseInt(Id));
				clsDoce.BorrarDocente(Doce);
				response.sendRedirect("Docente.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
			Doce.setIdPersona(Integer.parseInt(Id2));
			Doce.setCorreo_Electronico(Correo_Electronico);
			Doce.setPass(Pass);
			Doce.setEspecialidad(Especialidad);		
			Doce.setDocUltima_Modificacion(date);
			Doce.setDocEstado(1);
			
			System.out.println(Id);
			System.out.println(Id2);
			
			if(Id == "" || Id == null || Id2 == "" || Id2 == null) {
				
				clsDoce.AgregarDocente(Doce);
				response.sendRedirect("Docente.jsp");
			}
			else {
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
