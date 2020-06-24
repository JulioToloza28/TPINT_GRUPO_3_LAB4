package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.scene.layout.region.Margins.Converter;

import entidades.Alumno;

/**
 * Servlet implementation class ServletAlumno
 */
@WebServlet("/ServletAlumno")
public class ServletAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int filas=0;
		if(request.getParameter("btn-aceptar")!=null)
		{
			Alumno alum = new Alumno();
			alum.setNombre(request.getParameter("txtNombre"));
			alum.setApellido(request.getParameter("txtApellido"));
			alum.setDni(request.getParameter("txtDni"));
			alum.setLegajo(request.getParameter("txtLegajo"));			
			
			//String string = "January 2, 2010";
			//DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
			//Date date = format.parse(string);
			
//			alum.setFechaNac(Date.parse(request.getParameter("txtFechaNac").toString()));
			try {
				Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("txtFechaNac").toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			alum.setDireccion(request.getParameter("txtDireccion"));
			alum.setIdLocalidad(Integer.parseInt(request.getParameter("txtLocalidad").toString()));
			alum.setTelefono(request.getParameter("txtTelefono"));
			alum.setMail(request.getParameter("txtEmail"));
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
