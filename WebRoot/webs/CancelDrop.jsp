<%@ page language="java" import="java.util.*,RCService.RollcallEntity" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
							<th>ID</th>
							<th>学号</th>
							<th>姓名</th>
							<th>IP</th>
							<th>时间</th>
							<th>周次 星期</th>
							<th>有效</th>
							<th>作废</th>
						</tr>
						<%
							List<RollcallEntity> res = (List<RollcallEntity>) request.getAttribute("resultList");
							int index = 0;
							for (RollcallEntity i : res) {
								if (index++ % 2 == 0) {
									out.println("<tr style=\"background-color:#D9E2F3;\">");
								} else {
									out.println("<tr style=\"background-color:#FFFFFF;\">");
								}
								out.println("<td>" + i.getId() + "</td>");
								out.println("<td><a href='" + "/WEB_JSP/RollcallQuery?rollcall_search_key=" + i.getXh() + "'>"
										+ i.getXh() + "</td>");
								out.println("<td>" + i.getXm() + "</td>");
								out.println("<td>" + i.getIp() + "</td>");
								out.println("<td>" + i.getSj() + "</td>");
								out.println("<td><a href='/WEB_JSP/RollcallQuery?selectorSJZ="+i.getZc()+"&selectorSJX="+i.getXq()+"'>第" + i.getZc() + "周 星期" + i.getDSXQ() + "</a></td>");
								out.println("<td>" + i.isYX() + "</td>");
								out.println("<td><a href='" + "/WEB_JSP/CancelDropAct?cancelID=" + i.getId() + "'>" + "恢复</td>");
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
