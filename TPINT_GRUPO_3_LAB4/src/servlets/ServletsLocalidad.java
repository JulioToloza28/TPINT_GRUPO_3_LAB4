package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Localidad;
import entidades.Provincia;
import dao.LocalidadDao;
import daoImpl.LocalidadDaoImpl;

/**
 * Servlet implementation class ServletsLocalidad
 */
@WebServlet("/ServletsLocalidad")
public class ServletsLocalidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletsLocalidad() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("Param")!=null) {
		LocalidadDaoImpl LocDao=new LocalidadDaoImpl();
		ArrayList<Localidad> listaLoc=(ArrayList<Localidad>) LocDao.obtenerListLocalidad();
		request.setAttribute("listaLocDao",listaLoc);
		
		if("Profesor".equals(request.getParameter("Param"))) {
		RequestDispatcher rdProf= request.getRequestDispatcher("/agregarProfesor.jsp");
		rdProf.forward(request, response);
		}
		else if("Alumno".equals(request.getParameter("Param"))) {
		RequestDispatcher rd= request.getRequestDispatcher("/agregarAlumno.jsp");
		rd.forward(request, response);
		}
	 }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	


		doGet(request, response);
	}

}
