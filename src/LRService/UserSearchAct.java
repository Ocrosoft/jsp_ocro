package LRService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchAct")
public class UserSearchAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserSearchAct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("searchUsername").trim();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		List<LoginEntity> res = null;
		try {
			res = LoginAct.UserSearch(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!res.equals(null) && res.size() != 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/UserSearchShowResult.jsp");
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

}
