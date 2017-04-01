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
import org.apache.taglibs.standard.tag.common.core.CatchTag;

@WebServlet("/LoginAct")
public class LoginAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginAct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String piccode = (String) request.getSession().getAttribute("code"); // 正确的验证码
		String username = request.getParameter("inputUsername").trim(); // 用户名
		String password = request.getParameter("inputPassword").trim(); // 密码
		password = MD5_Operation.getMD5(password).toUpperCase();
		String checkCode = request.getParameter("checkCode").trim(); // 验证码
		String remember = request.getParameter("remember");
		if(remember!=null && remember.equals("on")){
			Cookie cookie=new Cookie("loginCookie", username);
			cookie.setMaxAge(7*24*60*60);
			response.addCookie(cookie);
		}else{
			Cookie cookie=new Cookie("loginCookie", username);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		String ip = request.getHeader("x-forwarded-for"); // IP
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getRemoteAddr();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (checkCode.equals(piccode)) {
			LoginEntity res=LoginJudger(username,password);
			if(res!=null){
				HttpSession session=request.getSession(); 
				session.setAttribute("loginSession", username);
				RequestDispatcher rd = request.getRequestDispatcher("/webs/Welcome.jsp");  
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");  
				request.setAttribute("loginErrorMsg", "Username or password wrong!");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");  
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
	public static LoginEntity LoginJudger(String username, String password) {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		LoginEntity res = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			QueryRunner qr = new QueryRunner();
			String sql = "select * from users where username=? and password=?";
			res = qr.query(conn, sql, new BeanHandler(LoginEntity.class), username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return res;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<LoginEntity> UserSearch(String username) {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		List<LoginEntity> res = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			QueryRunner qr = new QueryRunner();
			username="%"+username+"%";
			String sql = "select * from users where username like ?";
			res = (List)qr.query(conn, sql, new BeanListHandler(LoginEntity.class), username);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return res;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<LoginEntity> UserSearchEx(String username) {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		List<LoginEntity> res = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			QueryRunner qr = new QueryRunner();
			String sql = "select * from users where username = ?";
			res = (List)qr.query(conn, sql, new BeanListHandler(LoginEntity.class), username);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return res;
	}
}
