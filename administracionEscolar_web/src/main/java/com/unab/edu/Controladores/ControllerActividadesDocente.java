package com.unab.edu.Controladores;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.unab.edu.DAO.CLSActividades;
import com.unab.edu.Entidades.Actividades;


/**
 * Servlet implementation class ControllerActividadesDocente
 */
public class ControllerActividadesDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerActividadesDocente() {
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
		Date date = new Date();
		String Evaluar = request.getParameter("btne");
		String SaveUpdate = request.getParameter("btna");
		
		String IdAct = request.getParameter("IdAct");
		
		String IdMat = request.getParameter("IdMat");
		String SubjectName = request.getParameter("SubjectName");
		String ActivitieName = request.getParameter("ActivitieName2");
		String Porcent = request.getParameter("Porcent");
		
		String LimitDate = request.getParameter("LimitDate");
		
		String mensaje = "";
		try {
			if(Evaluar != null) {
				if(Evaluar.equals("Eliminar")) {
					
					Actividades actividad = new Actividades();
					actividad.setIdActividad(Integer.parseInt(IdAct));
					
					CLSActividades clsActividad = new CLSActividades();
					clsActividad.EliminarActividad(actividad);
					response.sendRedirect("ActividadesDocente.jsp");
				}
			}
			else if(SaveUpdate.equals("Guardar")) {
				
				Actividades actividad = new Actividades();
				CLSActividades clsActividad = new CLSActividades();
				
				actividad.setIdMateria(Integer.parseInt(SubjectName));
				actividad.setIdDocente(ControllerLogin.envioIdDocenteeeee);
				actividad.setNombre_Actividad(ActivitieName);
				actividad.setPorcentaje(Double.parseDouble(Porcent) / 100);
				actividad.setFecha_Entrega(String.valueOf(LimitDate));
				actividad.setEstado_Actividad("Pendiente");
				actividad.setActUltima_Modificacion(date);
				actividad.setActEstado(1);
				
				if(IdAct == "" || IdAct == null) {
					mensaje = "Guardado";
					response.getWriter().append(json.toJson(mensaje));
					clsActividad.AgregarActividad(actividad);
				}
				else {
					actividad.setIdActividad(Integer.parseInt(IdAct));
					mensaje = "Actualizado";
					response.getWriter().append(json.toJson(mensaje));
					clsActividad.ActualizarActividad(actividad);
				}
			}
		} catch (Exception e) {
			System.out.println("Error en ControllerActividadesDocente. " + e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Gson json = new Gson();
		CLSActividades clsActividades = new CLSActividades();
		
		response.setCharacterEncoding("UTF8");
		response.getWriter().append(json.toJson(clsActividades.MostrarActividades()));
	}

}
