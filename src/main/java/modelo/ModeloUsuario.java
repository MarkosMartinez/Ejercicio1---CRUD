package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clases.Conexion;
public class ModeloUsuario extends Conexion{
	
	public ArrayList<Usuario> getUsuarios() throws SQLException {
		ArrayList<Usuario> usuarios = new ArrayList<>();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement pSt = conector.getCon().prepareStatement("SELECT id, nombre_apellido, fecha_nacimiento, password, id_rol FROM usuarios");
		ResultSet resultado = pSt.executeQuery();
		while(resultado.next()) {
			Usuario usuario = new Usuario();
			usuario.setId(resultado.getInt("id"));
			usuario.setNombre(resultado.getString("nombre_apellido"));
			usuario.setFechaNacimineto(resultado.getDate("fecha_nacimiento"));
			usuario.setPassword(resultado.getString("password"));
			usuario.setId_rol(resultado.getInt("id_rol"));
			
			usuarios.add(usuario);
		}
		pSt.close();
		conector.cerrar();
		return usuarios;
		
	}
	
	public Usuario getUsuario(int id) throws SQLException {
		Usuario usuario = new Usuario();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement gettear =conector.getCon().prepareStatement("SELECT * FROM usuarios WHERE id=?");
		gettear.setInt(1, id);
		ResultSet resultado=gettear.executeQuery();
		if(resultado.next()) {
		usuario.setId(resultado.getInt("id"));
		usuario.setNombre(resultado.getString("nombre_apellido"));
		usuario.setFechaNacimineto(resultado.getDate("fecha_nacimiento"));
		usuario.setPassword(resultado.getString("password"));
		usuario.setId_rol(resultado.getInt("id_rol"));
		}
		gettear.close();
		conector.cerrar();
		return usuario;
		
	}
	
	public Usuario comprobarLogin(String dni, String pass) throws SQLException {
		Usuario usuario = new Usuario();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement gettear =conector.getCon().prepareStatement("SELECT * FROM usuarios WHERE dni=? AND password = ?");
		gettear.setString(1, dni);
		gettear.setString(2, pass);
		ResultSet resultado=gettear.executeQuery();
		if(resultado.next()) {
		usuario.setId(resultado.getInt("id"));
		usuario.setNombre(resultado.getString("nombre_apellido"));
		usuario.setDni(resultado.getString("dni"));
		usuario.setCodigo(resultado.getInt("codigo"));
		usuario.setFechaNacimineto(resultado.getDate("fecha_nacimiento"));
		usuario.setPassword(resultado.getString("password"));
		usuario.setId_rol(resultado.getInt("id_rol"));
		}else {
			usuario.setDni("-1");
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
	
	public void modUsuarios(int id, String nombre, Date fecha, String password, int id_rol) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement pstModificar = conector.getCon().prepareStatement("UPDATE usuarios SET nombre_apellido = ?, fecha_nacimiento = ?, password = ?, id_rol = ? WHERE id = ?;");
		pstModificar.setString(1, nombre);
		pstModificar.setDate(2, new java.sql.Date( fecha.getTime()));
		pstModificar.setString(3, password);
		pstModificar.setInt(4, id_rol);
		pstModificar.setInt(5, id);
		pstModificar.execute();
		conector.cerrar();
		
	}
	public void insertUsuarios(String Nuevonombre, String dni, String codigo, Date fecha, String password, int id_rol) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement insertar = conector.getCon().prepareStatement("INSERT INTO usuarios (nombre_apellido, dni, codigo, fecha_nacimiento, password, id_rol) VALUES (?, ?, ?, ?, ?, ?);");
		insertar.setString(1, Nuevonombre);
		insertar.setString(2, dni);
		insertar.setString(3, codigo);
		insertar.setDate(4, new java.sql.Date( fecha.getTime()));
		insertar.setString(5, password);
		insertar.setInt(6, id_rol);
		insertar.execute();
		conector.cerrar();	
		
	}
	
}
