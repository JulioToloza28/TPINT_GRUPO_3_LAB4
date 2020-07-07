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

import org.apache.catalina.Session;

import daoImpl.TipoUsuarioDaoImpl;
import daoImpl.UsuarioDaoImpl;
import entidades.TipoUsuario;
import entidades.Usuario;

/**
 * Servlet implementation class ServletUsuarios
 */
@WebServlet("/ServletUsuarios")
public class ServletUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("Param") != null) {
			// Entra por haber echo click en el hyperlink mostrar usuarios
			UsuarioDaoImpl UsuarioDao = new UsuarioDaoImpl();
			ArrayList<Usuario> lista = UsuarioDao.obtenerTodos();

			request.setAttribute("listaUsuarios", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/ListarUsuarios.jsp");
			rd.forward(request, response);
		}
		
		if (request.getParameter("btnIngresar") != null) {
			// Entra por haber echo click en el hyperlink mostrar usuarios
			UsuarioDaoImpl UsuarioDao = new UsuarioDaoImpl();
			ArrayList<Usuario> lista = UsuarioDao.obtenerUsuario(request.getParameter("txtUsuario"), request.getParameter("txtClave"));
			System.out.println(lista);
			request.setAttribute("listaUsuario", lista);
			if (lista != null && !lista.isEmpty()) {
				response.sendRedirect("/TPINT_GRUPO_3_LAB4/menu.html");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Usuario y clave incorrecta');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
			

			/*RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);*/
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
