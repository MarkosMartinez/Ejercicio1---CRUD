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
	
	public void deleteUsuario(int id) throws SQLException {
		Conexion conector = new Conexion();
		conector.conectar();
		PreparedStatement pstDelete = conector.getCon().prepareStatement("DELETE FROM usuarios WHERE id = ?");
		pstDelete.setInt(1, id);
		pstDelete.execute();
		conector.cerrar();
		
	}
	
}
