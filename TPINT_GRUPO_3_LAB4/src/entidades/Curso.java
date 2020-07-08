package entidades;

public class Curso {
	private int Id;
	private int IdMateria;
	private int Cuatrimestre;
	private int Anio;
	private int LegajoProf;
	private int Estado;
	private String Materia;
	private String Profesor;
	private int CantAlum;

	public Curso() {
	}

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

	public int getCuatrimestre() {
		return Cuatrimestre;
	}

	public void setCuatrimestre(int cuatrimestre) {
		Cuatrimestre = cuatrimestre;
	}

	public int getAnio() {
		return Anio;
	}

	public void setAnio(int anio) {
		Anio = anio;
	}

	public int getLegajoProf() {
		return LegajoProf;
	}

	public void setLegajoProf(int legajoProf) {
		LegajoProf = legajoProf;
	}

	public int getEstado() {
		return Estado;
	}

	public void setEstado(int estado) {
		Estado = estado;
	}

	public String getMateria() {
		return Materia;
	}

	public void setMateria(String materia) {
		Materia = materia;
	}

	public String getProfesor() {
		return Profesor;
	}

	public void setProfesor(String profesor) {
		Profesor = profesor;
	}

	public int getCantAlum() {
		return CantAlum;
	}

	public void setCantAlum(int cantAlum) {
		CantAlum = cantAlum;
	}

	@Override
	public String toString() {
		return "Curso [Id=" + Id + ", IdMateria=" + IdMateria + ", Cuatrimestre=" + Cuatrimestre + ", Anio=" + Anio
				+ ", LegajoProf=" + LegajoProf + ", Estado=" + Estado + ", Materia=" + Materia + ", Profesor="
				+ Profesor + ", CantAlum=" + CantAlum + "]";
	}

}
