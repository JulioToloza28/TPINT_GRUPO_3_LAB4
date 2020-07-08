package negocioImpl;

import java.util.ArrayList;

import dao.UsuarioDao;
import daoImpl.UsuarioDaoImpl;
import entidades.Usuario;
import negocio.UsuarioNegocio;

public class UsuarioNegocioImpl implements UsuarioNegocio {
	UsuarioDao usuarioDao = new UsuarioDaoImpl();

	@Override
	public ArrayList<Usuario> obtenerUsuario(String user, String clave) {
		ArrayList<Usuario> listUsuario = usuarioDao.obtenerUsuario(user, clave);
		return listUsuario;
	}

	@Override
	public ArrayList<Usuario> obtenerTodos() {
		ArrayList<Usuario> listUsuarios = usuarioDao.obtenerTodos();
		return listUsuarios;
	}

	@Override
	public boolean agregarUsuario(Usuario usuarioAgregado) {
		boolean estado = false;
		if (usuarioAgregado.getUsername().trim().length() > 0 && usuarioAgregado.getPass().trim().length() > 0
				&& usuarioAgregado.getTipoUsuario().getId() > 0 && usuarioAgregado.getLegajo() > 0) {
			estado = usuarioDao.agregarUsuario(usuarioAgregado);
		}
		return estado;
	}
}
