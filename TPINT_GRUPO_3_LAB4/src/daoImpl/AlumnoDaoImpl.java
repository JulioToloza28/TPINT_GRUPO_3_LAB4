package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.AlumnoDao;
import entidades.Alumno;
import entidades.Localidad;
import java.util.List;

public class AlumnoDaoImpl implements AlumnoDao {

	private static final String agregarAlumno = "INSERT INTO alumno(nombre, apellido, dni, fecha_nac, direccion, idlocalidad, telefono, mail, estado) values(?,?,?,?,?,?,?,?,?)";
	private static final String readAll = "SELECT a.legajo_alum,a.nombre,a.apellido,a.dni,a.fecha_nac,a.direccion,loc.nombre as Localidad,a.telefono,a.mail from alumno as a inner join localidad as loc on a.idlocalidad=loc.idlocalidad  where estado=1;";

	public boolean agregarAlumno(Alumno alumno) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {

			statement = conexion.prepareStatement(agregarAlumno);
			statement.setString(1, alumno.getNombre());
			statement.setString(2, alumno.getApellido());
			statement.setString(3, alumno.getDni());
			statement.setDate(4, (Date) alumno.getFechaNac());
			statement.setString(5, alumno.getDireccion());
			statement.setInt(6, alumno.getLocalidad().getId());
			statement.setString(7, alumno.getTelefono());
			statement.setString(8, alumno.getMail());
			statement.setBoolean(9, alumno.getEstado());
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			try {
				conexion.rollback();
			} catch (Exception ex1) {
				ex1.printStackTrace();
			}
		}
		return isInsertExitoso;
	}

	public ArrayList<Alumno> readAll() {

		ArrayList<Alumno> listAlumno = new ArrayList<Alumno>();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(readAll);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Localidad loc = new Localidad();
				loc.setNombre(resultSet.getString("Localidad"));
				Alumno alum = new Alumno();
				alum.setLegajo(resultSet.getInt("legajo_alum"));
				alum.setNombre(resultSet.getString("Nombre"));
				alum.setApellido(resultSet.getString("Apellido"));
				alum.setDni(resultSet.getString("Dni"));
				String fecha = resultSet.getString("FechaNac");
				// alum.setFechaNac(fecha);
				alum.setDireccion(resultSet.getString("Direccion"));
				alum.setLocalidad(loc);
				alum.setTelefono(resultSet.getString("Telefono"));
				alum.setMail(resultSet.getString("Mail"));
				listAlumno.add(alum);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listAlumno;
	}

}