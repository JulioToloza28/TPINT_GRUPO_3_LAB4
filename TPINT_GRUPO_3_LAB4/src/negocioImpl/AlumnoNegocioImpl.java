package negocioImpl;
import java.util.List;
import dao.AlumnoDao;
import daoImpl.AlumnoDaoImpl;
import entidades.Alumno;
import negocio.AlumnoNegocio;

public class AlumnoNegocioImpl implements AlumnoNegocio {
	
	AlumnoDao alumDao = new AlumnoDaoImpl();
	
	//@Override
	public boolean agregarAlumno(Alumno alumnoAgregado) {
		boolean estado = false;
		if(alumnoAgregado.getNombre().trim().length()>0 && 
		   alumnoAgregado.getApellido().trim().length()>0 &&
		   alumnoAgregado.getDni().trim().length()>0 &&
		   alumnoAgregado.getLegajo().trim().length()>0 &&
		   alumnoAgregado.getFechaNac()!= null &&
		   alumnoAgregado.getDireccion().trim().length()>0 &&
		   alumnoAgregado.getIdLocalidad() != 0 &&
		   alumnoAgregado.getTelefono().trim().length()>0 &&
		   alumnoAgregado.getMail().trim().length()>0
		  ){
			estado = alumDao.agregarAlumno(alumnoAgregado); 
			}
		return estado;
	}
}
