package entidades;

public class Materia {
	
	private int id;
	private String Nombre;
	
	public Materia() {
	}
	
	public Materia(int id, String nombre) {
		this.id = id;
		this.Nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	@Override
	public String toString() {
		return "Materia [id=" + id + ", Nombre=" + Nombre + "]";
	}

}
