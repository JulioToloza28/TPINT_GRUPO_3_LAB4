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
		// listar alumnoConNotas
		if ("CargarNota".equals(request.getParameter("Param"))) {
			ArrayList<AlumnosPorCursos> listaAlum = alumDao.readAll();
			request.setAttribute("listaAlumConNota", listaAlum);
			RequestDispatcher rd = request.getRequestDispatcher("/cargarNota.jsp");
			rd.forward(request, response);
		}
		
		/*
		 * if (request.getParameter("btnGuardar") != null) {
		 * 
		 * RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
		 * rd.forward(request, response);
		 * 
		 * 
		 * AlumnosPorCursos NotaAlum=new AlumnosPorCursos(); AlumnoPorCursoDaoImpl
		 * alumXcursoImp = new AlumnoPorCursoDaoImpl(); Alumno alumno=new Alumno();
		 * Curso curso=new Curso(); boolean temp=false; EstadoAcademico estadoA=new
		 * EstadoAcademico(); String[] idAlumno=request.getParameterValues("idAlumno");
		 * String[] idcurso=request.getParameterValues("idcurso"); String[]
		 * Nota1=request.getParameterValues("notaParcial1"); String[]
		 * Nota2=request.getParameterValues("notaParcial2"); String[]
		 * Recuperatorio1=request.getParameterValues("Recuperatorio1"); String[]
		 * Recuperatorio2=request.getParameterValues("Recuperatorio2"); String[]
		 * EstadoAcademico=request.getParameterValues("cmbEstadoAc");
		 * 
		 * 
		 * for (int x = 0; x < idAlumno.length; x++) { alumno.setLegajo(
		 * Integer.parseInt(idAlumno[x])); NotaAlum.setAlumno(alumno);
		 * curso.setId(Integer.parseInt(idcurso[x])); NotaAlum.setCurso(curso);
		 * NotaAlum.setParcial1(Integer.parseInt(Nota1[x]));
		 * NotaAlum.setParcial2(Integer.parseInt(Nota2[x]));
		 * NotaAlum.setRecuperatorio1(Integer.parseInt(Recuperatorio1[x]));
		 * NotaAlum.setRecuperatorio2(Integer.parseInt(Recuperatorio2[x]));
		 * estadoA.setId(Integer.parseInt(EstadoAcademico[x]));
		 * NotaAlum.setEstadoAca(estadoA); NotaAlum.setEstado(true);
		 * alumXcursoImp.cargarNotaAlumno(NotaAlum); temp=true; }
		 * 
		 * if (temp==true) { // REQUEST DISPATCHER
		 * 
		 * RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
		 * rd.forward(request, response);
		 * 
		 * }
		 * 
		 * 
		 * }
		 */
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
