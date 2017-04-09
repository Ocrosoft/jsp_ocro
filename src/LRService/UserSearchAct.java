package LRService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("searchUsername").trim(); // ÓÃ»§Ãû
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<LoginEntity> res=LoginAct.UserSearch(username);
		if(!res.equals(null) && res.size()!=0){
			for(LoginEntity i : res){
				out.println("Username:"+i.getUsername());
				out.println("Sex:"+(i.getSex()=="1"?"Male":"Female"));
				out.println("Grade:"+i.getGrade());
				out.println("Age:"+i.getAge());
				out.println("Major:"+i.getMajor());
				out.println("IP:"+i.getIP());
				out.println("Reg Time:"+i.getRegtime());
				out.println("");
			}
		}
		else{
			out.println("<script>alert('User not Exists!');</script>");
		}
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
