package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import dao.ProfesorDao;
import entidades.Profesor;

public class ProfesorDaoImpl implements ProfesorDao{

	private static final String agregarProfesor="INSERT INTO PROFESOR(NOMBRE,APELLIDO,DNI,FECHA_NAC,DIRECCION,IDLOCALIDAD,TELEFONO,MAIL,ESTADO)VALUES(?,?,?,?,?,?,?,?,?)";
	
	public boolean agregarProfesor(Profesor profesor)
	{
		PreparedStatement statement;
		Connection conexion=Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso=false;
		try {
			statement=conexion.prepareStatement(agregarProfesor);
			statement.setString(1,profesor.getNombre());
			statement.setString(2,profesor.getApellido());
			statement.setString(3, profesor.getDni());
			statement.setDate(4,(Date)profesor.getFechaNac());
			statement.setString(5, profesor.getDireccion());
			//CORREGIR Y PONER POR get
			statement.setInt(6,1);
			statement.setString(7,profesor.getTelefono());
			statement.setString(8,profesor.getMail());
			statement.setBoolean(9, profesor.getEstado());
			
			if(statement.executeUpdate()>0) 
			{
				conexion.commit();
				isInsertExitoso=true;
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			try {
				conexion.rollback();
			}
			catch(Exception ex) 
			{
				ex.printStackTrace();
			}
		}		
		
		return isInsertExitoso;
		
	} 

}
