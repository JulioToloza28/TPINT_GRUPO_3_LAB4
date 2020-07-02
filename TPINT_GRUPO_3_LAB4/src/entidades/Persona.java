package entidades;

import java.util.Date;

public class Persona {

	private int id;
	private String Nombre;
	private String Apellido;
	private String Dni;
	private int Legajo;
	private Date FechaNac;
	private String Direccion;
	private int IdLocalidad;
	private String Telefono;
	private String Mail;
	private Boolean Estado;

	public Persona() {
	}

	public Persona(int id, String nombre, String apellido, String dni, int legajo, Date fechaNac, String direccion,
			int idLocalidad, String telefono, String mail, Boolean estado) {
		this.id = id;
		this.Nombre = nombre;
		this.Apellido = apellido;
		this.Dni = dni;
		this.Legajo = legajo;
		this.FechaNac = fechaNac;
		this.Direccion = direccion;
		this.IdLocalidad = idLocalidad;
		this.Telefono = telefono;
		this.Mail = mail;
		this.Estado = estado;
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

	public int getLegajo() {
		return Legajo;
	}

	public void setLegajo(int legajo) {
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
		return "Persona [id=" + id + ", Nombre=" + Nombre + ", Apellido=" + Apellido + ", Dni=" + Dni + ", Legajo="
				+ Legajo + ", FechaNac=" + FechaNac + ", Direccion=" + Direccion + ", IdLocalidad=" + IdLocalidad
				+ ", Telefono=" + Telefono + ", Mail=" + Mail + ", Estado=" + Estado + "]";
	}
}
