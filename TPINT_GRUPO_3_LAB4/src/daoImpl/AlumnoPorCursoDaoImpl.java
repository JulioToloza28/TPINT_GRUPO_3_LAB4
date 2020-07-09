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
import entidades.EstadoAcademico;


public class AlumnoPorCursoDaoImpl implements AlumnoPorCursoDao{
	
	private static final String readAll ="SELECT * FROM tpint_grupo_3_lab4.listar_notas";


	@Override
	public ArrayList<AlumnosPorCursos> readAll() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<AlumnosPorCursos> listAlumnoConNotas = new ArrayList<AlumnosPorCursos>();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(readAll);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Alumno alum=new Alumno();
				EstadoAcademico EstadoA=new EstadoAcademico();
				AlumnosPorCursos notas = new AlumnosPorCursos();
				alum.setLegajo(resultSet.getInt("legajoAlumno"));
				alum.setNombre(resultSet.getString("Alumno"));
				notas.setParcial1(resultSet.getInt("notaParcial1"));
				notas.setParcial2(resultSet.getInt("notaParcial2"));
				notas.setRecuperatorio1(resultSet.getInt("notaRecuperatorio1"));
				notas.setRecuperatorio2(resultSet.getInt("notaRecuperatorio2")); 
				EstadoA.setId(resultSet.getInt("idEstadoAcademico"));
				EstadoA.setNombres(resultSet.getString("Estado_Academico"));
				notas.setEstadoAca(EstadoA);
				notas.setEstado(resultSet.getBoolean("estado"));
				 
				
				
				listAlumnoConNotas.add(notas);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listAlumnoConNotas;
	}

	@Override
	public boolean agregarAlumno(AlumnosPorCursos NotaDelAgregado) {
		// TODO Auto-generated method stub
		return false;
	}

}
