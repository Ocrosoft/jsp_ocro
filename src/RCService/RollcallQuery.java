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

@WebServlet("/RollcallQuery")
/**
 * 点名记录查询 类
 * @author ocrosoft
 *
 */
public class RollcallQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RollcallQuery() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username="";
		String ZC="";
		String XQ="";
		try {
			username = request.getParameter("rollcall_search_key").trim();
		} catch (Exception e) {
			ZC=request.getParameter("selectorSJZ").trim();
			XQ=request.getParameter("selectorSJX").trim();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		List<RollcallEntity> res = null;
		try {
			if(username!="") res = UserSearch(username);
			else res=UserSearch(ZC,XQ);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!res.equals(null) && res.size() != 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/ShowResult.jsp");
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
	 * 查询符合条件的点名记录
	 * @param username 用户名包含的关键词
	 * @return RollcallEntity 集合
	 * @throws SQLException
	 */
	public static List<RollcallEntity> UserSearch(String username) throws SQLException {
		Connection conn = null;
		conn=connections.Connection.getConnection();
		List<RollcallEntity> res = null;

		QueryRunner qr = new QueryRunner();
		username = "%" + username + "%";
		String sql = "select * from rollcall where xh like ? or xm like ?";
		res = (List<RollcallEntity>) qr.query(conn, sql, new BeanListHandler<RollcallEntity>(RollcallEntity.class),username, username);

		DbUtils.closeQuietly(conn);

		return res;
	}
	
	/**
	 * 根据时间查询点名记录
	 * @param ZC 周次
	 * @param XQ 星期
	 * @return RollcallEntity 集合
	 * @throws SQLException
	 */
	public static List<RollcallEntity> UserSearch(String ZC,String XQ) throws SQLException {
		List<RollcallEntity> res = null;
		
		Connection conn = connections.Connection.getConnection();
		QueryRunner qr = new QueryRunner();
		String sql = "select * from rollcall where zc=? and xq=?";
		res = (List<RollcallEntity>) qr.query(conn, sql, new BeanListHandler<RollcallEntity>(RollcallEntity.class),ZC,XQ);
		DbUtils.closeQuietly(conn);

		return res;
	}
	
	public static List<RollcallEntity> rollcallQueryInavailable(String username) throws SQLException {
		Connection conn = null;
		conn=connections.Connection.getConnection();
		List<RollcallEntity> res = null;

		QueryRunner qr = new QueryRunner();
		username = "%" + username + "%";
		String sql = "select * from rollcall where (xh like ? or xm like ?) and yx=0";
		res = (List<RollcallEntity>) qr.query(conn, sql, new BeanListHandler<RollcallEntity>(RollcallEntity.class),username, username);

		DbUtils.closeQuietly(conn);

		return res;
	}
}
