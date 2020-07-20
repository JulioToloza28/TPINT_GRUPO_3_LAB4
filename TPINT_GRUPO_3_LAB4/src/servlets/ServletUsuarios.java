package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoImpl.UsuarioDaoImpl;
import entidades.Alumno;
import entidades.Curso;
import entidades.Profesor;
import entidades.TipoUsuario;
import entidades.Usuario;
import negocio.ProfesorNegocio;
import negocio.TipoUsuarioNegocio;
import negocioImpl.ProfesorNegocioImpl;
import negocioImpl.TipoUsuarioNegocioImpl;

/**
 * Servlet implementation class ServletUsuarios
 */
@WebServlet("/ServletUsuarios")
public class ServletUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDaoImpl UsuarioDao = new UsuarioDaoImpl();
	ProfesorNegocio profesorNeg = new ProfesorNegocioImpl();
	TipoUsuarioNegocio tipoUsuarioNeg = new TipoUsuarioNegocioImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUsuarios() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (request.getParameter("Param") != null) {
			// Entra por haber echo click en el hyperlink mostrar usuarios
			UsuarioDaoImpl UsuarioDao = new UsuarioDaoImpl();
			ArrayList<Usuario> lista = UsuarioDao.obtenerTodos();

			request.setAttribute("listaUsuarios", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/ListarUsuarios.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("AddUser") != null) {
			ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();
			ArrayList<TipoUsuario> listaTipoUsuario = tipoUsuarioNeg.obtenerTodos();

			request.setAttribute("listaProfes", lProfesor);
			request.setAttribute("listaTipoUsuario", listaTipoUsuario);
			RequestDispatcher rd = request.getRequestDispatcher("/agregarUsuario.jsp");
			rd.forward(request, response);
		}

		/*
		 * int filas = 0; if ("EliminarUsuario".equals(request.getParameter("Param"))) {
		 * int idUsuario = Integer.parseInt(request.getParameter("Data"));
		 * UsuarioDao.eliminarUsuario(idUsuario);
		 * 
		 * if (UsuarioDao.eliminarUsuario(idUsuario) != false) { filas = 1; } if (filas
		 * == 1) { // REQUEST DISPATCHER request.setAttribute("UsuarioEliminado",
		 * filas); ArrayList<Usuario> lista = UsuarioDao.obtenerTodos();
		 * 
		 * request.setAttribute("listaUsuarios", lista);
		 * 
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("/ServletUsuarios?Param=1"); rd.forward(request,
		 * response); } }
		 */

		// PARA ELIMINAR UN USUARIO
		if (request.getParameter("deleteUser") != null) {
			UsuarioDao.eliminarUsuario(Integer.parseInt(request.getParameter("deleteUser")));

			ArrayList<Usuario> lista = UsuarioDao.obtenerTodos();
			// request.setAttribute("listaUsuario", lista);
			RequestDispatcher rd = request.getRequestDispatcher("/ServletUsuarios?Param=1");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// Agregar Usuario
		int filas = 0;
		if (request.getParameter("btnGuardar") != null) {
			Usuario user = new Usuario();
			TipoUsuario tipoUser = new TipoUsuario();
			String a = request.getParameter("cmbTipoUsuario");
			tipoUser.setId(Integer.parseInt(a));

			user.setUsername(request.getParameter("txtUsuario"));
			user.setPass(request.getParameter("txtClave"));
			user.setTipoUsuario(tipoUser);
			user.setLegajo(Integer.parseInt(request.getParameter("cmbProfesor")));
			user.setEstado(1);

			/* VALIDA SI EL USERNAME EXISTE */
			String message = "";
			boolean existe = UsuarioDao.validarUserName(request.getParameter("txtUsuario"));
			System.out.println(existe);

			if (existe != true) {
				if (UsuarioDao.agregarUsuario(user) != false) {
					filas = 1;
				}
			} else {
				message = "Ya existe ese usuario. Por favor ingrese otro";
				request.setAttribute("msj", message);
				ArrayList<Profesor> lProfesor = profesorNeg.listarProfe();
				ArrayList<TipoUsuario> listaTipoUsuario = tipoUsuarioNeg.obtenerTodos();

				request.setAttribute("listaProfes", lProfesor);
				request.setAttribute("listaTipoUsuario", listaTipoUsuario);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/agregarUsuario.jsp");
				dispatcher.forward(request, response);
			}

			if (filas == 1) {
				// request.setAttribute("listaUsuario", UsuarioDao.obtenerTodos());
				request.setAttribute("cantFilas", filas);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/agregarUsuario.jsp");
				dispatcher.forward(request, response);
			}

		}

		// Ingresar
		if (request.getParameter("btnIngresar") != null) {
			// Entra por haber echo click en el hyperlink mostrar usuarios
			UsuarioDaoImpl UsuarioDao = new UsuarioDaoImpl();
			Usuario usuario = UsuarioDao.obtenerUsuario(request.getParameter("txtUsuario"),
					request.getParameter("txtClave"));
			System.out.println(usuario);
			session.setAttribute("Usuario2", usuario);
			if (usuario.getId() != 0) {
				session.setAttribute("Session_user", usuario.getUsername());
				session.setAttribute("Session_type", usuario.getTipoUsuario().getTipo());
				session.setAttribute("Session_Legajo", usuario.getLegajo());
				// session.setAttribute("Session_user", request.getParameter("txtUsuario"));
				if (usuario.getTipoUsuario().getId() == 1) {
					request.getRequestDispatcher("Home.jsp").forward(request, response);
				} else if (usuario.getTipoUsuario().getId() != 1) {
					request.getRequestDispatcher("ServletCurso?listCoursesProfessor=0").forward(request, response);

				}
			} else {
				
				/*
				 * int error=1; request.setAttribute("Error", error);
				 * request.getRequestDispatcher("login.jsp").forward(request, response);
				 */
				 
				
					
					  PrintWriter out = response.getWriter();
					  out.println("<script type=\"text/javascript\">");
					  out.println("alert('Usuario y clave incorrecta');");
					  out.println("location='login.jsp';"); out.println("</script>");
					 
				 
			

			}
		}

		// PARA CAMBIAR LA CLAVE DEL USUARIO
		if (request.getParameter("changePass") != null) {
			String clave = request.getParameter("txtClave");
			int idUsuario = Integer.parseInt(request.getParameter("txtId"));
			boolean resp = UsuarioDao.actualizarClave(clave, idUsuario);
			String message = "";
			if (resp == true) {
				message = "Clave cambiada con exito";
			}

			request.setAttribute("msjChange", message);
			RequestDispatcher rd = request.getRequestDispatcher("/CambiarClave.jsp?idUsuario=" +idUsuario);
			rd.forward(request, response);
		}

	}
}
