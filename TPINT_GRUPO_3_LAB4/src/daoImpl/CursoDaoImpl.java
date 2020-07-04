package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.CursoDao;
import entidades.Curso;

public class CursoDaoImpl implements CursoDao {

	String listarTodos = "SELECT * FROM tpint_grupo_3_lab4.listar_cursos";
	String buscarxId = "SELECT * FROM tpint_grupo_3_lab4.listar_cursos where idcurso=";
	String eliminar_Curso = "UPDATE tpint_grupo_3_lab4.curso SET estado = 0 WHERE idcurso = ";

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
				curso = new Curso();

				curso.setId(resultSet.getInt("idcurso"));
				curso.setIdMateria(resultSet.getInt("IdMateria"));
				curso.setCuatrimestre(resultSet.getInt("cuatrimestre"));
				curso.setAnio(resultSet.getInt("anio"));
				curso.setLegajoProf(resultSet.getInt("legajo_Pro"));
				curso.setEstado(resultSet.getInt("estado"));
				curso.setMateria(resultSet.getString("materia"));
				curso.setProfesor(resultSet.getString("apeNomProf"));
				curso.setCantAlum(resultSet.getInt("cantAlum"));
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

				curso.setId(resultSet.getInt("idcurso"));
				curso.setIdMateria(resultSet.getInt("IdMateria"));
				curso.setCuatrimestre(resultSet.getInt("cuatrimestre"));
				curso.setAnio(resultSet.getInt("anio"));
				curso.setLegajoProf(resultSet.getInt("legajo_Pro"));
				curso.setEstado(resultSet.getInt("estado"));
				curso.setMateria(resultSet.getString("materia"));
				curso.setProfesor(resultSet.getString("apeNomProf"));
				curso.setCantAlum(resultSet.getInt("cantAlum"));

				lCursos.add(curso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return lCursos;
	}

	@Override
	public boolean eliminarCurso(int Id) {
		boolean Eliminado = false;
		int Elim = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		PreparedStatement statement;
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(eliminar_Curso + Id);
			Elim = statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (Elim > 0) {
			Eliminado = true;
		}
		return Eliminado;
	}

}
