package com.unab.edu.Controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.unab.edu.DAO.CLSAdministrador;
import com.unab.edu.DAO.CLSDocente;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.Entidades.Administradores;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		HttpSession session = request.getSession(true);
		String error = request.getParameter("error");
		String dashboard = request.getParameter("salir");
		
		if (error != null || dashboard != null) {
			response.sendRedirect("index.jsp");
			session.invalidate();
		} else {
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String fullname = "";
			String fullnameEst = "";
			String fullnameDoc = "";
			
			CLSAdministrador clsAdmin  = new CLSAdministrador();
			CLSEstudiante clsEst = new CLSEstudiante();
			CLSDocente clsDoc = new CLSDocente();
			
			clsLogin login = new clsLogin();
			Administradores admin = new Administradores();
			admin.setCorreo_Electronico(email);
			admin.setPass(password);
			
			fullname = clsAdmin.MostrarAdministrador(admin);
			fullnameEst = clsEst.RetornoFullName(email, password);
			fullnameDoc = clsDoc.RetornoFullName(email, password);
			
			int access = login.TipoUsuario(email, password);

			if (access == 1) {
				//response.sendRedirect("Estudiante.jsp");
				response.sendRedirect("DashboardEstudiante.jsp");
				session.setAttribute("dashboardEst", access);
				session.setAttribute("fullnameEst", fullnameEst);
				System.out.println("> Usted es un Estudiante.");
			} else if (access == 2) {
				//response.sendRedirect("Docente.jsp");
				response.sendRedirect("DashboardDocente.jsp");
				session.setAttribute("dashboardDoc", access);
				session.setAttribute("fullnameDoc", fullnameDoc);
				System.out.println("> Usted es un Docente.");
			} else if (access == 3) {
				response.sendRedirect("Administrador.jsp");
				session.setAttribute("dashboard", access);
				session.setAttribute("fullname", fullname);
				System.out.println("> Usted es un Administrador.");
			} else {
				response.sendRedirect("Error.jsp");
				session.setAttribute("errorLogin", access);
				System.out.println("> Lo sentimos, ha ocurrido un error.");
			}
		}

	}

}
