package LRService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

@WebServlet("/RegisterAct")
/**
 * 注册 类
 * 
 * @author ocrosoft
 * 
 */
public class RegisterAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterAct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String piccode = (String) request.getSession().getAttribute("code");
		String username = request.getParameter("inputUsername").trim();
		String password = request.getParameter("inputPassword").trim();
		String sex = request.getParameter("optionSex").trim();
		String year = request.getParameter("inputYear").trim();
		String grade = request.getParameter("selectGrade").trim();
		String major = request.getParameter("selectMajor").trim();
		String checkCode = request.getParameter("checkCode").trim();
		String date = getNowDate();
		date = date.replaceAll("-", "/");
		date = date.replaceAll("/0", "/");
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getRemoteAddr();
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (checkCode.equals(piccode)) {
			Connection conn = null;
			try {
				conn = connections.Connection.getConnection();
				QueryRunner qr = new QueryRunner();
				String sql = "insert into users(username,password,sex,grade,age,major,IP,regtime) values(?,?,?,?,?,?,?,?)";
				int res = qr.update(conn, sql, new Object[] { username, MD5_Operation.getMD5(password),sex, grade, year, major, ip, date });
				if (0 < res) {
					RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("/webs/Register.jsp");
					request.setAttribute("errorMsgShowID", "#inputPassword");
					request.setAttribute("regErrorMsg", "注册失败，请更换用户名后重试！");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				RequestDispatcher rd = request.getRequestDispatcher("/webs/Register.jsp");
				request.setAttribute("errorMsgShowID", "#buttonSubmit");
				request.setAttribute("regErrorMsg", "服务器错误！");
				rd.forward(request, response);
			} finally {
				DbUtils.closeQuietly(conn);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");
			request.setAttribute("errorMsgShowID", "#checkCode");
			request.setAttribute("regErrorMsg", "注册码错误!");
			rd.forward(request, response);
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * 获取当前时间
	 * 
	 * @return yyyy-MM-dd HH:mm:ss 格式的时间
	 */
	public static String getNowDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		return dateString;
	}
}
