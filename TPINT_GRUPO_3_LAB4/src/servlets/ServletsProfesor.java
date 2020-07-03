package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import daoImpl.LocalidadDaoImpl;
import daoImpl.ProfesorDaoImpl;
import entidades.Localidad;
import entidades.Profesor;

@WebServlet("/ServletsProfesor")
public class ServletsProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServletsProfesor() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());

			int fila=0;
			if(request.getParameter("btn-Acaptar")!=null) 
			{
				Profesor prof=new Profesor();
				prof.setNombre(request.getParameter("txtNombre"));
			    prof.setApellido(request.getParameter("txtApellido"));
			    prof.setDni(request.getParameter("txtDNI"));
			    SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			    Date parsed =null;
			    try 
			    {
			    	parsed=format.parse(request.getParameter("txtFechaNac"));
			    	
			    }
			    catch(ParseException e) 
			    {
			    	e.printStackTrace();
			    } catch (java.text.ParseException e) {
					
					e.printStackTrace();
				}
			    java.sql.Date sql=new java.sql.Date(parsed.getTime());
			    prof.setFechaNac(sql);
			    prof.setDireccion(request.getParameter("txtDireccion"));
			    prof.setIdLocalidad(1);
			    prof.setTelefono(request.getParameter("txtTelefono"));
			    prof.setMail(request.getParameter("txtMail"));
			    prof.setEstado(true);
			    
			    ProfesorDaoImpl profImpl=new ProfesorDaoImpl();
			    
				
			    if(profImpl.agregarProfesor(prof)!=false)
			    {
			    	fila=1;
			    }
			    
			}
			if(fila==1) 
			{
				request.setAttribute("cantFilas", fila);
				RequestDispatcher rd= request.getRequestDispatcher("/agregarProfesor.jsp");
				rd.forward(request, response);
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
