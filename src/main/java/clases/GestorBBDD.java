package clases;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.ModeloUsuario;

public class GestorBBDD extends Conexion{
	
	public ArrayList<ModeloUsuario> getUsuarios() throws SQLException {
		ArrayList<ModeloUsuario> usuarios = new ArrayList<>();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement pSt = conector.getCon().prepareStatement("SELECT id, nombre_apellido FROM usuarios");
		ResultSet resultado = pSt.executeQuery();
		while(resultado.next()) {
			ModeloUsuario usuario = new ModeloUsuario();
			usuario.setId(resultado.getInt("id"));
			usuario.setNombre(resultado.getString("nombre_apellido"));
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
	
	public void modUsuarios(int id, String nombre) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement pstModificar = conector.getCon().prepareStatement("UPDATE usuarios SET nombre_apellido = ? WHERE id = ?;");
		pstModificar.setString(1, nombre);
		pstModificar.setInt(2, id);
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
