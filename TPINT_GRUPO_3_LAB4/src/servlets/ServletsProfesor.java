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
		
		  //Carga lista de prov y loc y redirige a la ventana del formulario agregar profesor
          if("Profesor".equals(request.getParameter("BtnAgregar"))) {
			
			ArrayList<Provincia> listaProv = provDao.listarProvincia();
			ArrayList<Localidad> listaLoc = locDao.obtenerListLocalidad();
			
			request.setAttribute("listaProvDao", listaProv);
			request.setAttribute("listaLocDao", listaLoc);
			request.getRequestDispatcher("/agregarProfesor.jsp").forward(request, response);
		}
          
		//Agregar Profesor
		int filas=0;
			if(request.getParameter("btn-aceptarProfesor")!=null) 
			{
				Localidad loc = new Localidad();
				String a=request.getParameter("cmbLocalidad");
				loc.setId(Integer.parseInt(a));
				Profesor prof = new Profesor();			
				prof.setNombre(request.getParameter("txtNombre"));
				prof.setApellido(request.getParameter("txtApellido"));
				prof.setDni(request.getParameter("txtDNI"));
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
				prof.setMail(request.getParameter("txtMail"));
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
			
			ArrayList<Profesor> listaProfesor = profDao.listarProfesores();			
			request.setAttribute("listaProf", listaProfesor);			
			
			RequestDispatcher rd = request.getRequestDispatcher("/listarProfesor.jsp");
			rd.forward(request, response);
			}
			
			//modificar Profesor (trae listados de combos y de profesor)
	  		if("ModificarProfesor".equals(request.getParameter("Param")))
	  		{
	  			ArrayList<Provincia> listaProv = provDao.listarProvincia();
	  			ArrayList<Localidad> listaLoc = locDao.obtenerListLocalidad();
	  			
	  			Profesor profe = profDao.ObtenerProfesor(Integer.parseInt(request.getParameter("Data")));
	  			
	  			request.setAttribute("ProfesorAMod", profe);
	  			
	  			request.setAttribute("listaProvDao", listaProv);
	  			request.setAttribute("listaLocDao", listaLoc);
	  			request.getRequestDispatcher("/modificarProfesor.jsp").forward(request, response);
	  		}
	  		
	  	     //Modificar profesor (guarda los datos una vez que se hace click)
	  			if(request.getParameter("btn-EditarProfesor")!=null) {
	  								Localidad loc = new Localidad();
	  				String a=request.getParameter("cmbLocalidad").toString();			
	  				loc.setId(Integer.parseInt(a));
	  				Profesor profe = new Profesor();
	  				String algo = request.getParameter("txtlegajo");
	  				profe.setLegajo(Integer.parseInt(request.getParameter("txtlegajo")));
	  				profe.setNombre(request.getParameter("txtNombre"));
	  				profe.setApellido(request.getParameter("txtApellido"));
	  				profe.setDni(request.getParameter("txtDni"));
	  				SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	  				Date parsed = null;
	  				try {
	  					parsed = format.parse(request.getParameter("txtFechaNac"));
	  				} 
	  				catch (ParseException e) {
	  					e.printStackTrace();
	  				}
	  				java.sql.Date sql = new java.sql.Date(parsed.getTime());
	  				profe.setFechaNac(sql);			
	  				profe.setDireccion(request.getParameter("txtDireccion"));
	  				profe.setLocalidad(loc);
	  				profe.setTelefono(request.getParameter("txtTelefono"));
	  				profe.setMail(request.getParameter("txtEmail"));
	  				profe.setEstado(true);
	  				
	  				ProfesorDaoImpl profeImp=new ProfesorDaoImpl();
	  				if(profeImp.modificarProfesor(profe)!=false) 
	  				{
	  					filas=1;
	  				}	
	  				if(filas==1) {
	  					//REQUEST DISPATCHER
	  					request.setAttribute("cantFilas", filas);
	  					RequestDispatcher rd= request.getRequestDispatcher("/modificarProfesor.jsp");
	  					rd.forward(request, response);
	  					}
	  			}
	  			
		  		//Eliminar profesor
					if("EliminarProfesor".equals(request.getParameter("Param"))){
					int Legajo_profe = Integer.parseInt(request.getParameter("Data"));
					ProfesorDaoImpl profeDaoImpl = new ProfesorDaoImpl();
					profeDaoImpl.eliminarProfesor(Legajo_profe);
					
					if(profeDaoImpl.eliminarProfesor(Legajo_profe)!=false) 
					{
						filas=1;
					}	
					if(filas==1) {
						//REQUEST DISPATCHER
						request.setAttribute("ProfesorEliminado", filas);
						RequestDispatcher rd= request.getRequestDispatcher("ServletsProfesor?Param=MenuProfesor");
						rd.forward(request, response);
					}
				}
	}
	
	private RequestDispatcher getRequestDispatcher(String string) {
		return null;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
