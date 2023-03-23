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
 * Servlet implementation class CrearUsuario
 */
@WebServlet("/CrearUsuario")
public class CrearUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearUsuario() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String dni = request.getParameter("dni");
		String codigo = request.getParameter("codigo");
		String password = request.getParameter("password");
		String fechaSinFormato = request.getParameter("fecha_nacimiento");
		Date fecha = null;
		try {
			fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaSinFormato);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if (Usuario.verificarContraseña(password)) {
			ModeloUsuario usuario = new ModeloUsuario();
			try {
				usuario.insertUsuarios(nombre, dni, codigo, fecha, password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/VerUsuarios?aviso=usucreado");
		}else {
			response.sendRedirect(request.getContextPath() + "/VerUsuarios?aviso=error");
		}
		
		
	}

}
