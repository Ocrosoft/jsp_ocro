package LRService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

@WebServlet("/LoginAct")
public class LoginAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginAct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String piccode = (String) request.getSession().getAttribute("code");
		String username = request.getParameter("inputUsername").trim();
		String password = request.getParameter("inputPassword").trim();
		password = MD5_Operation.getMD5(password).toUpperCase();
		String checkCode = request.getParameter("checkCode").trim();
		String remember = request.getParameter("remember");
		if (remember != null && remember.equals("on")) {
			Cookie cookie = new Cookie("loginCookie", username);
			cookie.setMaxAge(7 * 24 * 60 * 60);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("loginCookie", username);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		String checkTeacher = request.getParameter("teacher");
		boolean teacher = false;
		if (checkTeacher != null && checkTeacher.equals("on"))
			teacher = true;
		String ip = request.getHeader("x-forwarded-for"); // IP
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getRemoteAddr();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (checkCode.equals(piccode)) {
			LoginEntity res = null;
			try {
				res = LoginJudger(username, password, teacher);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (res != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginSession", username);
				if (teacher)
					session.setAttribute("loginIden", "Teacher");
				else
					session.setAttribute("loginIden", "User");
				RequestDispatcher rd = request.getRequestDispatcher("/webs/Welcome.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");
				request.setAttribute("errorMsgShowID", "#inputPassword");
				request.setAttribute("loginErrorMsg", "Username or password wrong!");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");
			request.setAttribute("errorMsgShowID", "#checkCode");
			request.setAttribute("loginErrorMsg", "Incorrect checkcode!");
			rd.forward(request, response);
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static LoginEntity LoginJudger(String username, String password, Boolean teacher) throws SQLException {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		LoginEntity res = null;

		conn = DriverManager.getConnection(url, user, pass);
		QueryRunner qr = new QueryRunner();
		String sql = "select * from " + (teacher ? "teacher" : "users") + " where username=? and password=?";
		res = qr.query(conn, sql, new BeanHandler(LoginEntity.class), username, password);

		DbUtils.closeQuietly(conn);

		return res;
	}

	public static List<LoginEntity> UserSearch(String username) throws SQLException {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		List<LoginEntity> res = null;

		conn = DriverManager.getConnection(url, user, pass);
		QueryRunner qr = new QueryRunner();
		username = "%" + username + "%";
		String sql = "select * from users where username like ?";
		res = (List<LoginEntity>) qr.query(conn, sql, new BeanListHandler<LoginEntity>(LoginEntity.class), username);

		DbUtils.closeQuietly(conn);

		return res;
	}

	public static List<LoginEntity> UserSearchEx(String username) throws SQLException {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		List<LoginEntity> res = null;

		conn = DriverManager.getConnection(url, user, pass);
		QueryRunner qr = new QueryRunner();
		String sql = "select * from users where username = ?";
		res = (List<LoginEntity>) qr.query(conn, sql, new BeanListHandler<LoginEntity>(LoginEntity.class), username);

		DbUtils.closeQuietly(conn);

		return res;
	}
}
