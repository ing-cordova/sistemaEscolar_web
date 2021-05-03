package com.unab.edu.Controladores;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSGradoAcademico;
import com.unab.edu.Entidades.Grados_Academicos;

/**
 * Servlet implementation class ControllerGradoAcademico
 */
public class ControllerGradoAcademico extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerGradoAcademico() {
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

		String IdGrado = request.getParameter("IdGradoAcademico");
		String GradoAcad = request.getParameter("gradoacademico");

		Grados_Academicos grado = new Grados_Academicos();
		CLSGradoAcademico clsGrado = new CLSGradoAcademico();

		if (Evaluar != null) {
			if (Evaluar.equals("btne")) {
				grado.setIdGradoAcademico(Integer.parseInt(IdGrado));
				clsGrado.BorrarGradoAcademico(grado);
				response.sendRedirect("GradoAcademico.jsp");
			}
		}
		else if(Agregar.equals("btna")) {
			
			grado.setNombre_GradoAcad(GradoAcad);
			grado.setUltima_Modificacion(date);
			grado.setEstado(1);
			
			System.out.println(IdGrado);
			
			if(IdGrado == "" || IdGrado == null) {
				
				clsGrado.AgregarGradoAcademico(grado);
				response.sendRedirect("GradoAcademico.jsp");
			}
			else {
				grado.setIdGradoAcademico(Integer.parseInt(IdGrado));
				clsGrado.ActualizarGradoAcademico(grado);
				response.sendRedirect("GradoAcademico.jsp");
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
		CLSGradoAcademico clsGradoAcad = new CLSGradoAcademico();
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsGradoAcad.MostrarGradoAcademico()));
	}

}
