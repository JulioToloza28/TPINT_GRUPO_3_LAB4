package negocio;

import java.util.ArrayList;

import entidades.Usuario;

public interface UsuarioNegocio {
	public ArrayList<Usuario> obtenerTodos();
	public Usuario obtenerUsuario(String user,String clave);
	public boolean agregarUsuario(Usuario usuarioAgregado);
}
