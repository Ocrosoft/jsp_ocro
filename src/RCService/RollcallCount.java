package RCService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

/**
 * 统计点名 类
 */
@WebServlet("/RollcallCount")
public class RollcallCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RollcallCount() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("rollcall_count_key").trim();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		List<RollcallCountEntity> res = null;
		try {
			res = RollcallCounting(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!res.equals(null) && res.size() != 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/RollcallCount.jsp");
			request.setAttribute("resultList", res);
			rd.forward(request, response);
		} else {
			out.println("<script>alert('查询不到任何记录!');</script>");
			out.println("<script>history.go(-1);</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * 统计并显示所有点名记录(不包含无效记录)
	 * 
	 * @param username
	 *            用户名包含的关键字
	 * @return RollcallCountEntity集合
	 * @throws SQLException
	 */
	public static List<RollcallCountEntity> RollcallCounting(String username) throws SQLException {
		Connection conn = null;
		conn = connections.Connection.getConnection();
		List<RollcallCountEntity> res = null;

		QueryRunner qr = new QueryRunner();
		username = "%" + username + "%";
		String sql = "select xh,xm,count(xh) as count from rollcall where yx=1 and (xh like ? or xm like ？) group by xh;";
		res = (List<RollcallCountEntity>) qr.query(conn, sql,
				new BeanListHandler<RollcallCountEntity>(RollcallCountEntity.class), username, username);

		DbUtils.closeQuietly(conn);

		return res;
	}
}
