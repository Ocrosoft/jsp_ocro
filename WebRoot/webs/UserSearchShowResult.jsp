<%@page import="LRService.LoginEntity"%>
<%@page import="RCService.RollcallEntity"%>
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

<%@include file="Import_CSS.jsp"%>

<title>Result</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<!-- Header -->
	<%@include file="Header_Script.jsp"%>
	<jsp:include page="Header.jsp" flush="true" />

	<!-- Content -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="table-responsive">
					<table id="stdContentMoudle_registedUser" class="table">
						<tr style="background-color:#4472C4;">
							<th>用户名</th>
							<th>性别</th>
							<th>年级</th>
							<th>年龄</th>
							<th>专业</th>
							<th>IP</th>
							<th>注册时间</th>
						</tr>
						<%
							List<LoginEntity> res = (List<LoginEntity>) request.getAttribute("resultList");
							int index = 0;
							for (LoginEntity i : res) {
								if (index++ % 2 == 0) {
									out.println("<tr style=\"background-color:#D9E2F3;\">");
								} else {
									out.println("<tr style=\"background-color:#FFFFFF;\">");
								}
								out.println("<td>" + i.getUsername() + "</td>");
								out.println("<td>" + i.getSex() + "</td>");
								out.println("<td>" + i.getGrade() + "</td>");
								out.println("<td>" + i.getAge() + "</td>");
								out.println("<td>" + i.getMajor() + "</td>");
								out.println("<td>" + i.getIP() + "</td>");
								out.println("<td>" + i.getRegtime() + "</td>");
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="Footer.jsp"%>
</body>
</html>
