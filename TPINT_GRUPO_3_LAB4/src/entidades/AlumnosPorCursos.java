package entidades;

public class AlumnosPorCursos {
	private int Id;
	private Alumno Alumno;
	private Cursos Curso;
	private int Parcial1;
	private int Parcial2;
	private int Recuperatorio1;
	private int Recuperatorio2;
	private String EstadoCursada;
	
	public AlumnosPorCursos() {}
	
	public AlumnosPorCursos(int id, entidades.Alumno alumno, Cursos curso, int parcial1, int parcial2,
			int recuperatorio1, int recuperatorio2, String estadoCursada) {
		this.Id = id;
		this.Alumno = alumno;
		this.Curso = curso;
		this.Parcial1 = parcial1;
		this.Parcial2 = parcial2;
		this.Recuperatorio1 = recuperatorio1;
		this.Recuperatorio2 = recuperatorio2;
		this.EstadoCursada = estadoCursada;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Alumno getAlumno() {
		return Alumno;
	}
	public void setAlumno(Alumno alumno) {
		Alumno = alumno;
	}
	public Cursos getCurso() {
		return Curso;
	}
	public void setCurso(Cursos curso) {
		Curso = curso;
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
	public String getEstadoCursada() {
		return EstadoCursada;
	}
	public void setEstadoCursada(String estadoCursada) {
		EstadoCursada = estadoCursada;
	}
	@Override
	public String toString() {
		return "AlumnosPorCursos [Id=" + Id + ", Alumno=" + Alumno + ", Curso=" + Curso + ", Parcial1=" + Parcial1
				+ ", Parcial2=" + Parcial2 + ", Recuperatorio1=" + Recuperatorio1 + ", Recuperatorio2=" + Recuperatorio2
				+ ", EstadoCursada=" + EstadoCursada + "]";
	}
}
