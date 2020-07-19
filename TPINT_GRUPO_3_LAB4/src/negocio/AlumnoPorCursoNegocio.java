package negocio;

import java.util.ArrayList;

import entidades.AlumnosPorCursos;

public interface AlumnoPorCursoNegocio {

	public ArrayList<AlumnosPorCursos> ObtenerCalificacionesAlumnos(int IdCurso);
}
