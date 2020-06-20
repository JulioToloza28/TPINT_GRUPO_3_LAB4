package entidades;
import java.util.Date;

public class Alumno {
	
	private int idAlumno;
	private String Nombre;
	private String Apellido;
	private String Dni;
	private String Legajo;
	private Date FechaNac;
	private String Direccion;
	private int IdLocalidad;
	private String Telefono;
	private String Mail;
	private Boolean Estado; // fijarse si chilla, sino tiene que ir algun tipo dato tinyInt
	
	public Alumno () {}

	public int getIdAlumno() {
		return idAlumno;
	}
	public void setIdAlumno(int idAlumno) {
		this.idAlumno = idAlumno;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getApellido() {
		return Apellido;
	}
	public void setApellido(String apellido) {
		Apellido = apellido;
	}
	public String getDni() {
		return Dni;
	}
	public void setDni(String dni) {
		Dni = dni;
	}
	public String getLegajo() {
		return Legajo;
	}
	public void setLegajo(String legajo) {
		Legajo = legajo;
	}
	public Date getFechaNac() {
		return FechaNac;
	}
	public void setFechaNac(Date fechaNac) {
		FechaNac = fechaNac;
	}
	public String getDireccion() {
		return Direccion;
	}
	public void setDireccion(String direccion) {
		Direccion = direccion;
	}
	public int getIdLocalidad() {
		return IdLocalidad;
	}
	public void setIdLocalidad(int idLocalidad) {
		IdLocalidad = idLocalidad;
	}
	public String getTelefono() {
		return Telefono;
	}
	public void setTelefono(String telefono) {
		Telefono = telefono;
	}
	public String getMail() {
		return Mail;
	}
	public void setMail(String mail) {
		Mail = mail;
	}
	public Boolean getEstado() {
		return Estado;
	}
	public void setEstado(Boolean estado) {
		Estado = estado;
	}
	
	@Override
	public String toString() {
		return "Alumno [idAlumno=" + idAlumno + ", Nombre=" + Nombre + ", Apellido=" + Apellido + ", Dni=" + Dni
				+ ", Legajo=" + Legajo + ", FechaNac=" + FechaNac + ", Direccion=" + Direccion + ", IdLocalidad="
				+ IdLocalidad + ", Telefono=" + Telefono + ", Mail=" + Mail + ", Estado=" + Estado + ", getIdAlumno()="
				+ getIdAlumno() + ", getNombre()=" + getNombre() + ", getApellido()=" + getApellido() + ", getDni()="
				+ getDni() + ", getLegajo()=" + getLegajo() + ", getFechaNac()=" + getFechaNac() + ", getDireccion()="
				+ getDireccion() + ", getIdLocalidad()=" + getIdLocalidad() + ", getTelefono()=" + getTelefono()
				+ ", getMail()=" + getMail() + ", getEstado()=" + getEstado() + "]";
	}
	
}


