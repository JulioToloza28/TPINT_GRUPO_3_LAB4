package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alumno;
import entidades.Curso;
import entidades.Materia;
import entidades.Profesor;
import entidades.Turno;
import negocio.AlumnoNegocio;
import negocio.CursoNegocio;
import negocioImpl.AlumnoNegocioImpl;
import negocioImpl.CursoNegocioImpl;
import negocio.MateriaNegocio;
import negocio.ProfesorNegocio;
import negocio.TurnoNegocio;
import negocioImpl.MateriaNegocioImpl;
import negocioImpl.ProfesorNegocioImpl;
import negocioImpl.TurnoNegocioImpl;

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
		TurnoNegocio turnoNeg = new TurnoNegocioImpl();

		System.out.println(request.getParameter("listCoursesProfessor"));

		// BOTON CURSOS DEL MENU, LISTA LOS CURSOS
		if (request.getParameter("listCourses") != null) {
			String msj;
			ArrayList<Curso> lCursos = (ArrayList<Curso>) cursoNeg.listarCursos();

			if (request.getAttribute("Mensaje") != null) {
				msj = request.getAttribute("Mensaje").toString();
				request.setAttribute("Mensaje", msj);
			}

			request.setAttribute("listaCursos", lCursos);
			RequestDispatcher rd = request.getRequestDispatcher("/listarCurso.jsp");
			rd.forward(request, response);
		}

		// BOTON AGREGAR CURSO (SOLICITA LOS DATOS DEL CURSO)
		if (request.getParameter("AddCourses") != null) {
			ArrayList<Materia> lMateria = materiaNeg.listarMaterias();
			ArrayList<Turno> lTurno = turnoNeg.listarTurnos();
			ArrayList<Alumno> lAlum = alumnoNeg.readAll();
			ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();

			request.setAttribute("listaMatDao", lMateria);
			request.setAttribute("ListaTurnos", lTurno);
			request.setAttribute("ListaAlumnos", lAlum);
			request.setAttribute("listaProfes", lProfesor);
			RequestDispatcher rd = request.getRequestDispatcher("/agregarCurso.jsp");
			rd.forward(request, response);
		}

		// BOTON EDITAR CURSO, MUESTRA LA INFORMACION A EDITAR
		if (request.getParameter("editCourse") != null) {
			Curso curso = cursoNeg.buscarCurso(Integer.parseInt(request.getParameter("editCourse")));
			ArrayList<Materia> lMateria = (ArrayList<Materia>) materiaNeg.listarMaterias();
			ArrayList<Turno> lTurno = turnoNeg.listarTurnos();
			ArrayList<Alumno> lAlumInsc = alumnoNeg
					.getAlumnosInscriptos(Integer.parseInt(request.getParameter("editCourse")));
			ArrayList<Alumno> lAlum = alumnoNeg.readAll();
			ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();

			request.setAttribute("CursoElim", curso);
			request.setAttribute("listaMatDao", lMateria);
			request.setAttribute("ListaTurnos", lTurno);
			request.setAttribute("ListaAlumnosInsc", lAlumInsc);
			request.setAttribute("ListaAlumnos", lAlum);
			request.setAttribute("listaProfes", lProfesor);
			RequestDispatcher rd = request.getRequestDispatcher("/modificarCurso.jsp");
			rd.forward(request, response);
		}

		// BOTON ELIMINAR CURSO, RECIBE EL ID PARA MOSTRAR LA INFORMACION Y CONFIRMAR LA
		// ELIMINACION
		if (request.getParameter("deleteCourse") != null) {
			Curso curso = cursoNeg.buscarCurso(Integer.parseInt(request.getParameter("deleteCourse")));
			ArrayList<Alumno> alum = alumnoNeg
					.getAlumnosInscriptos(Integer.parseInt(request.getParameter("deleteCourse")));

			request.setAttribute("CursoElim", curso);
			request.setAttribute("ListaAlumnos", alum);
			RequestDispatcher rd = request.getRequestDispatcher("/eliminarCurso.jsp");
			rd.forward(request, response);
		}

		// BOTON CONFIRMA ELIMINAR, CAMBIA EL ESTADO DEL CURSO
		if (request.getParameter("deleteConfirmedCourse") != null) {
			String Msj = "ERROR: No se pudo eliminar el curso";
			if (cursoNeg.eliminarCurso(Integer.parseInt(request.getParameter("deleteConfirmedCourse")))) {
				Msj = "Curso eliminado correctamente";
			}

			request.setAttribute("Mensaje", Msj);
			RequestDispatcher rd = request.getRequestDispatcher("ServletCurso?listCourses=1");
			rd.forward(request, response);
		}

		// PrintWriter pw= response.getWriter();
		// pw.println("<html><body>Prueba PrintWriter</body></html>"); //IMPRIMO EN
		// PANTALLA
		// pw.close();
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		// Listar Curso del usuario tipo profesor
		if (request.getParameter("listCoursesProfessor") != null) {
			String msj;
			HttpSession session = request.getSession();

			int LegajoProf = Integer.parseInt(session.getAttribute("Session_Legajo").toString());
			ArrayList<Curso> lCursos = (ArrayList<Curso>) cursoNeg.listarCursos(LegajoProf);

			if (request.getAttribute("Mensaje") != null) {
				msj = request.getAttribute("Mensaje").toString();
				request.setAttribute("Mensaje", msj);
			}

			request.setAttribute("listaCursos", lCursos);
			RequestDispatcher rd = request.getRequestDispatcher("/listarCursoProfesor.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("showCourse-professor") != null) {
			Curso curso = cursoNeg.buscarCurso(Integer.parseInt(request.getParameter("showCourse-professor")));
			ArrayList<Alumno> alum = alumnoNeg
					.getAlumnosInscriptos(Integer.parseInt(request.getParameter("showCourse-professor")));

			request.setAttribute("CursoElim", curso);
			request.setAttribute("ListaAlumnos", alum);
			RequestDispatcher rd = request.getRequestDispatcher("/mostrarCursoProfesor.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CursoNegocio cursoNeg = new CursoNegocioImpl();
		AlumnoNegocio alumnoNeg = new AlumnoNegocioImpl();

		// BOTON GRABAR CURSO (GRABA EN LA BD)
		if (request.getParameter("btn-GrabarCurso") != null) {
			Boolean CancelarGrabado = false;
			String Msj = null;
			Alumno alum = null;
			String[] lAlumnosInscriptos;
			int IdCurso;
			Curso curs = new Curso();
			String aux = new String();
			aux = request.getParameter("cmbMateria");
			curs.setIdMateria(Integer.parseInt(aux));
			aux = request.getParameter("cmbTurno");
			curs.setIdTurno(Integer.parseInt(aux));
			aux = request.getParameter("cmbCuatrimestre");
			curs.setCuatrimestre(Integer.parseInt(aux));
			aux = request.getParameter("cmbAnio");
			curs.setAnio(Integer.parseInt(aux));
			aux = request.getParameter("cmbProfesor");
			curs.setLegajoProf(Integer.parseInt(aux));
			curs.setId(0);
			if (!cursoNeg.VerificarExisteCurso(curs)) {
				if (cursoNeg.GrabarCurso(curs)) { // SI GRABARCURSO DEVUELVE TRUE, LA GRABACION DEL CURSO FUE EXITOSA Y
													// PROCEDE A GRABAR LA LISTA DE ALUMNOS INSCRIPTOS
					lAlumnosInscriptos = request.getParameterValues("cboxAlumno");
					IdCurso = cursoNeg.UltimoId(); // Obtengo el Id del curso Grabado
					for (int x = 0; x < lAlumnosInscriptos.length; x++) {
						if (!cursoNeg.VerificarAlumnoEstaInscripto(IdCurso, lAlumnosInscriptos[x])) {
							if (!cursoNeg.InsertarAlumnoAlCurso(IdCurso, lAlumnosInscriptos[x])) {
								CancelarGrabado = true;
								Msj = "ERROR: Hubo un error al insertar uno o varios alumnos";
							}
						}
					}
					Msj = "Curso creado correctamente";
				} else {
					CancelarGrabado = true;
					Msj = "ERROR: Hubo un error al crear curso";
				}
			} else {
				CancelarGrabado = true;
				Msj = "ERROR: Ya existe este curso con el mismo profesor";
			}

			if (CancelarGrabado) {
				ArrayList<Alumno> lAlumAux = new ArrayList<Alumno>();
				Alumno A;
				lAlumnosInscriptos = request.getParameterValues("cboxAlumno");
				for (int x = 0; x < lAlumnosInscriptos.length; x++) {
					A = new Alumno();
					A.setLegajo(Integer.parseInt(lAlumnosInscriptos[x].toString()));
					lAlumAux.add(A);
				}
				ProfesorNegocio profesorNeg = new ProfesorNegocioImpl();
				MateriaNegocio materiaNeg = new MateriaNegocioImpl();
				TurnoNegocio turnoNeg = new TurnoNegocioImpl();
				ArrayList<Materia> lMateria = (ArrayList<Materia>) materiaNeg.listarMaterias();
				ArrayList<Turno> lTurno = turnoNeg.listarTurnos();
				ArrayList<Alumno> lAlum = alumnoNeg.readAll();
				ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();

				request.setAttribute("CursoAux", curs);
				request.setAttribute("listaMatDao", lMateria);
				request.setAttribute("ListaTurnos", lTurno);
				request.setAttribute("ListaAlumnosAux", lAlumAux);
				request.setAttribute("ListaAlumnos", lAlum);
				request.setAttribute("listaProfes", lProfesor);
			}

			ArrayList<Curso> lCursos = (ArrayList<Curso>) cursoNeg.listarCursos();

			request.setAttribute("listaCursos", lCursos);
			request.setAttribute("Mensaje", Msj);
			RequestDispatcher rd = request.getRequestDispatcher("/listarCurso.jsp");
			rd.forward(request, response);
		}

		// BOTON GUARDAR EDICION
		if (request.getParameter("btn-EditarCurso") != null) {
			String Msj = null;
			String[] lNvaAlumnosInscriptos;
			List<Alumno> lVjaAlumnosInscriptos;
			Curso curs = new Curso();
			String aux = new String();
			aux = request.getParameter("txtIdCurso");
			curs.setId(Integer.parseInt(aux));
			aux = request.getParameter("cmbMateria");
			curs.setIdMateria(Integer.parseInt(aux));
			aux = request.getParameter("cmbTurno");
			curs.setIdTurno(Integer.parseInt(aux));
			aux = request.getParameter("cmbCuatrimestre");
			curs.setCuatrimestre(Integer.parseInt(aux));
			aux = request.getParameter("cmbAnio");
			curs.setAnio(Integer.parseInt(aux));
			aux = request.getParameter("cmbProfesor");
			curs.setLegajoProf(Integer.parseInt(aux));
			if (!cursoNeg.VerificarExisteCurso(curs)) {
				if (cursoNeg.ActualizarCurso(curs)) { // SI GRABARCURSO DEVUELVE TRUE, LA GRABACION DEL CURSO FUE
														// EXITOSA Y
														// PROCEDE A GRABAR LA LISTA DE ALUMNOS INSCRIPTOS
					lNvaAlumnosInscriptos = request.getParameterValues("cboxAlumno");
					lVjaAlumnosInscriptos = alumnoNeg.getAlumnosInscriptos(curs.getId());
					for (int x = 0; x < lNvaAlumnosInscriptos.length; x++) {
						if (!alumnoNeg.verifEstaInscripto(lNvaAlumnosInscriptos[x], curs.getId())) {
							cursoNeg.InsertarAlumnoAlCurso(curs.getId(), lNvaAlumnosInscriptos[x]);
						}
					}
					for (Alumno alum : lVjaAlumnosInscriptos) {
						boolean existe = false;
						for (int i = 0; i < lNvaAlumnosInscriptos.length; i++) {
							if (alum.getLegajo() == Integer.parseInt(lNvaAlumnosInscriptos[i])) {
								existe = true;
							}
						}
						if (existe == false) {
							cursoNeg.EliminarAlumnoDelCurso(alum.getLegajo(), curs.getId());
						}
					}
					Msj = "Curso Editado correctamente";
				}
			} else
				Msj = "ERROR: Ya existe este curso con el mismo profesor";
			ArrayList<Curso> lCursos = (ArrayList<Curso>) cursoNeg.listarCursos();

			request.setAttribute("listaCursos", lCursos);
			request.setAttribute("Mensaje", Msj);
			RequestDispatcher rd = request.getRequestDispatcher("/listarCurso.jsp");
			rd.forward(request, response);
		}

		doGet(request, response);
	}
}