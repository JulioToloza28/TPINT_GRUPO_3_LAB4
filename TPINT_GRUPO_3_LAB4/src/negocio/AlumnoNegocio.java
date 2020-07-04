package negocio;
import java.util.ArrayList;
import java.util.List;

import entidades.Alumno;

public interface AlumnoNegocio  {

	public boolean agregarAlumno(Alumno alumnoAgregado);
	public ArrayList<Alumno> readAll();
	public ArrayList<Alumno> getAlumnosInscriptos(int IdCurso);
}
