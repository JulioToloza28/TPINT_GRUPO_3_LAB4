package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import daoImpl.Conexion;
import dao.CursoDao;
import entidades.Curso;

public class CursoDaoImpl implements CursoDao {

	String listarTodos = "SELECT * FROM tpint_grupo_3_lab4.listar_cursos";
	String buscarxId = "SELECT * FROM tpint_grupo_3_lab4.listar_cursos where idcurso=";
	String eliminar_Curso = "UPDATE tpint_grupo_3_lab4.curso SET estado = 0 WHERE idcurso = ";
	String agregarCurso = "insert into curso (IdMateria, Cuatrimestre, Anio, Legajo_pro, Estado) VALUES(?, ?, ?, ?, ?)";
	String InsertarAlumnoalCurso = "insert into tpint_grupo_3_lab4.alumnoxcurso (IdCurso, LegajoAlumno, idEstadoAcademico) VALUES (?, ? , 2)";

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
		Connection conexion = Conexion.getConexion().getSQLConexion();
		try {
			statement = conexion.prepareStatement(eliminar_Curso + Id);
			Elim = statement.executeUpdate();
			conexion.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (Elim > 0) {
			Eliminado = true;
		}
		return Eliminado;
	}
	

	@Override
	public boolean GrabarCurso(Curso curso) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean Grabado = false;
		try {
			statement = conexion.prepareStatement(agregarCurso);
			statement.setInt(1, curso.getIdMateria());
			statement.setInt(2, curso.getCuatrimestre());
			statement.setInt(3, curso.getAnio());
			statement.setInt(4, curso.getLegajoProf());
			statement.setBoolean(5, true);
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				Grabado = true;
			}
		} catch (SQLException e) {

			try {
				conexion.rollback();
			} catch (SQLException e1) {

				return Grabado;
			}
			return Grabado;
		}
		return Grabado;
	}
	
	@Override
	public int UltimoId() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		PreparedStatement statement;
		ResultSet resultSet;
		int ultimoID = 0;
		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion()
					.prepareStatement("SELECT idcurso FROM tpint_grupo_3_lab4.curso order by idCurso desc LIMIT 1");
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				ultimoID = (resultSet.getInt("idcurso"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ultimoID;
	}

	@Override
	public boolean InsertarAlumnoAlCurso(int idCurso, String legajoAlumno) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {
			statement = conexion.prepareStatement(InsertarAlumnoalCurso);
			statement.setInt(1, idCurso);
			statement.setInt(2, Integer.parseInt(legajoAlumno.toString()));
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {

			try {
				conexion.rollback();
			} catch (SQLException e1) {
				return isInsertExitoso;
			}
		}
		return isInsertExitoso;
	}

}
