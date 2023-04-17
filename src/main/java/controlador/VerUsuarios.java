package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.ModeloRol;
import modelo.ModeloUsuario;
import modelo.Rol;
import modelo.Usuario;

/**
 * Servlet implementation class ejecutarJSP
 */
@WebServlet("/VerUsuarios")
public class VerUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerUsuarios() {
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
		
		ArrayList<Usuario> usuarios = new ArrayList<>();
		ModeloUsuario modeloUsuario = new ModeloUsuario();
		String aviso = request.getParameter("aviso");
		if(aviso == null) {
			aviso = "ninguno";
		}
			try {
				usuarios = modeloUsuario.getUsuarios();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		ModeloRol mrol = new ModeloRol();
		ArrayList<Rol> listaroles = new ArrayList<>();
		
		try {
			listaroles = mrol.getRoles();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("usuarioLogeado", usuarioLogeado);
		request.setAttribute("roles", listaroles);
		request.setAttribute("aviso", aviso);
		request.setAttribute("usuarios", usuarios);
		request.getRequestDispatcher("verUsuarios.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
