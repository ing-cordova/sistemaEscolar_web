package com.unab.edu.Controladores;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.annotations.JsonAdapter;
import com.unab.edu.DAO.CLSActividades_Alumno;
import com.unab.edu.Entidades.Actividades_Estudiantes;

/**
 * Servlet implementation class ControllerRevisarActividades
 */
public class ControllerRevisarActividades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerRevisarActividades() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Gson json = new Gson();
		String mensaje = "";
		try {
			String idActividadEstudiante = request.getParameter("ajaxIdActividadEstudiante");
			String idEstudiante = request.getParameter("ajaxIdEstudiante");
			String porentaje = request.getParameter("ajaxPorcenteje");
			String notaObtenida = request.getParameter("ajaxNota");
			
			/*System.out.println("Recibiendo dato de AJAX por idActividadEstudiante: " + idActividadEstudiante);
			System.out.println("Recibiendo dato de AJAX por idEstudiante: " + idEstudiante);
			System.out.println("Recibiendo dato de AJAX por porentaje: " + porentaje);
			System.out.println("Recibiendo dato de AJAX por notaObtenida: " + notaObtenida);*/
			
			Date date = new Date();
	        //Extraemos todos los datos de la tabla
	        Double porcent = Double.parseDouble(porentaje);
	        Double nota = Double.parseDouble(notaObtenida);
	        Double Total = (nota * porcent);
	        
	        CLSActividades_Alumno clsActividad = new CLSActividades_Alumno();
	        //Creamos un objeto de tipo Entidad ActivEstud.
	        Actividades_Estudiantes actEst = new Actividades_Estudiantes();
	        //Seteamos los parametros de la tabla.
	        actEst.setIdActividadEstudiante(Integer.parseInt(idActividadEstudiante));
	        actEst.setIdEstudiante(Integer.parseInt(idEstudiante));
	        actEst.setNota_Obtenida(Total);
	        actEst.setAcEsUltima_Modificacion(date);
	        //Transferimos los datos hacia el metodo de actualizar.
	        clsActividad.Actualizar_Actividad(actEst);
	        mensaje = "Guardado";
	        response.getWriter().append(json.toJson(mensaje));
		} catch (Exception e) {
			System.out.println("Hubo un error en ControllerRevisarAc " + e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Gson json = new Gson();
		
		String combo1 = request.getParameter("combo1");
		String combo2 = request.getParameter("combo2");
		
		System.out.println("Recibiendo IdMateria por AJAX: " + combo1);
		System.out.println("Recibiendo IdActividad por AJAX: " + combo2);
		
		CLSActividades_Alumno clsActs = new CLSActividades_Alumno();
        Actividades_Estudiantes act = new Actividades_Estudiantes();
        act.setIdMateria(Integer.parseInt(combo1));
        act.setIdActividad(Integer.parseInt(combo2));
		
        response.setCharacterEncoding("UTF8");
        response.getWriter().append(json.toJson(clsActs.Mostrar_Acts_Alumnos(act)));
	}

}
