
package dao;
import java.util.ArrayList;
import java.util.List;
import entidades.Alumno;

public interface AlumnoDao {

	public boolean agregarAlumno(Alumno alumnoAgregado);
	public ArrayList<Alumno> readAll();
	public Alumno ObtenerAlumno (int Legajo);
	public boolean modificarAlumno(Alumno alumnoModificado);
	//public boolean borrarAlumno(Alumno alumnoEliminado);
	public ArrayList<Alumno> getAlumnosInscriptos(int IdCurso);
}


