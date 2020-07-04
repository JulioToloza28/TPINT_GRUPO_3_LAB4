package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alumno;
import entidades.Curso;
import entidades.Materia;
import entidades.Profesor;
import negocio.AlumnoNegocio;
import negocio.CursoNegocio;
import negocioImpl.AlumnoNegocioImpl;
import negocioImpl.CursoNegocioImpl;
import negocio.MateriaNegocio;
import negocio.ProfesorNegocio;
import negocioImpl.MateriaNegocioImpl;
import negocioImpl.ProfesorNegocioImpl;

@WebServlet("/ServletCurso")
public class ServletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletCurso() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CursoNegocio cursoNeg = new CursoNegocioImpl();
		AlumnoNegocio alumnoNeg = new AlumnoNegocioImpl();
		ProfesorNegocio profesorNeg = new ProfesorNegocioImpl();
		MateriaNegocio materiaNeg = new MateriaNegocioImpl();

		
		if (request.getParameter("AddCourses") != null) {
			ArrayList<Materia> lMateria = (ArrayList<Materia>) materiaNeg.listarMaterias();
			ArrayList<Alumno> lAlum = alumnoNeg.readAll();
			ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();

			request.setAttribute("listaMatDao", lMateria);
			request.setAttribute("ListaAlumnos", lAlum);
			request.setAttribute("listaProfes", lProfesor);
			RequestDispatcher rd = request.getRequestDispatcher("/agregarCurso.jsp");
			rd.forward(request, response);
		}
//		if (request.getParameter("GrabarCurso") != null) {
//
//		}

		if (request.getParameter("listCourses") != null) {
			ArrayList<Curso> lCursos = (ArrayList<Curso>) cursoNeg.listarCursos();

			request.setAttribute("listaCursoDao", lCursos);
			RequestDispatcher rd = request.getRequestDispatcher("/listarCurso.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("deleteCourse") != null) {
			Curso curso = cursoNeg.buscarCurso(Integer.parseInt(request.getParameter("deleteCourse")));
			ArrayList<Alumno> alum = alumnoNeg
					.getAlumnosInscriptos(Integer.parseInt(request.getParameter("deleteCourse")));

			request.setAttribute("CursoElim", curso);
			request.setAttribute("ListaAlumnos", alum);
			RequestDispatcher rd = request.getRequestDispatcher("/eliminarCurso.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("deleteConfirmedCourse") != null) {
			String Msj = "ERROR: No se pudo eliminar el curso";
			if (cursoNeg.eliminarCurso(Integer.parseInt(request.getParameter("deleteConfirmedCourse")))) {
				Msj = "Curso eliminado";
			}

			request.setAttribute("MensajeElim", Msj);
			RequestDispatcher rd = request.getRequestDispatcher("ServletCurso?listCourses=1");
			rd.forward(request, response);
		}
		
		
		if (request.getParameter("editCourse") != null) {
			Curso curso = cursoNeg.buscarCurso(Integer.parseInt(request.getParameter("editCourse")));
			ArrayList<Alumno> alum = alumnoNeg.getAlumnosInscriptos(Integer.parseInt(request.getParameter("editCourse")));
			ArrayList<Materia> lMateria = (ArrayList<Materia>) materiaNeg.listarMaterias();
			ArrayList<Alumno> lAlum = alumnoNeg.readAll();
			ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();
			
			request.setAttribute("listaMatDao", lMateria);
			request.setAttribute("ListaAlumnos", lAlum);
			request.setAttribute("listaProfes", lProfesor);
			request.setAttribute("CursoElim", curso);
			request.setAttribute("ListaAlumnos", alum);
			RequestDispatcher rd = request.getRequestDispatcher("/modificarCurso.jsp");
			rd.forward(request, response);
		}
		

		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
