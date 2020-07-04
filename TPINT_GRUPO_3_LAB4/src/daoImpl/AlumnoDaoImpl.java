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
import entidades.Provincia;

import java.util.List;

public class AlumnoDaoImpl implements AlumnoDao {

	private static final String agregarAlumno = "INSERT INTO alumno(nombre, apellido, dni, fecha_nac, direccion, idlocalidad, telefono, mail, estado) values(?,?,?,?,?,?,?,?,?)";
	private static final String readAll = "SELECT a.legajo_alum,a.nombre as Alumno,a.apellido,a.dni,a.fecha_nac,a.direccion,loc.idlocalidad,loc.nombre as Localidad,prov.idprovincia,prov.nombre as Provincia,a.telefono,a.mail from alumno as a inner join localidad as loc on a.idlocalidad=loc.idlocalidad inner join provincia as prov on prov.idprovincia=loc.idprovincia  where estado=1;";
	private static final String obtenerAlumnosInscriptos = "SELECT distinct a.legajo_alum,a.nombre as Alumno,a.apellido,a.dni,a.fecha_nac,a.direccion,loc.idlocalidad,loc.nombre as Localidad,prov.idprovincia,prov.nombre as Provincia,a.telefono,a.mail from alumno as a inner join localidad as loc on a.idlocalidad=loc.idlocalidad inner join provincia as prov on prov.idprovincia=loc.idprovincia inner join alumnoxcurso as alXcu on legajo_alum=legajoalumno where estado=1 and idCurso=";

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
				loc.setNombre(resultSet.getString("Localidad"));
				provincia.setId(resultSet.getInt("idprovincia"));
				String pr = resultSet.getString("Provincia");
				provincia.setNombreProv("Prueba");
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

	@Override
	public ArrayList<Alumno> getAlumnosInscriptos(int IdCurso) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Alumno> listAlumno = new ArrayList<Alumno>();
		Alumno alumno = null;
		Localidad localidad = null;
		Provincia provincia = null;
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(obtenerAlumnosInscriptos + IdCurso);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				localidad = new Localidad();
				provincia = new Provincia();
				alumno = new Alumno();
				alumno.setLegajo(resultSet.getInt("legajo_alum"));
				alumno.setNombre(resultSet.getString("Alumno"));
				alumno.setApellido(resultSet.getString("Apellido"));
				alumno.setDni(resultSet.getString("Dni"));
				alumno.setFechaNac(resultSet.getDate("fecha_nac"));
				alumno.setDireccion(resultSet.getString("direccion"));
				localidad.setId(resultSet.getInt("idlocalidad"));
				localidad.setNombre(resultSet.getString("Localidad"));
				provincia.setId(resultSet.getInt("idprovincia"));
				provincia.setNombreProv(resultSet.getString("Provincia"));
				localidad.setProvincia(provincia);
				alumno.setLocalidad(localidad);
				alumno.setTelefono(resultSet.getString("telefono"));
				alumno.setMail(resultSet.getString("mail"));
				listAlumno.add(alumno);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listAlumno;
	}

}