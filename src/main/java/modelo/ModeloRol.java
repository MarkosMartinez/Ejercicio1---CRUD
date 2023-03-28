package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clases.Conexion;

public class ModeloRol {
	
	public ArrayList<Rol> getRoles() throws SQLException {
		ArrayList<Rol> roles = new ArrayList<>();
		Conexion conector = new Conexion();
		conector.conectar();
	
		PreparedStatement pSt = conector.getCon().prepareStatement("SELECT * FROM roles");
		ResultSet resultado = pSt.executeQuery();
		while(resultado.next()) {
			Rol rol = new Rol();
			rol.setId(resultado.getInt("id"));
			rol.setNombre(resultado.getString("nombre"));		
			roles.add(rol);
		}
		pSt.close();
		conector.cerrar();
		return roles;
		
	}

}
