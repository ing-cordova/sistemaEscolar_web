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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.unab.edu.DAO.CLSActividades_Alumno;
import com.unab.edu.DAO.CLSEstudiante;
import com.unab.edu.Entidades.Actividades_Estudiantes;

/**
 * Servlet implementation class ControllerEnviarArchivo
 */
@MultipartConfig
public class ControllerEnviarArchivo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerEnviarArchivo() {
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
		
		HttpSession sesion = (HttpSession) request.getSession();
		String email = String.valueOf(sesion.getAttribute("correo"));
		String password = String.valueOf(sesion.getAttribute("pass"));

		CLSEstudiante clsEstudiante = new CLSEstudiante();
		var enviarIdEstudiante = clsEstudiante.RetornoIdEstudiante(email, password);

		String IdActi = request.getParameter("IdActi");
		String NombreActi = request.getParameter("NombreActi");
		String Porcent = request.getParameter("Porcent");
		String FechaEntrega = request.getParameter("FechaEntrega");
		String EstadoActiv = request.getParameter("EstadoActiv");

		String idMateeee = request.getParameter("idMateeee");

		// Obteniendo el archivo.
		Part archivo = request.getPart("archivo");
		// Obteniendo el nombre del archivo especificado por el cliente
		String nombrePDF = archivo.getSubmittedFileName();

		String ruta = "C:\\Users\\andre\\Documents\\GitHub\\sistemaEscolar_web\\administracionEscolar_web\\src\\main\\webapp\\FilesPDF\\"
		//String ruta = "C:\\Users\\PC\\Documents\\GitHub\\sistemaEscolar_web\\administracionEscolar_web\\src\\main\\webapp\\FilesPDF\\"
		//String ruta = "C:\\Users\\orell\\OneDrive\\Documentos\\GitHub\\sistemaEscolar_web\\administracionEscolar_web\\src\\main\\webapp\\FilesPDF\\"
				+ nombrePDF;
		

		Date date = new Date();
		CLSActividades_Alumno clsAct_Almuno = new CLSActividades_Alumno();
		Actividades_Estudiantes act_est = new Actividades_Estudiantes();

		act_est.setIdEstudiante(enviarIdEstudiante);
		act_est.setIdActividad(Integer.parseInt(IdActi));
		act_est.setIdMateria(Integer.parseInt(idMateeee));
		act_est.setNota_Obtenida(0.00);
		
		act_est.setEstado_Actividad("Entregada");
		act_est.setAcEsUltima_Modificacion(date);
		act_est.setAcEsEstado(1);

		System.out.println("Hay datos: " + clsAct_Almuno.Verificar_Entrega(act_est));
		if (clsAct_Almuno.Verificar_Entrega(act_est) == true) {
			System.out.println("¡Esta actividad ya ha sido enviada!");
			response.sendRedirect("TareasEstudiante.jsp");
			
		} else {
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
			act_est.setArchivo(nombrePDF);
			clsAct_Almuno.Insertar_Actividad(act_est);
			response.sendRedirect("TareasEstudiante.jsp");
		}
	}

}
