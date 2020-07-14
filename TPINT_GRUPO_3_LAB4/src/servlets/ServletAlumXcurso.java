package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImpl.AlumnoDaoImpl;
import daoImpl.AlumnoPorCursoDaoImpl;
import entidades.Alumno;
import entidades.AlumnosPorCursos;
import entidades.Curso;
import entidades.EstadoAcademico;

/**
 * Servlet implementation class ServletAlumXcurso
 */
@WebServlet("/ServletAlumXcurso")
public class ServletAlumXcurso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletAlumXcurso() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AlumnoPorCursoDaoImpl alumDao = new AlumnoPorCursoDaoImpl();
		int filas = 0;
		
		// Lista los alumnos con las notas
		if ("CargarNota".equals(request.getParameter("Param"))) {
			ArrayList<AlumnosPorCursos> listaAlum = alumDao.readAll();
			request.setAttribute("listaAlumConNota", listaAlum);
			RequestDispatcher rd = request.getRequestDispatcher("/cargarNota.jsp");
			rd.forward(request, response);
		}
		  
		 
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//Guarda los alumnos con las notas
		  if (request.getParameter("btnGuardar") != null) 
		  {	
			  
		  
		  }

		doGet(request, response);
	}

}
