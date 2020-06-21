package entidades;

public class Profesor extends Persona {
	private Cursos Curso;

	public Cursos getCurso() {
		return Curso;
	}

	public void setCurso(Cursos curso) {
		Curso = curso;
	}

}
