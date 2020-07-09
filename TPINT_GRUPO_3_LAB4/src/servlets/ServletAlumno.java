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
import daoImpl.LocalidadDaoImpl;
import daoImpl.ProvinciaDaoImpl;
import daoImpl.ReporteDaoImpl;
import entidades.Alumno;
import entidades.Localidad;
import entidades.Provincia;
import entidades.Reporte;

@WebServlet("/ServletAlumno")
public class ServletAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletAlumno() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AlumnoDaoImpl alumDao = new AlumnoDaoImpl();
		ProvinciaDaoImpl provDao = new ProvinciaDaoImpl();
		LocalidadDaoImpl locDao = new LocalidadDaoImpl();
		ReporteDaoImpl reporteDao = new ReporteDaoImpl();

		// listar alumno
		if ("MenuAlumno".equals(request.getParameter("Param"))) {
			ArrayList<Alumno> listaAlum = alumDao.readAll();
			// ArrayList<Provincia> listaProv = provDao.readAll();

			request.setAttribute("listaAlum", listaAlum);
			// request.setAttribute("listaProv", listaProv);
			RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
			rd.forward(request, response);
		}
		// Filtrar Alumno
		
		  if(request.getParameter("btn-filtrar") != null) {
		  
			  int materia=0;
			  int Cuatri=0;
			  int anio=0;
			  if(request.getParameter("cbxMateria")!=null) { materia= Integer.parseInt(request.getParameter("cbxMateria"));}
			  if(request.getParameter("cbxCuatrimestre")!=null) {Cuatri= Integer.parseInt(request.getParameter("cbxCuatrimestre"));}
			  if(request.getParameter("cdxAnio")!=null) {anio= Integer.parseInt(request.getParameter("cdxAnio"));}
			  
			  
		  ArrayList<Alumno> listaAlum = alumDao.filtroDeAlumnos(materia,Cuatri,anio);
		  
		  request.setAttribute("listaAlum", listaAlum);
		  RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
	      rd.forward(request, response);
	      }
		 

		// agregar alumno
		if (request.getParameter("BtnAgregar") != null) {

			ArrayList<Provincia> listaProv = provDao.listarProvincia();
			ArrayList<Localidad> listaLoc = locDao.obtenerListLocalidad();

			request.setAttribute("listaProvDao", listaProv);
			request.setAttribute("listaLocDao", listaLoc);
			request.getRequestDispatcher("/agregarAlumno.jsp").forward(request, response);
		}

		// modificar alumno (trae listados de combos y de alumno)
		if ("ModificarAlumno".equals(request.getParameter("Param"))) {
			ArrayList<Provincia> listaProv = provDao.listarProvincia();
			ArrayList<Localidad> listaLoc = locDao.obtenerListLocalidad();

			Alumno alum = alumDao.ObtenerAlumno(Integer.parseInt(request.getParameter("Data")));

			request.setAttribute("AlumnoAMod", alum);

			request.setAttribute("listaProvDao", listaProv);
			request.setAttribute("listaLocDao", listaLoc);
			request.getRequestDispatcher("/modificarAlumno.jsp").forward(request, response);
		}

		// Agregar alumno
		int filas = 0;
		if (request.getParameter("btn-aceptar") != null) {
			Localidad loc = new Localidad();
			String a = request.getParameter("cmbLocalidad");
			loc.setId(Integer.parseInt(a));
			Alumno alum = new Alumno();
			alum.setNombre(request.getParameter("txtNombre"));
			alum.setApellido(request.getParameter("txtApellido"));
			alum.setDni(request.getParameter("txtDni"));
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			Date parsed = null;
			try {
				parsed = format.parse(request.getParameter("txtFechaNac"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			alum.setFechaNac(sql);
			alum.setDireccion(request.getParameter("txtDireccion"));
			alum.setLocalidad(loc);
			alum.setTelefono(request.getParameter("txtTelefono"));
			alum.setMail(request.getParameter("txtEmail"));
			alum.setEstado(true);

			AlumnoDaoImpl alumImp = new AlumnoDaoImpl();
			if (alumImp.agregarAlumno(alum) != false) {
				filas = 1;
			}
		}
		if (filas == 1) {
			// REQUEST DISPATCHER
			request.setAttribute("cantFilas", filas);

			ArrayList<Alumno> listaAlum = alumDao.readAll();
			request.setAttribute("listaAlum", listaAlum);

			RequestDispatcher rd = request.getRequestDispatcher("/listarAlumno.jsp");
			rd.forward(request, response);
		}

		// Modificar alumno (guarda los datos una vez que se hace click)
		if (request.getParameter("btn-EditarAlumno") != null) {
			// Alumno alum = new Alumno();
			Localidad loc = new Localidad();
			String a = request.getParameter("cmbLocalidad").toString();
			loc.setId(Integer.parseInt(a));
			Alumno alum1 = new Alumno();
			String algo = request.getParameter("txtlegajo");
			alum1.setLegajo(Integer.parseInt(request.getParameter("txtlegajo")));
			alum1.setNombre(request.getParameter("txtNombre"));
			alum1.setApellido(request.getParameter("txtApellido"));
			alum1.setDni(request.getParameter("txtDni"));
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			Date parsed = null;
			try {
				parsed = format.parse(request.getParameter("txtFechaNac"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			alum1.setFechaNac(sql);
			alum1.setDireccion(request.getParameter("txtDireccion"));
			alum1.setLocalidad(loc);
			alum1.setTelefono(request.getParameter("txtTelefono"));
			alum1.setMail(request.getParameter("txtEmail"));
			alum1.setEstado(true);

			AlumnoDaoImpl alumImp = new AlumnoDaoImpl();
			if (alumImp.modificarAlumno(alum1) != false) {
				filas = 1;
			}
			if (filas == 1) {
				// REQUEST DISPATCHER
				request.setAttribute("cantFilas", filas);
				RequestDispatcher rd = request.getRequestDispatcher("/modificarAlumno.jsp");
				rd.forward(request, response);
			}
		}

		// Eliminar alumno
		if ("EliminarAlumno".equals(request.getParameter("Param"))) {
			int Legajo_alum = Integer.parseInt(request.getParameter("Data"));
			AlumnoDaoImpl alumDaoImpl = new AlumnoDaoImpl();
			alumDaoImpl.eliminarAlumno(Legajo_alum);

			if (alumDaoImpl.eliminarAlumno(Legajo_alum) != false) {
				filas = 1;
			}
			if (filas == 1) {
				// REQUEST DISPATCHER
				request.setAttribute("AlumnoEliminado", filas);
				RequestDispatcher rd = request.getRequestDispatcher("ServletAlumno?Param=MenuAlumno");
				rd.forward(request, response);
			}
		}
		
		//reporte
		
		  if(request.getParameter("btn-reporte") != null) {
		  
			  int materia=0;
			  int Cuatri=0;
			  int anio=0;
			  int curso=0;
			  if(request.getParameter("cboCursos")!=null) { curso= Integer.parseInt(request.getParameter("cboCursos"));}
			  if(request.getParameter("cboMateria")!=null) { materia= Integer.parseInt(request.getParameter("cboMateria"));}
			  if(request.getParameter("cboCuatrimestre")!=null) {Cuatri= Integer.parseInt(request.getParameter("cboCuatrimestre"));}
			  if(request.getParameter("cdoAnio")!=null) {anio= Integer.parseInt(request.getParameter("cdoAnio"));}
			  
			  
		  ArrayList<Reporte> listReporte = reporteDao.obtenerDatos(curso,materia,Cuatri,anio);
		  System.out.println(listReporte);
		  request.setAttribute("listaReporte", listReporte);
		  RequestDispatcher rd = request.getRequestDispatcher("/reporte.jsp");
	      rd.forward(request, response);
	      }
	}

	private RequestDispatcher getRequestDispatcher(String string) {
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
