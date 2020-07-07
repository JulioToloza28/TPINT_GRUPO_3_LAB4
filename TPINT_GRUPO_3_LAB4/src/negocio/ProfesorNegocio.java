package negocio;

import java.util.ArrayList;

import entidades.Profesor;

public interface ProfesorNegocio {
	
	public ArrayList<Profesor> listarProfe();
	
	public boolean agregarProfesor(Profesor profesorAgregado);
	
}
