package LRService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoutAct")
public class LogoutAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutAct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginSession");
		response.getWriter().write("<script>window.location.href=\"/WEB_JSP/webs/Login.jsp\";</script>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginSession");
		response.getWriter().write("<script>window.location.href=\"/WEB_JSP/webs/Login.jsp\";</script>");
	}

}
