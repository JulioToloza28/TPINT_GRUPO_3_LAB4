package negocio;

import java.util.ArrayList;

import entidades.Curso;

public interface CursoNegocio {
	public Curso buscarCurso(int Id);

	public ArrayList<Curso> listarCursos();

	public boolean eliminarCurso(int Id);

	public boolean GrabarCurso(Curso curso);

	public int UltimoId();
	
	public boolean InsertarAlumnoAlCurso(int idCurso, String legajoAlumno);
	
	public boolean ActualizarCurso(Curso curso);
}
