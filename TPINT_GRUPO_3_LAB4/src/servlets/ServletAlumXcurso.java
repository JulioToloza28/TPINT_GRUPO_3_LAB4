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

/**
 * Servlet implementation class ServletAlumXcurso
 */
@WebServlet("/ServletAlumXcurso")
public class ServletAlumXcurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlumXcurso() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		AlumnoPorCursoDaoImpl alumCursoDaoImpl = new AlumnoPorCursoDaoImpl();
		
		//listar alumno por curso
		if ("CargarNota".equals(request.getParameter("BtnNota"))) {
			ArrayList<Alumno> listaAlum = alumDao.readAll();

			request.setAttribute("listaAlum", listaAlum);
			RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
