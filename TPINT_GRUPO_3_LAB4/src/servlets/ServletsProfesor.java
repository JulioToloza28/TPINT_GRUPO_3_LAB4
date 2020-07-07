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

import daoImpl.AlumnoDaoImpl;
import daoImpl.LocalidadDaoImpl;
import daoImpl.ProfesorDaoImpl;
import daoImpl.ProvinciaDaoImpl;
import entidades.Alumno;
import entidades.Localidad;
import entidades.Profesor;
import entidades.Provincia;

@WebServlet("/ServletsProfesor")
public class ServletsProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServletsProfesor() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ProfesorDaoImpl profDao = new ProfesorDaoImpl();
		ProvinciaDaoImpl provDao = new ProvinciaDaoImpl();
		LocalidadDaoImpl locDao = new LocalidadDaoImpl();

		//Listar profesor
		if("MenuProfesor".equals(request.getParameter("Param")))
		{
			ArrayList<Profesor> listaProfesor = profDao.listarProfesores();
			
			request.setAttribute("listaProf", listaProfesor);
			RequestDispatcher rd = request.getRequestDispatcher("/listarProfesor.jsp");
			rd.forward(request, response);
		}
		
          if("Profesor".equals(request.getParameter("BtnAgregar"))) {
			
			ArrayList<Provincia> listaProv = provDao.listarProvincia();
			ArrayList<Localidad> listaLoc = locDao.obtenerListLocalidad();
			
			request.setAttribute("listaProvDao", listaProv);
			request.setAttribute("listaLocDao", listaLoc);
			request.getRequestDispatcher("/agregarProfesor.jsp").forward(request, response);
		}
		
		
		
		//Agregar Profesor	
		int filas=0;
			if(request.getParameter("btn-Aceptar")!=null) 
			{
				Localidad loc = new Localidad();
				String a=request.getParameter("cmbLocalidad");
				loc.setId(Integer.parseInt(a));
				Profesor prof = new Profesor();			
				prof.setNombre(request.getParameter("txtNombre"));
				prof.setApellido(request.getParameter("txtApellido"));
				prof.setDni(request.getParameter("txtDni"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
				Date parsed = null;
				try {
					parsed = format.parse(request.getParameter("txtFechaNac"));
				} 
				catch (ParseException e) {
					e.printStackTrace();
					}
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				prof.setFechaNac(sql);			
				prof.setDireccion(request.getParameter("txtDireccion"));
				prof.setLocalidad(loc);
				prof.setTelefono(request.getParameter("txtTelefono"));
				prof.setMail(request.getParameter("txtEmail"));
				prof.setEstado(true);
				
				ProfesorDaoImpl profImp=new ProfesorDaoImpl();
				if(profImp.agregarProfesor(prof)!=false) 
				{
					filas=1;
				}	
			}
			if(filas==1) {
			//REQUEST DISPATCHER
			request.setAttribute("cantFilas", filas);
			RequestDispatcher rd= request.getRequestDispatcher("ServletsProfesor?Param=MenuProfesor");
			rd.forward(request, response);
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
