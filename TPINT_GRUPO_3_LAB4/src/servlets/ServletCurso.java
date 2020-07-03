package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MateriaDao;
import daoImpl.MateriaDaoImpl;
import entidades.Materia;
//import negocio.CursoNegocio;
//import negocioImpl.CursoNegocioImpl;
import negocio.MateriaNegocio;
import negocioImpl.MateriaNegocioImpl;

@WebServlet("/ServletCurso")
public class ServletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletCurso() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//CursoNegocio cursoNeg = new CursoNegocioImpl();
		

		
		
		if (request.getParameter("AddCurso") != null) {
			MateriaNegocio materiaNeg = new MateriaNegocioImpl();
			ArrayList<Materia> lMateria = (ArrayList<Materia>) materiaNeg.listarMaterias();

			request.setAttribute("listaMatDao", lMateria);
			RequestDispatcher rd = request.getRequestDispatcher("/agregarCurso.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("listCourses") != null) {
			
		}

		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
