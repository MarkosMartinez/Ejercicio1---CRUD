package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ModeloUsuario;
import modelo.Usuario;

/**
 * Servlet implementation class ModificarUsuario
 */
@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarUsuario() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Usuario usuario = new Usuario();
		ModeloUsuario modeloUsuario = new ModeloUsuario();
		
		try {
			usuario = modeloUsuario.getUsuario(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String nombre = usuario.getNombre();
		Date fecha = usuario.getFechaNacimiento();
		String password = usuario.getPassword();
		
		request.setAttribute("id", id);
		request.setAttribute("nombre", nombre);
		request.setAttribute("fecha", fecha);
		request.setAttribute("password", password);
		request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String fechaSinFormato = request.getParameter("fecha_nacimiento");
		String password = request.getParameter("password");
		Date fecha = null;
		try {
			fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaSinFormato);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		ModeloUsuario usuario = new ModeloUsuario();
		try {
			usuario.modUsuarios(id, nombre, fecha, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/VerUsuarios?aviso=usumodificado");
	}

}
