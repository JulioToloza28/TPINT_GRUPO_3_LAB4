package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.MateriaDao;
import entidades.Materia;

public class MateriaDaoImpl implements MateriaDao {

	String listarMaterias = "SELECT * FROM tpint_grupo_3_lab4.materia";
	String buscarMateria = "SELECT * FROM tpint_grupo_3_lab4.materia where idMateria=";

	@Override
	public Materia buscarMateria(int Id) {
		Materia materia = new Materia();
		PreparedStatement statement;
		ResultSet resultSet;
		Conexion conexion = Conexion.getConexion();

		try {
			statement = conexion.getSQLConexion().prepareStatement(buscarMateria + Id);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				materia.setId(resultSet.getInt("idmateria"));
				materia.setNombre(resultSet.getString("nombre"));
				materia.setEstado(resultSet.getBoolean("estado"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return materia;
	}

	@Override
	public ArrayList<Materia> listarMaterias() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Materia materia = null;
		ArrayList<Materia> lMaterias = new ArrayList<Materia>();
		PreparedStatement statement;
		ResultSet resultSet;
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(listarMaterias);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				materia = new Materia();
				materia.setId(resultSet.getInt("idmateria"));
				materia.setNombre(resultSet.getString("nombre"));
				materia.setEstado(resultSet.getBoolean("estado"));
				lMaterias.add(materia);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return lMaterias;
	}

}
