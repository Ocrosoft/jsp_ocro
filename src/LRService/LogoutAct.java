package LRService;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAct extends HttpServlet {

	public LogoutAct() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginSession");
		response.getWriter().write("<script>window.location.href=\"/WEB_JSP/webs/Login.jsp\";</script>");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginSession");
		response.getWriter().write("<script>window.location.href=\"/WEB_JSP/webs/Login.jsp\";</script>");
	}

	public void init() throws ServletException {
	}

}
