<%@ page language="java" import="java.util.*" import="WebStyleService.*"
	import="LRService.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	WebStyle.Import_CSS(out);
%>

<title>Edit Profile</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<%
		if (request.getSession().getAttribute("loginSession") == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");
			rd.forward(request, response);
		}
	%>
	<!-- Header -->
	<%
		WebStyle.Get_Header(out, request);
	%>

	<!-- Content -->
	<%
		WebStyle.Get_Standard_Content_Heander(out);
	%>
	<form role="form" action="/WEB_JSP/CodeChecker" method="post">
		<div class="form-group">
			<label for="inputUsername">Username</label><input readonly="readonly"
				type="text" class="form-control" name="inputUsername"
				id="inputUsername"/>
		</div>
		<div class="form-group">
			<label for="inputOldPassword">Old Password</label><input
				type="password" class="form-control" name="inputOldPassword"
				id="inputOldPassword"/>
		</div>
		<div class="form-group">
			<label for="inputPassword">New Password</label><input type="password"
				class="form-control" name="inputPassword" id="inputPassword"/>
		</div>
		<div class="form-group">
			<label for="inputRepeatPassword">Repeat Password</label><input
				type="password" class="form-control" name="inputRepeatPassword"
				id="inputRepeatPassword"/>
		</div>
		<div class="form-group">
			<label for="selectorSex" style="display:block;">Sex&nbsp</label> <label
				for="selectorSexMan"><input disabled="disabled" type="radio"
				name="optionSex" id="optionSex1" value="1" checked>&nbspMale&nbsp</label>
			<label for="electorSexWoman"><input disabled="disabled"
				type="radio" name="optionSex" id="optionSex2" value="0">&nbspFemale&nbsp</label>
		</div>
		<div class="form-group">
			<label for="inputYear" style="display:block;">Year</label> <input
				type="text" class="form-control" name="inputYear" id="inputYear"
				readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="selectorGrade" style="display:block;">Grade</label> <select
				class="form-control" name="selectGrade" id="selectGrade"
				disabled="disabled">
				<option value="1">Grade 1</option>
				<option value="2">Grade 2</option>
				<option value="3">Grade 3</option>
				<option value="4">Grade 4</option>
			</select>
		</div>
		<div class="form-group">
			<label for="selectorMajor" style="display:block;">Major</label>
			<input readonly="readonly"
				type="text" class="form-control" name="inputMajor"
				id="inputMajor" />
		</div>
		<button type="submit" class="btn btn-primary form-control"
			id="buttonSubmit">Accept</button>
	</form>
	<%
		List<LoginEntity> res = LoginAct.UserSearch((String) request.getSession().getAttribute("loginSession"));
		if (!res.equals(null) && res.size() != 0) {
			for (LoginEntity i : res) {
				out.println("<script>document.getElementById('inputUsername').value='"+i.getUsername()+"';</script>");
				if(i.getSex().equals("1"))out.println("<script>document.getElementById('optionSex1').checked=true;</script>");
				else out.println("<script>document.getElementById('optionSex2').checked=true;</script>");
				out.println("<script>document.getElementById('selectGrade').selectedIndex="+(i.getGrade().charAt(0)-'1')+";</script>");
				out.println("<script>document.getElementById('inputYear').value='"+i.getAge()+"';</script>");
				out.println("<script>document.getElementById('inputMajor').value='"+i.getMajor()+"';</script>");
				break;
			}
		}
	%>
	<%
		WebStyle.Get_Standard_Content_Footer(out);
	%>

	<!-- Footer -->
	<%
		WebStyle.Get_Footer(out);
	%>
</body>
</html>