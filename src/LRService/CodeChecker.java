package LRService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

@WebServlet("/CodeChecker")
public class CodeChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CodeChecker() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String piccode = (String) request.getSession().getAttribute("code"); // 正确的验证码
		String username = request.getParameter("inputUsername").trim(); // 用户名
		String password = request.getParameter("inputPassword").trim(); // 密码
		String sex = request.getParameter("optionSex").trim(); // 性别
		String year = request.getParameter("inputYear").trim(); // 年龄
		String grade = request.getParameter("selectGrade").trim(); // 年级
		String major = request.getParameter("selectMajor").trim(); // 专业
		String checkCode = request.getParameter("checkCode").trim(); // 验证码
		String date=getNowDate();
		date=date.replaceAll("-", "/");
		date=date.replaceAll("/0", "/");
		String ip = request.getHeader("x-forwarded-for"); // IP
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getRemoteAddr();
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (checkCode.equals(piccode)) {
			Connection conn = null;
			String url = "jdbc:mysql://debug.ocrosoft.com:3306/users";
			String jdbcDriver = "com.mysql.jdbc.Driver";
			String user = "root";
			String pass = "mysqlForASPandJSP";
			DbUtils.loadDriver(jdbcDriver);
			try {
				conn = DriverManager.getConnection(url, user, pass);
				QueryRunner qr = new QueryRunner();
				String sql = "insert into users values(?,?,?,?,?,?,?,?)";
				int res = qr.update(conn, sql,
						new Object[] { username, MD5_Operation.getMD5(password).toUpperCase(), sex, grade, year, major, ip, date });
				if (0 < res) {
					out.println("<script>alert('Register successful! Turning to login page...');</script>");
					out.println(
							"<script>window.location.href='http://debug.ocrosoft.com:8002/WEB_JSP/webs/Login.jsp';</script>");
				} else {
					out.println("Faild, server returned an error message(1)!");
					out.println(
							"<script>window.location.href='http://debug.ocrosoft.com:8002/WEB_JSP/webs/Register.jsp';</script>");
				}
			} catch (SQLException e) {
				out.println("Faild, server returned an error message(0)!");
				out.println(
						"<script>window.location.href='http://debug.ocrosoft.com:8002/WEB_JSP/webs/Register.jsp';</script>");
				e.printStackTrace();
			} finally {
				DbUtils.closeQuietly(conn);
			}
		} else {
			out.println("Incorrect checkCode!");
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public static String getNowDate() {
		   Date currentTime = new Date();
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String dateString = formatter.format(currentTime);
		   return dateString;
		}
}
