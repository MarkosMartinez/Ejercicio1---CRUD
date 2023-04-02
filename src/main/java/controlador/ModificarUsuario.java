package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import modelo.ModeloRol;
import modelo.ModeloUsuario;
import modelo.Rol;
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
		HttpSession session = request.getSession();
		Usuario usuarioLogeado = (Usuario) session.getAttribute("usuarioLogueado");
		if(usuarioLogeado == null) {
			response.sendRedirect("Login");
		}else {
		
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
		int id_rol = usuario.getId_rol();
		
		ModeloRol mrol = new ModeloRol();
		ArrayList<Rol> roles = new ArrayList<>();
		try {
			roles = mrol.getRoles();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("roles", roles);
		request.setAttribute("id", id);
		request.setAttribute("id_rol", id_rol);
		request.setAttribute("nombre", nombre);
		request.setAttribute("fecha", fecha);
		request.setAttribute("password", password);
		request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String fechaSinFormato = request.getParameter("fecha_nacimiento");
		String passSinEncriptar = request.getParameter("password");
		String password = DigestUtils.sha1Hex(passSinEncriptar);
		int id_rol = Integer.parseInt(request.getParameter("roles"));
		Date fecha = null;
		try {
			fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaSinFormato);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		ModeloUsuario usuario = new ModeloUsuario();
		try {
			usuario.modUsuarios(id, nombre, fecha, password, id_rol);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/VerUsuarios?aviso=usumodificado");
	}

}
