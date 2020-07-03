package entidades;

public class Profesor extends Persona {
	private Curso Curso;

	public Curso getCurso() {
		return Curso;
	}

	public void setCurso(Curso curso) {
		Curso = curso;
	}

}
