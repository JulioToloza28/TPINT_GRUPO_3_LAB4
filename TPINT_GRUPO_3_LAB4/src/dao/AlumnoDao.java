package dao;
import java.util.ArrayList;
import java.util.List;
import entidades.Alumno;

public interface AlumnoDao {

	public boolean agregarAlumno(Alumno alumnoAgregado);
	public ArrayList<Alumno> readAll();
	//public boolean borrarAlumno(Alumno alumnoEliminado);
}
