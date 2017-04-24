package RCService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

@WebServlet("/CancelDropAct")
public class CancelDropAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelDropAct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("cancelID").trim();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		Connection conn = null;
		
		int res = 0;

		try {
			conn = connections.Connection.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		QueryRunner qr = new QueryRunner();
		String sql = "update rollcall set yx=1 where id=?";
		try {
			res = qr.update(conn, sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res==0){
			out.println("<script>alert('恢复失败...');</script>");
		}else{
			out.println("<script>alert('恢复成功！请刷新页面以显示最新内容。');</script>");
			out.println("<script>history.go(-1);</script>");
		}

		DbUtils.closeQuietly(conn);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
