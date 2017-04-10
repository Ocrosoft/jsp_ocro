<%@ page language="java" import="java.util.*" import="LRService.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@include file="Import_CSS.jsp" %>

<title>Login</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<% 
	if(request.getSession().getAttribute("loginSession")==null){
		RequestDispatcher rd = request.getRequestDispatcher("/webs/Login.jsp");  
		rd.forward(request, response);
	}
	%>
	<!-- Header -->
	<%@include file="Header_Script.jsp" %>
	<jsp:include page="Header.jsp" flush="true" />

	<!-- Content -->
	<%@include file="Standard_Content_Header.jsp" %>
	<form class="form-horizontal" role="form" style="text-align:center;">
		<h1 class="text-success">Welcome!</h1>
		<input type="button" value="Return to login page" onclick="back()"
			class="btn btn-primary" style="width:50%;" />
	</form>
	<%@include file="Standard_Content_Footer.jsp" %>
	<!-- Footer -->
	<%@include file="Footer.jsp" %>
	<script>
		function back() {
			window.location.href = '/WEB_JSP/webs/Login.jsp';
		}
	</script>
</body>
</html>