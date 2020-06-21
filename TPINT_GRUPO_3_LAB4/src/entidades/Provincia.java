package entidades;

public class Provincia {
	private int Id;
	private String Nombre;
	
	public Provincia() {
	}
	
	public Provincia(int id, String nombre) {
		this.Id = id;
		this.Nombre = nombre;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	@Override
	public String toString() {
		return "Provincia [Id=" + Id + ", Nombre=" + Nombre + "]";
	}
}
