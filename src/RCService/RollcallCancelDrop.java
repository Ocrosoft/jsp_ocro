package RCService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RollcallCancelDrop")
public class RollcallCancelDrop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RollcallCancelDrop() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("rollcall_cancel_key");
		List<RollcallEntity> res = null;
		try {
			res = RollcallQuery.rollcallQueryInavailable(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!res.equals(null) && res.size() != 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/CancelDrop.jsp");
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

}
