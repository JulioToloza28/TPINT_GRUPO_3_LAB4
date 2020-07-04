package dao;

import java.util.ArrayList;

import entidades.Curso;

public interface CursoDao {

	public Curso buscarCurso(int Id);

	public ArrayList<Curso> listarCursos();
	
	public boolean eliminarCurso(int Id);
	

}
