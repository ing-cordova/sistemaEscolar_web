package com.unab.edu.Controladores;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSMateriaDocente;
import com.unab.edu.DAO.CLSNotas;
import com.unab.edu.Entidades.Materias_Docentes;
import com.unab.edu.Entidades.Notas;

/**
 * Servlet implementation class ControllerPublicarNotas
 */
public class ControllerPublicarNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerPublicarNotas() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession(true);

		String idNota = request.getParameter("idNotaaa");
		String idEstudiante = request.getParameter("idEstudianteeee");
		String Email = request.getParameter("correoo");
		String p1 = request.getParameter("p1");
		String p2 = request.getParameter("p2");
		String p3 = request.getParameter("p3");
		String pfinal = request.getParameter("pfinal");
		String pRepo = request.getParameter("pRepo");

		int validarGuardado = 0;

		if (idNota == null || idNota == "") {
			
			response.sendRedirect("PublicarNotas.jsp");
		}
		else {
			if (p1.isEmpty() || p1 == null || p2.isEmpty() || p2 == null || p3.isEmpty() || p3 == null) {
				validarGuardado = 1;
				System.out.println("No se permite el ingreso de campos vacíos : " + validarGuardado);
				response.sendRedirect("PublicarNotas.jsp");
			} else {
				Date date = new Date();
				int idNotaC = Integer.parseInt(idNota);

				Double P1 = (Double.parseDouble(p1) * 0.33);
				Double P2 = (Double.parseDouble(p2) * 0.33);
				Double P3 = (Double.parseDouble(p3) * 0.33);
				Double REPO = (Double.parseDouble(pRepo) * 0.99);
				Double Final = P1 + P2 + P3;

				CLSNotas clsNotas = new CLSNotas();
				Notas nota = new Notas();

				if (P1 >= 0.0 && P2 >= 0.0 && P3 >= 0.0) {
					nota.setIdNota(idNotaC);
					nota.setPeriodo1(P1);
					nota.setPeriodo2(P2);
					nota.setPeriodo3(P3);
					nota.setNotaFinal(Math.round(Final));
					nota.setRecuperacion(0.00);

				} else if (P1 >= 0.0 && P2 >= 0.0 && P3 >= 0.0 || Final < 6) {
					nota.setIdNota(idNotaC);
					nota.setPeriodo1(0.00);
					nota.setPeriodo2(0.00);
					nota.setPeriodo3(0.00);
					nota.setNotaFinal(REPO);
					nota.setRecuperacion(REPO);
				}

				nota.setUltima_Modificacion(date);
				clsNotas.ActualizarNotas(nota);
				response.sendRedirect("PublicarNotas.jsp");
			}
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
		CLSMateriaDocente clsMateria = new CLSMateriaDocente();

		Materias_Docentes m = new Materias_Docentes();
		System.out.println("IdDocente: " + ControllerLogin.envioIdDocenteeeee);

		m.setIdDocente(ControllerLogin.envioIdDocenteeeee);
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsMateria.ShowMateriasByDocente(m)));
	}

}
