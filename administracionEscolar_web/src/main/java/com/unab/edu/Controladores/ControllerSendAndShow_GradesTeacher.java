package com.unab.edu.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSMateriaDocente;
import com.unab.edu.DAO.CLSNotas;
import com.unab.edu.Entidades.Materias_Docentes;
import com.unab.edu.Entidades.Notas;

/**
 * Servlet implementation class ControllerSendAndShow_GradesTeacher
 */
public class ControllerSendAndShow_GradesTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerSendAndShow_GradesTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Gson json = new Gson();
		String capturarID = request.getParameter("comboID");
		System.out.println("IdMateria por AJAX: " + capturarID);
		
		CLSNotas clsNotas = new CLSNotas();
		Notas nota = new Notas();
		nota.setIdMateria(Integer.parseInt(capturarID));
		
		var datos = clsNotas.NOTAS_PUBLICADAS(nota);
		for(var iterar : datos) {
			System.out.println(iterar.getIdNota());
		}
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsNotas.NOTAS_PUBLICADAS(nota)));
	}

}
