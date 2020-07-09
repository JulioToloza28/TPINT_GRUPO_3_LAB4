package daoImpl;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.AlumnoPorCursoDao;
import entidades.Alumno;
import entidades.AlumnosPorCursos;
import entidades.Localidad;
import entidades.Provincia;

public class AlumnoPorCursoDaoImpl implements AlumnoPorCursoDao{
	private static final String readAll ="SELECT * FROM tpint_grupo_3_lab4.alumnoxcurso where estado=1";

	public ArrayList<AlumnosPorCursos> ListarAlumXCurso() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<AlumnosPorCursos> listAlumno = new ArrayList<AlumnosPorCursos>();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(readAll);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				
				AlumnosPorCursos notas = new AlumnosPorCursos();
				notas.setId(resultSet.getInt("idAlumnoXCurso"));
				notas.setParcial1(resultSet.getInt("notaParcial1"));
				
				
				
				listAlumno.add(notas);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listAlumno;
	}

	@Override
	public ArrayList<AlumnosPorCursos> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
