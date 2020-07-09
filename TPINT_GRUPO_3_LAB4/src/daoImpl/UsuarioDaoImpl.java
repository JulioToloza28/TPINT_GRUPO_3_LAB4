package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.UsuarioDao;
import entidades.TipoUsuario;
import entidades.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	private static final String obtenerTodos = "SELECT * FROM usuario a  inner join tipousuario b on b.idtipoUsuario = a.idTipoUsuario Where estado=1";
	private static final String obtenerUsuario = "SELECT * FROM tpint_grupo_3_lab4.usuario a  inner join tpint_grupo_3_lab4.tipousuario b on b.idtipoUsuario = a.idTipoUsuario Where a.nombreUsuario= ? and a.Contrasenia= ? and a.estado=1";
	private static final String agregarUsuario = "INSERT INTO usuario(nombreUsuario, Contrasenia, idTipoUsuario, legajo_Pro, estado) values(?,?,?,?,?)";

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

	public Usuario obtenerUsuario(String user, String pass) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		Usuario usuario = new Usuario();
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(obtenerUsuario);
			statement.setString(1, user);
			statement.setString(2, pass);
			resultSet = statement.executeQuery();
			System.out.println(resultSet);
			while (resultSet.next()) {
				usuario = getUsuario(resultSet);
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

	public boolean agregarUsuario(Usuario usuario) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {
			statement = conexion.prepareStatement(agregarUsuario);
			statement.setString(1, usuario.getUsername());
			statement.setString(2, usuario.getPass());
			statement.setInt(3, usuario.getTipoUsuario().getId());
			statement.setInt(4, usuario.getLegajo());
			statement.setInt(5, usuario.getEstado());
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

		return isInsertExitoso;
	}
}
