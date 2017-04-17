package RCService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import LRService.CodeChecker;

@WebServlet("/RollcallAct")
public class RollcallAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RollcallAct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String xh = request.getParameter("inputXH").trim();
		String xm = request.getParameter("inputName").trim();
		String date = CodeChecker.getNowDate();
		date = date.replaceAll("-", "/");
		date = date.replaceAll("/0", "/");
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getRemoteAddr();
		}
		int zc = Integer.parseInt(request.getParameter("selectorSJZ"));
		int xq = Integer.parseInt(request.getParameter("selectorSJX"));

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/rollcall?useUnicode=true&characterEncoding=utf8";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			QueryRunner qr = new QueryRunner();
			String sql = "insert into rollcall(xh,xm,ip,sj,zc,xq) values(?,?,?,?,?,?)";
			int res = qr.update(conn, sql, new Object[] { xh, xm, ip, date, zc, xq });
			if (0 < res) {
				out.println("<script>alert('点名成功!');</script>");
				out.println("<script>location.href='/WEB_JSP/webs/Login.jsp';</script>");
				//RequestDispatcher rd = request.getRequestDispatcher("/webs/Rollcall.jsp");  
				//rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/webs/Rollcall.jsp");  
				request.setAttribute("errorMsgShowID", "#buttonSubmit");
				request.setAttribute("rollcallErrorMsg", "Server Error(0)!");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/Rollcall.jsp");  
			request.setAttribute("errorMsgShowID", "#buttonSubmit");
			request.setAttribute("rollcallErrorMsg", "Server Error(1)!");
			rd.forward(request, response);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
