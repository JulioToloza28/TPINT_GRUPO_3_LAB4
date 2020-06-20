package daoImpl;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	
	public static Conexion instancia;
	private Connection connection;
	
	private Conexion()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Sql_tpint_grupo_3","root","root");
			this.connection.setAutoCommit(false);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public static Conexion getConexion() {
		
		if(instancia==null) {
			instancia=new Conexion();
		}
		return instancia;
	}
	
	public Connection getSQLConexion() {
		return this.connection;
	}
	
	public void cerrarConexion() {
		try {
			this.connection.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		instancia=null;
	}

}
