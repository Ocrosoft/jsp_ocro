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
<%@include file="webs/Import_CSS.jsp" %>

<title>Index</title>
</head>

<body>
	<!-- Header -->
	<%@include file="webs/Header_Script.jsp" %>
	<jsp:include page="webs/Header.jsp" flush="true" />

	<!-- Content -->
	<%@include file="webs/Standard_Content_Header.jsp" %>
	<%@include file="webs/Standard_Content_Footer.jsp" %>
	<!-- Footer -->
	<%@include file="webs/Footer.jsp" %>
</body>
</html>