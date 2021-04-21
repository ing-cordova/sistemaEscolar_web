package com.unab.edu.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unab.edu.Negocio.clsLogin;

/**
 * Servlet implementation class ControllerLogin
 */
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		clsLogin login = new clsLogin();
		
		int access = login.TipoUsuario(email, password);
		
		if(access == 1) {
			response.sendRedirect("Estudiante.jsp");
			System.out.println("> Usted es un Estudiante.");
		}
		else if(access == 2) {
			response.sendRedirect("Docente.jsp");
			System.out.println("> Usted es un Docente.");
		}
		else {
			response.sendRedirect("Error.jsp");
			System.out.println("> Lo sentimos, ha ocurrido un error.");
		}
	}

}
