package entidades;

public class Reporte {
	private int Id;
	private Curso curso;
	private Materia materia;
	private int total_no_aprobados;
	private int total_aprobados;
	private int total_alumnos;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public Materia getMateria() {
		return materia;
	}
	public void setMateria(Materia materia) {
		this.materia = materia;
	}
	public int getTotal_no_aprobados() {
		return total_no_aprobados;
	}
	public void setTotal_no_aprobados(int total_no_aprobados) {
		this.total_no_aprobados = total_no_aprobados;
	}
	public int getTotal_aprobados() {
		return total_aprobados;
	}
	public void setTotal_aprobados(int total_aprobados) {
		this.total_aprobados = total_aprobados;
	}
	public int getTotal_alumnos() {
		return total_alumnos;
	}
	public void setTotal_alumnos(int total_alumnos) {
		this.total_alumnos = total_alumnos;
	}
	@Override
	public String toString() {
		return "Reporte [Id=" + Id + ", curso=" + curso + ", materia=" + materia + ", total_no_aprobados="
				+ total_no_aprobados + ", total_aprobados=" + total_aprobados + ", total_alumnos=" + total_alumnos
				+ "]";
	}
	
	

}
