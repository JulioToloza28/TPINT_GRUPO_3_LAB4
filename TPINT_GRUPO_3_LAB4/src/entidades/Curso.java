package entidades;

public class Curso {
	private int Id;
	private int IdMateria;
	private Materia Materia;
	private int Cuatrimestre;
	private int LegajoProf;
	private Profesor Profesor;
	private int Estado;
	
	public Curso() {}
	
	public Curso(int id, int idMateria, int cuatrimestre, int legajoProf, int estado) {
		this.Id = id;
		this.Cuatrimestre = cuatrimestre;
		this.Estado = estado;
		this.IdMateria = idMateria;
		this.LegajoProf = legajoProf;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getIdMateria() {
		return IdMateria;
	}

	public void setIdMateria(int idMateria) {
		IdMateria = idMateria;
	}

	public Materia getMateria() {
		return Materia;
	}

	public void setMateria(Materia materia) {
		Materia = materia;
	}

	public int getCuatrimestre() {
		return Cuatrimestre;
	}

	public void setCuatrimestre(int cuatrimestre) {
		Cuatrimestre = cuatrimestre;
	}

	public int getLegajoProf() {
		return LegajoProf;
	}

	public void setLegajoProf(int legajoProf) {
		LegajoProf = legajoProf;
	}

	public Profesor getProfesor() {
		return Profesor;
	}

	public void setProfesor(Profesor profesor) {
		Profesor = profesor;
	}

	public int getEstado() {
		return Estado;
	}

	public void setEstado(int estado) {
		Estado = estado;
	}
	
	

	
	
}
