package negocioImpl;

import java.util.ArrayList;

import dao.CursoDao;
import daoImpl.CursoDaoImpl;
import entidades.Curso;
import negocio.CursoNegocio;

public class CursoNegocioImpl implements CursoNegocio {

	private CursoDao cursoDao = new CursoDaoImpl();

	@Override
	public Curso buscarCurso(int Id) {
		Curso curso = new Curso();
		curso = cursoDao.buscarCurso(Id);
		return curso;

	}

	@Override
	public ArrayList<Curso> listarCursos() {
		ArrayList<Curso> lCurso = cursoDao.listarCursos();
		return lCurso;
	}

	@Override
	public boolean eliminarCurso(int Id) {
		boolean eliminado = cursoDao.eliminarCurso(Id);
		return eliminado;
	}

	@Override
	public boolean GrabarCurso(Curso curso) {
		boolean estadoGrabado = cursoDao.GrabarCurso(curso);
		return estadoGrabado;
	}

	@Override
	public int UltimoId() {
		int id = cursoDao.UltimoId();
		return id;
	}

	@Override
	public boolean InsertarAlumnoAlCurso(int idCurso, String legajoAlumno) {
		boolean estadoGrabado = cursoDao.InsertarAlumnoAlCurso(idCurso, legajoAlumno);
		return estadoGrabado;
	}

}
