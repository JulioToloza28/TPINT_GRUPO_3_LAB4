package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.AlumnoDao;
import entidades.Alumno;
import java.util.List;


public class AlumnoDaoImpl implements AlumnoDao {
	
	private static final String agregarAlumno = "INSERT INTO alumno(nombre, apellido, dni, legajo, fecha_nac, direccion, idlocalidad, telefono, mail, estado) values(?,?,?,?,?,?,?,?,?,?)";

	public boolean agregarAlumno(Alumno alumno) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso=false;
		try {
			
			statement=conexion.prepareStatement(agregarAlumno);
			statement.setString(1, alumno.getNombre());
			statement.setString(2, alumno.getApellido());
			statement.setString(3, alumno.getDni());
			statement.setInt(4, alumno.getLegajo());
			statement.setDate(5, (Date)alumno.getFechaNac());
			statement.setString(6, alumno.getDireccion());
			statement.setInt(7, alumno.getIdLocalidad());
			statement.setString(8, alumno.getTelefono());
			statement.setString(9, alumno.getMail());
			statement.setBoolean(10, alumno.getEstado());
			
			
			if(statement.executeUpdate()>0) {
				conexion.commit();
				isInsertExitoso=true;
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
			try {
				conexion.rollback();
			}
				catch(Exception ex1) {
					ex1.printStackTrace();
				}
			}
		return isInsertExitoso;
		}
	}
