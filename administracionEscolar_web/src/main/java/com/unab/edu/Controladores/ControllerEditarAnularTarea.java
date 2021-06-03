package com.unab.edu.Controladores;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.unab.edu.DAO.CLSActividades_Alumno;
import com.unab.edu.Entidades.Actividades_Estudiantes;

/**
 * Servlet implementation class ControllerEditarAnularTarea
 */
@MultipartConfig
public class ControllerEditarAnularTarea extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerEditarAnularTarea() {
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
		Date date = new Date();
		String AnularEnvio = request.getParameter("btne");

		String idActividad = request.getParameter("vaIdActividad");
		String idEstudiante = request.getParameter("vaIdEstudiante");
		String EstadoActividad = request.getParameter("vaEstadoActividad");

		CLSActividades_Alumno clsActs = new CLSActividades_Alumno();

		if (AnularEnvio.equals("Anular")) {
			if (EstadoActividad.equals("Calificada")) {
				System.out.println("¡Ya no puedes anular el envío, ya que ya fué calificada!");
				response.sendRedirect("VerActividades.jsp");
			} else {

				Actividades_Estudiantes acts = new Actividades_Estudiantes();
				acts.setIdEstudiante(Integer.parseInt(idEstudiante));
				acts.setIdActividadEstudiante(Integer.parseInt(idActividad));
				clsActs.Anular_Envio(acts);
				response.sendRedirect("VerActividades.jsp");
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

		String idActividad = request.getParameter("vaIdActividad");
		String idEstudiante = request.getParameter("vaIdEstudiante");
		String EstadoActividad = request.getParameter("vaEstadoAct");
		Date date = new Date();

		Part archivo = request.getPart("archivoAgain");
		// Obteniendo el nombre del archivo especificado por el cliente
		String nombrePDF = archivo.getSubmittedFileName();

		//String ruta = "C:\\Users\\andre\\Documents\\GitHub\\sistemaEscolar_web\\administracionEscolar_web\\src\\main\\webapp\\FilesPDF\\"
		String ruta = "C:\\Users\\PC\\Documents\\GitHub\\sistemaEscolar_web\\administracionEscolar_web\\src\\main\\webapp\\FilesPDF\\"
				+ nombrePDF;

		CLSActividades_Alumno clsAct_Almuno = new CLSActividades_Alumno();
		Actividades_Estudiantes act_est = new Actividades_Estudiantes();

		if (!EstadoActividad.equals("Calificada")) {
			try {
				FileOutputStream fileoutput = new FileOutputStream(ruta);
				// Obteniendo y recreando los bytes
				InputStream stream = archivo.getInputStream();

				byte[] datos = new byte[stream.available()];
				stream.read(datos);
				fileoutput.write(datos);
				fileoutput.close();
			} catch (Exception e) {
				// TODO: handle exception
			}

			act_est.setIdActividadEstudiante(Integer.parseInt(idActividad));
			act_est.setIdEstudiante(Integer.parseInt(idEstudiante));
			act_est.setArchivo(nombrePDF);
			act_est.setAcEsUltima_Modificacion(date);

			clsAct_Almuno.Reenviar_Actividad(act_est);
			response.sendRedirect("VerActividades.jsp");

		} else {
			System.out.println("¡La tarea ya ha sido calificada!");
			response.sendRedirect("VerActividades.jsp");
		}
	}

}
