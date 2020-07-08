package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.DriverManager;

import java.util.List;

import dao.ProfesorDao;
import entidades.Alumno;
import entidades.Localidad;
import entidades.Profesor;
import entidades.Provincia;

public class ProfesorDaoImpl implements ProfesorDao{

	private static final String agregarProfesor="INSERT INTO profesor(nombre, apellido, dni, fecha_nac, direccion, idlocalidad, telefono, mail, estado) values(?,?,?,?,?,?,?,?,?);";
	//private static final String listarProfe="SELECT * FROM tpint_grupo_3_lab4.profesor where estado=1;";
	private static final String readAll = "SELECT p.legajo_Pro,p.nombre as Profesor,p.apellido,p.dni,p.fecha_nac,p.direccion,loc.idlocalidad,loc.nombre as Localidad,prov.idprovincia,prov.nombre as Provincia,p.telefono,p.mail from profesor as p inner join localidad as loc on p.idlocalidad=loc.idlocalidad inner join provincia as prov on prov.idprovincia=loc.idprovincia  where estado=1;";
	private static final String leerProfesor = "SELECT p.legajo_Pro,p.nombre as Profesor,p.apellido,p.dni,p.fecha_nac,p.direccion,loc.idlocalidad,loc.nombre as Localidad,prov.idprovincia,prov.nombre as Provincia,p.telefono,p.mail from profesor as p inner join localidad as loc on p.idlocalidad=loc.idlocalidad inner join provincia as prov on prov.idprovincia=loc.idprovincia  where estado=1 and legajo_Pro=?;";
	private static final String modificarProfesor= "UPDATE profesor set nombre=?,apellido=?, dni=?, fecha_nac=?, direccion=?, Idlocalidad=?, telefono=?, mail=? where legajo_Pro= ?";

	public boolean agregarProfesor(Profesor profesor)
	{
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {
			statement = conexion.prepareStatement(agregarProfesor);
			statement.setString(1, profesor.getNombre());
			statement.setString(2, profesor.getApellido());
			statement.setString(3, profesor.getDni());
			statement.setDate(4, (Date) profesor.getFechaNac());
			statement.setString(5, profesor.getDireccion());
			statement.setInt(6, profesor.getLocalidad().getId());
			statement.setString(7, profesor.getTelefono());
			statement.setString(8, profesor.getMail());
			statement.setBoolean(9, profesor.getEstado());
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
			
	@Override
	public ArrayList<Profesor> listarProfesores() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Profesor> listProfesor = new ArrayList<Profesor>();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(readAll);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Localidad loc = new Localidad();
				Provincia provincia = new Provincia();
				Profesor profe = new Profesor();
				profe.setLegajo(resultSet.getInt("legajo_Pro"));
				profe.setNombre(resultSet.getString("Profesor"));
				profe.setApellido(resultSet.getString("Apellido"));
				profe.setDni(resultSet.getString("Dni"));
				profe.setFechaNac(resultSet.getDate("fecha_nac"));
				profe.setDireccion(resultSet.getString("direccion"));
				loc.setId(resultSet.getInt("idlocalidad"));
				loc.setNombreLoc(resultSet.getString("Localidad"));
				provincia.setId(resultSet.getInt("idprovincia"));
				provincia.setNombreProv(resultSet.getString("Provincia"));
				loc.setProvincia(provincia);
				profe.setLocalidad(loc);
				profe.setTelefono(resultSet.getString("telefono"));
				profe.setMail(resultSet.getString("mail"));
				listProfesor.add(profe);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listProfesor;
	} 
	
	//obtener profesor
	public Profesor ObtenerProfesor(int Legajo) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Profesor profe = new Profesor();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(leerProfesor);
			statement.setInt((1), Legajo);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Localidad loc = new Localidad();
				Provincia provincia = new Provincia();
				profe.setLegajo(resultSet.getInt("legajo_Pro"));
				profe.setNombre(resultSet.getString("Profesor"));
				profe.setApellido(resultSet.getString("Apellido"));
				profe.setDni(resultSet.getString("Dni"));
				profe.setFechaNac(resultSet.getDate("fecha_nac"));
				profe.setDireccion(resultSet.getString("direccion"));
				loc.setId(resultSet.getInt("idlocalidad"));
				loc.setNombreLoc(resultSet.getString("Localidad"));
				provincia.setId(resultSet.getInt("idprovincia"));
				String pr = resultSet.getString("Provincia");
				provincia.setNombreProv("Prueba");
				loc.setProvincia(provincia);
				profe.setLocalidad(loc);
				profe.setTelefono(resultSet.getString("telefono"));
				profe.setMail(resultSet.getString("mail"));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return profe;
	}
	
	// modificar profesor
	public boolean modificarProfesor(Profesor profe) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {

			statement = conexion.prepareStatement(modificarProfesor);
			statement.setString(1, profe.getNombre());
			statement.setString(2, profe.getApellido());
			statement.setString(3, profe.getDni());
			statement.setDate(4, (Date) profe.getFechaNac());
			statement.setString(5, profe.getDireccion());
			statement.setInt(6, profe.getLocalidad().getId());
			statement.setString(7, profe.getTelefono());
			statement.setString(8, profe.getMail());
			statement.setInt(9, profe.getLegajo());
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

}
