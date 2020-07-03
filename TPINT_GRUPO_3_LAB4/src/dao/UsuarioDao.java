package dao;

import java.util.ArrayList;
import java.util.List;
import entidades.Usuario;

public interface UsuarioDao {
	//public boolean insert(Usuario usuario);

	//public boolean delete(Usuario usuario_a_eliminar);

	//public boolean update(Usuario usuario_a_modificar);

	public ArrayList<Usuario> obtenerTodos();
}
