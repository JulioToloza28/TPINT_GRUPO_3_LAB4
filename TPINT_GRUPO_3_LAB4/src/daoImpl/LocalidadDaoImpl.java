package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entidades.Localidad;
import entidades.Provincia;
import dao.LocalidadDao;

public class LocalidadDaoImpl implements LocalidadDao {

	private static final String ObtenerListLocalidad="SELECT * FROM tpint_grupo_3_lab4.localidad loc inner join provincia prov on loc.idprovincia=prov.idprovincia;";


	public ArrayList<Localidad> ObtenerListLocalidad()
	{
		PreparedStatement statement;
		ResultSet resultSet;
		ArrayList<Localidad> localidades=new ArrayList<Localidad>();
		Conexion conexion=Conexion.getConexion();
		try 
		{
			statement=conexion.getSQLConexion().prepareStatement(ObtenerListLocalidad);
			resultSet=statement.executeQuery();
			while(resultSet.next()) 
			{
				localidades.add(getLocalidad(resultSet));
			}
			
		}catch(SQLException e ) 
		{
			e.printStackTrace();
			
		}
		return localidades;
		
	}
	
	private Localidad getLocalidad(ResultSet resultSet) throws SQLException
	{
		Provincia prov=new Provincia();
		int id=resultSet.getInt("idlocalidad");
		String nombre=resultSet.getString("nombre");
		prov.setId(resultSet.getInt("idprovincia"));
		prov.setNombre(resultSet.getString("nombre"));
		return new Localidad(id,nombre,prov);
		
		
	}

	@Override
	public ArrayList<Localidad> obtenerListLocalidad() {
		// TODO Auto-generated method stub
		return null;
	}

}
