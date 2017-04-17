package RCService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import LRService.CodeChecker;
import LRService.LoginEntity;

@WebServlet("/RollcallQuery")
public class RollcallQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RollcallQuery() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("rollcall_search_key").trim();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		List<RollcallEntity> res = null;
		try {
			res = UserSearch(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!res.equals(null) && res.size() != 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/ShowResult.jsp");
			request.setAttribute("resultList", res);
			rd.forward(request, response);
		} else {
			out.println("<script>alert('User not Exists!');</script>");
			out.println("<script>history.go(-1);</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public static List<RollcallEntity> UserSearch(String username) throws SQLException {
		Connection conn = null;
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/rollcall";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		List<RollcallEntity> res = null;

		conn = DriverManager.getConnection(url, user, pass);
		QueryRunner qr = new QueryRunner();
		username = "%" + username + "%";
		String sql = "select * from rollcall where xh like ? or xm like ?";
		res = (List<RollcallEntity>) qr.query(conn, sql, new BeanListHandler<RollcallEntity>(RollcallEntity.class),
				username, username);

		DbUtils.closeQuietly(conn);

		return res;
	}
}
