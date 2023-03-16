package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clases.Conexion;

public class ModeloUsuario {

	private int id;
	private String nombre;
	private Date fechaDeNacimiento;
	
	
	
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
	
	public ArrayList<ModeloUsuario> getUsuarios() throws SQLException {
		ArrayList<ModeloUsuario> usuarios = new ArrayList<>();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement pSt = conector.getCon().prepareStatement("SELECT id, nombre_apellido, fecha_nacimiento FROM usuarios");
		ResultSet resultado = pSt.executeQuery();
		while(resultado.next()) {
			ModeloUsuario usuario = new ModeloUsuario();
			usuario.setId(resultado.getInt("id"));
			usuario.setNombre(resultado.getString("nombre_apellido"));
			usuario.setFechaNacimineto(resultado.getDate("fecha_nacimiento"));
			usuarios.add(usuario);
		}
		pSt.close();
		conector.cerrar();
		return usuarios;
		
	}
	
	public ModeloUsuario getUsuario(int id) throws SQLException {
		ModeloUsuario usuario = new ModeloUsuario();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement gettear =conector.getCon().prepareStatement("SELECT * FROM usuarios WHERE id=?");
		gettear.setInt(1, id);
		ResultSet resultado=gettear.executeQuery();
		if(resultado.next()) {
		usuario.setId(resultado.getInt("id"));
		usuario.setNombre(resultado.getString("nombre_apellido"));
		usuario.setFechaNacimineto(resultado.getDate("fecha_nacimiento"));
		}
		gettear.close();
		conector.cerrar();
		return usuario;
		
	}
	
	public void deleteUsuario(int id) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement pstDelete = conector.getCon().prepareStatement("DELETE FROM usuarios WHERE id = ?");
		pstDelete.setInt(1, id);
		pstDelete.execute();
		conector.cerrar();
		
	}
	
	public void modUsuarios(int id, String nombre, Date fecha) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement pstModificar = conector.getCon().prepareStatement("UPDATE usuarios SET nombre_apellido = ?, fecha_nacimiento = ? WHERE id = ?;");
		pstModificar.setString(1, nombre);
		pstModificar.setDate(2, new java.sql.Date(fecha.getTime()));
		pstModificar.setInt(3, id);
		pstModificar.execute();
		conector.cerrar();
		
	}
	public void insertUsuarios(String Nuevonombre, String dni, String codigo) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement insertar = conector.getCon().prepareStatement("INSERT INTO usuarios (nombre_apellido, dni, codigo) VALUES (?, ?, ?);");
		insertar.setString(1, Nuevonombre);
		insertar.setString(2, dni);
		insertar.setString(3, codigo);
		insertar.execute();
		conector.cerrar();	
		
	}
	
}
