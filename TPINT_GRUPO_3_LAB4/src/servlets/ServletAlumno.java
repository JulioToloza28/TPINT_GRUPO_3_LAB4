package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import com.sun.javafx.scene.layout.region.Margins.Converter;
import dao.AlumnoDao;
import daoImpl.AlumnoDaoImpl;
import entidades.Alumno;

@WebServlet("/ServletAlumno")
public class ServletAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       

    public ServletAlumno() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//listar alumno
		if(request.getParameter("Param")!=null)
		{
			AlumnoDaoImpl alumDao = new AlumnoDaoImpl();
			ArrayList<Alumno> lista = alumDao.readAll();
			
			request.setAttribute("listaAlum", lista);
			RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
			rd.forward(request, response);
		}
		
		//agregar alumno
		int filas=0;
		if(request.getParameter("btn-aceptar")!=null)
		{
			Alumno alum = new Alumno();			
			alum.setNombre(request.getParameter("txtNombre"));
			alum.setApellido(request.getParameter("txtApellido"));
			alum.setDni(request.getParameter("txtDni"));
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			Date parsed = null;
			try {
				parsed = format.parse(request.getParameter("txtFechaNac"));
			} 
			catch (ParseException e) {
				e.printStackTrace();
			}
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			alum.setFechaNac(sql);			
			alum.setDireccion(request.getParameter("txtDireccion"));
			alum.setIdLocalidad(1);
			alum.setTelefono(request.getParameter("txtTelefono"));
			alum.setMail(request.getParameter("txtEmail"));
			alum.setEstado(true);
			
			AlumnoDaoImpl alumImp=new AlumnoDaoImpl();
			if(alumImp.agregarAlumno(alum)!=false) 
			{
				filas=1;
			}	
		}
		if(filas==1) {
		//REQUEST DISPATCHER
		request.setAttribute("cantFilas", filas);
		RequestDispatcher rd= request.getRequestDispatcher("/agregarAlumno.jsp");
		rd.forward(request, response);
		}
	}

	private RequestDispatcher getRequestDispatcher(String string) {
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
