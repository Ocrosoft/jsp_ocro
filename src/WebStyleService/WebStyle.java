package WebStyleService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

public class WebStyle {

	public static void Get_Header(JspWriter out, HttpServletRequest request) throws IOException {
		out.print("<script src=\"//code.jquery.com/jquery-2.1.4.min.js\"></script>");
		out.print("<script src=\"//debug.ocrosoft.com:8001/js/particles.js\"></script>");
		out.print("<script src=\"//debug.ocrosoft.com:8001/js/bootstrap.min.js\"></script>");
		out.print("<div id=\"particles-js\" class=\"particles-div\"></div>");
		out.print("<div id=\"back\"></div>");
		out.print("<div class=\"clearfix\">");
		out.print("<div class=\"clearfix\">");
		out.print("<nav class=\"navbar navbar-default\" role=\"navigation\" style=\"border-radius: 0px;\">");
		out.print("<div class=\"navbar-header\">");
		out.print("<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\"></button>");
		out.print("<a class=\"navbar-brand\" href=\"/WEB_JSP/\">WEB JSP</a>");
		out.print("</div>");
		out.print("<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">");
		out.print("<ul class=\"nav navbar-nav\">");
		out.print("</ul>");
		out.print("<ul class=\"nav navbar-nav navbar-right\">");
		out.print("<li class=\"dropdown\">");
		out.print("<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">");
		HttpSession session=request.getSession(true); 
		if(session.getAttribute("loginSession")==null){
			out.print(session.getAttribute("loginSession"));
		}else{
			out.print("Login");
		}out.print("<strong class=\"caret\"></strong>");
		out.print("</a>");
		out.print("<ul class=\"dropdown-menu\">");
		out.print("</ul>");
		out.print("</li>");
		out.print("</a>");
		out.print("<ul class=\"dropdown-menu\">");
		out.print("</ul>");
		out.print("</li>");
		out.print("</ul>");
		out.print("</div>");
		out.print("</nav>");
		out.print("</div>");
	}

	public static void Import_CSS(JspWriter out) throws IOException {
		out.print("<link rel=\"stylesheet\" type=\"text/css\" href=\"//debug.ocrosoft.com:8001/css/bootstrap.min.css\"/>");
		out.print("<link rel=\"stylesheet\" type=\"text/css\" href=\"//debug.ocrosoft.com:8001/css/main.css\"/>");
	}
	
	public static void Get_Footer(JspWriter out) throws IOException {
		out.print("<div class=\"clearfix\">");
		out.print("<nav class=\"navbar navbar-default\" role=\"navigation\" style=\"border-radius: 0px; bottom: 0px; margin: 20px 0px 0px 0px;\">");
		out.print("<p class=\"text-muted credit\" style=\"padding: 10px; text-align: center;\">");
		out.print("<span id=\"copyright\">&copy;2017 ocrosoft.com<br />");
		out.print("浙ICP备16010729号");
		out.print("<span id='cc'>150104400108</span>");
		out.print("</span>");
		out.print("</p>");
		out.print("</nav>");
		out.print("</div>");
		out.print("<script src=\"//debug.ocrosoft.com:8001/js/particlesON.js\"></script>");
		out.print("<script src=\"//debug.ocrosoft.com:8001/js/main.js\"></script>");
	}

	public static void Get_Standard_Content_Heander(JspWriter out) throws IOException {
		out.print("<div class=\"container\">");
		out.print("<div class=\"row clearfix\">");
		out.print("<div class=\"col-md-1 column\">");
		out.print("</div>");
		out.print("<div class=\"col-md-6 column\">");
	}

	public static void Get_Standard_Content_Footer(JspWriter out) throws IOException {
		out.print("</div>");
		out.print("<div class=\"col-md-1 column\">");
		out.print("</div>");
		out.print("<div class=\"col-md-3 column\">");
		out.print("<label for=\"sideBar\">SideBar</label>");
		out.print("<br />");
		out.print("<label for=\"none\">Σ( ° △ °|||)︴</label>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
	}
}
