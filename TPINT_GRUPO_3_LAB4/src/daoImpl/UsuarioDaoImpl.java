package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.UsuarioDao;
import entidades.TipoUsuario;
import entidades.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	private static final String obtenerTodos = "SELECT * FROM usuario a  inner join tipousuario b on b.idtipoUsuario = a.idTipoUsuario Where estado=1";
	private static final String obtenerUsuario = "SELECT * FROM usuario a  inner join tipousuario b on b.idtipoUsuario = a.idTipoUsuario Where a.nombreUsuario=? and a.Contrasenia=? and a.estado=1";
	
	public ArrayList<Usuario> obtenerTodos() {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		ArrayList<Usuario> usuario = new ArrayList<Usuario>();
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(obtenerTodos);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				usuario.add(getUsuario(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	public ArrayList<Usuario> obtenerUsuario(String user, String pass) {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		ArrayList<Usuario> usuario = new ArrayList<Usuario>();
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(obtenerUsuario);
			statement.setString(1,user);
			statement.setString(2,pass);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				usuario.add(getUsuario(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}

	private Usuario getUsuario(ResultSet resultSet) throws SQLException {
		int id = resultSet.getInt("idusuario");
		String username = resultSet.getString("nombreUsuario");
		String pass = resultSet.getString("Contrasenia");

		TipoUsuario tipoUsuario = new TipoUsuario();
		tipoUsuario.setId(resultSet.getInt("idTipoUsuario"));
		tipoUsuario.setTipo(resultSet.getString("tipo"));

		int legajo = resultSet.getInt("legajo_Pro");
		int estado = resultSet.getInt("estado");
		return new Usuario(id, username, pass, tipoUsuario, legajo, estado);
	}
}
