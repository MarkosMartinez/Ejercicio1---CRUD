package modelo;

import java.util.Date;

public class Usuario {

	private int id;
	private String nombre;
	private Date fechaDeNacimiento;
	private String password;
	
	
	public Date getFechaDeNacimiento() {
		return fechaDeNacimiento;
	}
	public void setFechaDeNacimiento(Date fechaDeNacimiento) {
		this.fechaDeNacimiento = fechaDeNacimiento;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getFechaNacimiento() {
		return fechaDeNacimiento;
	}
	public void setFechaNacimineto(Date fecha) {
		this.fechaDeNacimiento = fecha;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public static boolean verificarContraseña(String contraseña) {
		Boolean cumpleLosRequisitos = false;
		if(contraseña.length() >= 8) {
			 for(char c : contraseña.toCharArray()){
				 if(Character.isDigit(c)){
					 cumpleLosRequisitos = true;
				 }
			 }
		}
		return cumpleLosRequisitos;
	}
	
}
