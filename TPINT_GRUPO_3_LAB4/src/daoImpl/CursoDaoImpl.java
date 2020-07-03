package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.CursoDao;
import entidades.Curso;

public class CursoDaoImpl implements CursoDao {

	String listarTodos = "SELECT * FROM tpint_grupo_3_lab4.curso where estado=1";
	String buscarxId = "SELECT * FROM tpint_grupo_3_lab4.curso where estado=1 and idCurso=";

	@Override
	public Curso buscarCurso(int Id) {
		Curso curso = new Curso();
		PreparedStatement statement;
		ResultSet resultSet;
		Conexion conexion = Conexion.getConexion();

		try {
			statement = conexion.getSQLConexion().prepareStatement(buscarxId + Id);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				curso.setId(resultSet.getInt("idcurso"));
				curso.setIdMateria(resultSet.getInt("IdMateria"));
				curso.setCuatrimestre(resultSet.getInt("cuatrimestre"));
				curso.setLegajoProf(resultSet.getInt("legajo_Pro"));
				curso.setEstado(resultSet.getInt("estado"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return curso;
	}

	@Override
	public ArrayList<Curso> listarCursos() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Curso curso = null;
		ArrayList<Curso> lCursos = new ArrayList<Curso>();
		PreparedStatement statement;
		ResultSet resultSet;
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(listarTodos);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				curso = new Curso();
//				curso.setId(resultSet.getInt("idcurso"));
//				curso.setCuatrimestre(resultSet.getString("nombre"));
//				curso.setEstado(resultSet.getBoolean("estado"));
//				lCursos.add(curso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return lCursos;
	}

}
