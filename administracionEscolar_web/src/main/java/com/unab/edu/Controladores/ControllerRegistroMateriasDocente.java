package com.unab.edu.Controladores;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSDocente;
import com.unab.edu.DAO.CLSMateria;
import com.unab.edu.DAO.CLSNotas;
import com.unab.edu.Entidades.Materia;
import com.unab.edu.Entidades.Notas;

/**
 * Servlet implementation class ControllerRegistroMateriasDocente
 */
public class ControllerRegistroMateriasDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerRegistroMateriasDocente() {
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
		HttpSession sesion = (HttpSession) request.getSession();
		String email = String.valueOf(sesion.getAttribute("correo"));
		String password = String.valueOf(sesion.getAttribute("pass"));

		CLSNotas clsNotas = new CLSNotas();
		CLSDocente clsdocente = new CLSDocente();

		var enviarIdDocente = clsdocente.RetornoIdDocente(email, password);

		if (clsNotas.Verificar_Materias(enviarIdDocente) == true) {

			System.out.println("¡Usted ya no puede inscribir materias!");
			//Si ya tiene materias inscritas, lo devuelve al mismo jsp
			response.sendRedirect("RegistroMateriasDocente.jsp");
		} else {

			Notas notas = new Notas();
			String idMateria[] = request.getParameterValues("idMateria");

			for (int i = 0; i < idMateria.length; i++) {
				System.out.println("idMateria: " + (idMateria[i]));
				
				int idMateriaC = Integer.parseInt(idMateria[i]);
				notas.setIdEstudiante(enviarIdDocente);
				notas.setIdMateria(idMateriaC);
				notas.setPeriodo1(0);
				notas.setPeriodo2(0);
				notas.setPeriodo3(0);
				notas.setNotaFinal(0);
				notas.setRecuperacion(0);
				notas.setUltima_Modificacion(date);
				notas.setEstado(1);

				clsNotas.AgregarNotas(notas);
				
			}
			
			//Al momento de inscribir materias correctamente, es enviado al de notas.
			response.sendRedirect("DashboardDocente.jsp");
		}
	
	
	
	
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

		CLSMateria clsMateria = new CLSMateria();
		CLSDocente clsDocente = new CLSDocente();
		
		Materia materia = new Materia();

		var enviarIdGrado = clsDocente.RetornoIdDocente(email, password);
		System.out.println(enviarIdGrado);

		materia.setIdGradoAcademico(enviarIdGrado);
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsMateria.MostrarMateria()));
	}

}
