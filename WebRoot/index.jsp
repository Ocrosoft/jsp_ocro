<%@ page language="java" import="java.util.*" import="WebStyleService.*"
	pageEncoding="UTF-8"%>
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
	WebStyleService.WebStyle.Import_CSS(out);
%>

<title>Index</title>
</head>

<body>
	<!-- Header -->
	<%
		WebStyleService.WebStyle.Get_Header(out, "0");
	%>

	<!-- Content -->
	<%
		WebStyleService.WebStyle.Get_Standard_Content_Heander(out);
		WebStyleService.WebStyle.Get_Standard_Content_Footer(out);
	%>

	<!-- Footer -->
	<%
		WebStyleService.WebStyle.Get_Footer(out);
	%>
</body>
</html>