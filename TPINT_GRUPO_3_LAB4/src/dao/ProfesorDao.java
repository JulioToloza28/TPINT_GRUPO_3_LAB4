package dao;

import java.util.ArrayList;

import entidades.Profesor;

public interface ProfesorDao {
	
	public boolean agregarProfesor(Profesor profesorAgregado);
	public ArrayList<Profesor> listarProfe();
}
