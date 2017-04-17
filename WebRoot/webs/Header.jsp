<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>header</title>
<%@include file="Import_CSS.jsp" %>
</head>

<body>
	<div class="clearfix">
		<div class="clearfix">
			<nav class="navbar navbar-default" role="navigation"
				style="border-radius: 0px;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"></button>
				<a class="navbar-brand" href="/WEB_JSP/">WEB JSP</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				</ul>
				<form class="navbar-form navbar-left" role="search" method="post"
					action="/WEB_JSP/UserSearchAct">
					<div class="form-group">
						<input name="searchUsername" type="text" class="form-control"
							placeholder="待搜索的用户名" />
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <%
 	//判断是否已经登录
 	if (session.getAttribute("loginSession") != null) {
 		out.print(session.getAttribute("loginSession"));
 	} else
 		out.print("登录");
 %> <strong class="caret"></strong>
					</a>
						<ul class="dropdown-menu">
							<%
								if (session.getAttribute("loginSession") != null) {
									out.print("<li><a href=\"/WEB_JSP/webs/Profile.jsp\">修改资料</a></li>");
									out.print(
											"<li><a href=\"#\" onclick=\"document.getElementById(\'LogoutForm\').submit();return false;\">退出登录</a></li>");
									out.print(
											"<form style=\"display:none;\" id=\"LogoutForm\" method=\"post\" action=\"/WEB_JSP/LogoutAct\">");
									out.print("</form>");
								} else {
									out.print("<li><a href=\"/WEB_JSP/webs/Login.jsp\">登录</a></li>");
									out.print("<li><a href=\"/WEB_JSP/webs/Register.jsp\">注册</a></li>");
								}
							%>
						</ul></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
</body>
</html>
