package entidades;

public class AlumnosPorCursos {
	private int Id;
	private Alumno alumno;
	private Curso curso;
	private int Parcial1;
	private int Parcial2;
	private int Recuperatorio1;
	private int Recuperatorio2;
	private int EstadoAcademico;
	private Boolean Estado;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Alumno getAlumno() {
		return alumno;
	}
	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public int getParcial1() {
		return Parcial1;
	}
	public void setParcial1(int parcial1) {
		Parcial1 = parcial1;
	}
	public int getParcial2() {
		return Parcial2;
	}
	public void setParcial2(int parcial2) {
		Parcial2 = parcial2;
	}
	public int getRecuperatorio1() {
		return Recuperatorio1;
	}
	public void setRecuperatorio1(int recuperatorio1) {
		Recuperatorio1 = recuperatorio1;
	}
	public int getRecuperatorio2() {
		return Recuperatorio2;
	}
	public void setRecuperatorio2(int recuperatorio2) {
		Recuperatorio2 = recuperatorio2;
	}
	public int getEstadoAcademico() {
		return EstadoAcademico;
	}
	public void setEstadoAcademico(int estadoAcademico) {
		EstadoAcademico = estadoAcademico;
	}
	public Boolean getEstado() {
		return Estado;
	}
	public void setEstado(Boolean estado) {
		Estado = estado;
	}
}
