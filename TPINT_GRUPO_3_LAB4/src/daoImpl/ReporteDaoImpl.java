package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ReporteDao;
import entidades.Curso;
import entidades.Materia;
import entidades.Reporte;

public class ReporteDaoImpl implements ReporteDao{
	private static final String obtenerDatos ="SELECT * FROM tpint_grupo_3_lab4.datos_reporte ";
	
	public ArrayList<Reporte> obtenerDatos(int idcurso,int idmateria, int cuatrimestre, int anio) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String consulta = obtenerDatos;
		int cont=0;
		
		if (idcurso != 0) 
		{
			consulta = consulta + " adn idcurso= " + idcurso;
			cont++;
		}

		if (idmateria != 0) 
		{
			consulta = consulta + " and idMateria= " + idmateria;
			cont++;
		}
		if (cuatrimestre != 0) 
		{
			consulta = consulta + " and cuatrimestre= " + cuatrimestre;
			cont++;
		}
		if (anio != 0) 
		{
			consulta = consulta + " and anio= " + anio;
			cont++;
		}
		if(cont==0) 
		{
			consulta=obtenerDatos;
		}
		

		ArrayList<Reporte> listReporte = new ArrayList<Reporte>();
		PreparedStatement statement;
		ResultSet resultSet;

		Conexion conexion = Conexion.getConexion();
		try {
			statement = conexion.getSQLConexion().prepareStatement(consulta);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Reporte reporte = new Reporte();
				Curso curso = new Curso();
				Materia materia = new Materia();
				
				reporte.setTotal_alumnos(resultSet.getInt("total_alumnos"));
				reporte.setTotal_alumnos(resultSet.getInt("total_noAprobados"));
				reporte.setTotal_alumnos(resultSet.getInt("total_Aprobados"));
				
				curso.setId(resultSet.getInt("idcurso"));
				curso.setCuatrimestre(resultSet.getInt("cuatrimestre"));
				curso.setAnio(resultSet.getInt("anio"));
				reporte.setCurso(curso);
				
				materia.setId(resultSet.getInt("idMateria"));
				materia.setNombre(resultSet.getString("MAteria"));
				reporte.setMateria(materia);
				
				listReporte.add(reporte);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return listReporte;
	}
}
