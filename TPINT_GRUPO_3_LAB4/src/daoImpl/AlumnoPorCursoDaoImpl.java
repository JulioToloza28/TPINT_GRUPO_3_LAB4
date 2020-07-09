package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.AlumnoDao;
import dao.AlumnoPorCursoDao;
import entidades.Alumno;
import entidades.Localidad;
import entidades.Provincia;


public class AlumnoPorCursoDaoImpl implements AlumnoPorCursoDao {

	private static final String leerAlumnoPorCurso = "";
	
	public ArrayList<Alumno> readAll() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Alumno> listAlumno = new ArrayList<Alumno>();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(readAll);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Localidad loc = new Localidad();
				Provincia provincia = new Provincia();
				Alumno alum = new Alumno();
				alum.setLegajo(resultSet.getInt("legajo_alum"));
				alum.setNombre(resultSet.getString("Alumno"));
				alum.setApellido(resultSet.getString("Apellido"));
				alum.setDni(resultSet.getString("Dni"));
				alum.setFechaNac(resultSet.getDate("fecha_nac"));
				alum.setDireccion(resultSet.getString("direccion"));
				loc.setId(resultSet.getInt("idlocalidad"));
				loc.setNombreLoc(resultSet.getString("Localidad"));
				provincia.setId(resultSet.getInt("idprovincia"));
				provincia.setNombreProv(resultSet.getString("Provincia"));
				loc.setProvincia(provincia);
				alum.setLocalidad(loc);
				alum.setTelefono(resultSet.getString("telefono"));
				alum.setMail(resultSet.getString("mail"));
				listAlumno.add(alum);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listAlumno;
	}

}
