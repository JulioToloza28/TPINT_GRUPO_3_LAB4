package entidades;

public class Cursos {
	private int Id;
	private int Cuatrimestre;
	private int Estado;
	private Materia Materia;
	private Profesor Profesor;
	
	public Cursos() {}
	
	public Cursos(int id, int cuatrimestre, int estado, entidades.Materia materia, entidades.Profesor profesor) {
		this.Id = id;
		this.Cuatrimestre = cuatrimestre;
		this.Estado = estado;
		this.Materia = materia;
		this.Profesor = profesor;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getCuatrimestre() {
		return Cuatrimestre;
	}
	public void setCuatrimestre(int cuatrimestre) {
		Cuatrimestre = cuatrimestre;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	public Materia getMateria() {
		return Materia;
	}
	public void setMateria(Materia materia) {
		Materia = materia;
	}
	public Profesor getProfesor() {
		return Profesor;
	}
	public void setProfesor(Profesor profesor) {
		Profesor = profesor;
	}
	@Override
	public String toString() {
		return "Cursos [Id=" + Id + ", Cuatrimestre=" + Cuatrimestre + ", Estado=" + Estado + ", Materia=" + Materia
				+ ", Profesor=" + Profesor + "]";
	}
	
}
