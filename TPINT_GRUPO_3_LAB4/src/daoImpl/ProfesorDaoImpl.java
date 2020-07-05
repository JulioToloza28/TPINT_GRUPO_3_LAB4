package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ProfesorDao;
import entidades.Localidad;
import entidades.Profesor;
import entidades.Provincia;

public class ProfesorDaoImpl implements ProfesorDao{

	private static final String agregarProfesor="INSERT INTO PROFESOR(NOMBRE,APELLIDO,DNI,FECHA_NAC,DIRECCION,IDLOCALIDAD,TELEFONO,MAIL,ESTADO)VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String listarProfe="SELECT * FROM tpint_grupo_3_lab4.profesor where estado=1;";
	private static final String readAll = "SELECT p.legajo_Pro,p.nombre as Profesor,p.apellido,p.dni,p.fecha_nac,p.direccion,loc.idlocalidad,loc.nombre as Localidad,prov.idprovincia,prov.nombre as Provincia,p.telefono,p.mail from profesor as p inner join localidad as loc on p.idlocalidad=loc.idlocalidad inner join provincia as prov on prov.idprovincia=loc.idprovincia  where estado=1;";
	
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

	@Override
	public ArrayList<Profesor> listarProfe() {
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
				String pr = resultSet.getString("Provincia");
				provincia.setNombreProv("Prueba");
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

}
