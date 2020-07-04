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
	private static final String readAll = "SELECT * from alumno where estado=1";

	public boolean agregarAlumno(Alumno alumno) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {

			statement = conexion.prepareStatement(agregarAlumno);
			statement.setString(1, alumno.getNombre());
			statement.setString(2, alumno.getApellido());
			statement.setString(3, alumno.getDni());
			// statement.setInt(4, alumno.getLegajo());
			statement.setDate(4, (Date) alumno.getFechaNac());
			statement.setString(5, alumno.getDireccion());
			//CORREGIR Y PONER POR get
			statement.setInt(6, 1);
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

	public ArrayList<Alumno> readAll(){
		
		ArrayList<Alumno> listAlumno = new ArrayList<Alumno>();
		PreparedStatement statement;
		ResultSet resultSet;
		
		Conexion conexion = Conexion.getConexion();
		try {
			statement=conexion.getSQLConexion().prepareStatement(readAll);
			resultSet = statement.executeQuery();
	 		 while(resultSet.next()) 
	 		  {
	 			 Localidad loc = new Localidad();
	 			 loc.setId(1);
	 			 Alumno alum = new Alumno();
	 			 alum.setLegajo(resultSet.getInt("legajo"));
	 			 alum.setNombre(resultSet.getString("Nombre"));
	 			 alum.setApellido(resultSet.getString("Apellido"));
	 			 alum.setDni(resultSet.getString("Dni"));
	 			 //alum.setFechaNac(resultSet.getString("FechaNac"));
	 			 alum.setDireccion(resultSet.getString("Direccion"));
	 			 alum.setLocalidad(loc);
	 			 //FALTA DATO PROVINCIA
	 			 alum.setTelefono(resultSet.getString("Telefono"));
	 			 alum.setMail(resultSet.getString("Mail"));
	 			 //alum.setEstado(resultSet.set("Estado"));
	 			 listAlumno.add(alum); 
	 		  }
		  }
	 		catch(SQLException ex) 
	 	 	{
	 	 		ex.printStackTrace();
	 	 	}
	 	 	return listAlumno;
		}
		

}