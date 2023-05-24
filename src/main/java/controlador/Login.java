package controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import modelo.ModeloUsuario;
import modelo.Usuario;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		String aviso = request.getParameter("aviso");
		if(aviso == null) {
			aviso = "ninguno";
		}
		request.setAttribute("aviso", aviso);
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni = request.getParameter("dni");
		String passSinEncriptar = request.getParameter("password");
		ModeloUsuario musuario = new ModeloUsuario();
		String pass = DigestUtils.sha1Hex(passSinEncriptar);
		Usuario user = new Usuario();
		try {
			user = musuario.comprobarLogin(dni, pass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(user.getDni() == "-1") {
			response.sendRedirect(request.getContextPath() + "/Login?aviso=error");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioLogueado", user);
			
			response.sendRedirect(request.getContextPath() + "/VerUsuarios");
		}
	}

}
