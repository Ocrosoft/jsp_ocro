<%@ page isELIgnored="false" language="java"
	import="java.util.*,LRService.*" pageEncoding="UTF-8"%>
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

<title>Login</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<!-- Header -->
	<%@include file="Header_Script.jsp"%>
	<jsp:include page="Header.jsp" flush="true" />

	<!-- Content -->
	<%@include file="Standard_Content_Header.jsp"%>
	<form id="Login" class="form-horizontal" role="form"
		action="/WEB_JSP/LoginAct" method="post">
		<div class="form-group">
			<label for="inputUsername">用户名</label>
			<div>
				<input class="form-control" id="inputUsername"
					placeholder="邮箱 / 姓名 / 手机号" name="inputUsername" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword">密码</label>
			<div>
				<input type="password" class="form-control" name="inputPassword"
					id="inputPassword" placeholder="请输入密码" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputCheckCode" style="display:block;">验证码</label>
			<input type="text" id="checkCode" name="checkCode" value=""
				class="form-control" style="width:75%;display:inline;"
				placeholder="请输入验证码" /> <img
				style="cursor:hand;float:right;" alt="CheckCode" id="imageCode"
				src="/WEB_JSP/CheckCode" />
		</div>
		<div class="form-group">
			<input type="checkbox" name="remember" id="checkBoxRemember" /> <label
				id="rememberLabel" for="checkRemember"> 记住用户名</label>
			<span style="position:absolute;right:0;"> <input
				type="checkbox" name="teacher" id="checkBoxTeacher" " /> <label
				id="teacherLabel" for="checkTeacher"> 教师</label> </span>
		</div>
		<div class="form-group">
			<div>
				<input type="submit" value="登录"
					class="btn btn-primary form-control" />
			</div>
			<a href="/WEB_JSP/webs/Register.jsp"> <input type="button"
				class="btn btn-link"
				style="outline: none;right:0;position:absolute;" value="注册->" /></a>
		</div>
	</form>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				String cName = cookie.getName();
				if (cName.equals("loginCookie")) {
					out.write("<script>document.getElementById('inputUsername').value='" + cookie.getValue()
							+ "';</script>");
					out.write("<script>document.getElementById('checkBoxRemember').checked=true;</script>");
					break;
				}
			}
		}
	%>
	<%@include file="Standard_Content_Footer.jsp"%>
	<!-- Footer -->
	<%@include file="Footer.jsp"%>
	<script>
		if ('${loginErrorMsg}' != '') {
			changeBorderColor('${errorMsgShowID}', '${loginErrorMsg}');
		}
	
		$('#rememberLabel').bind('click', function() {
			document.getElementById('checkBoxRemember').checked = !document.getElementById('checkBoxRemember').checked;
		});
		$('#teacherLabel').bind('click', function() {
			document.getElementById('checkBoxTeacher').checked = !document.getElementById('checkBoxTeacher').checked;
		});
		function reloadCode() {
			var time = new Date().getTime();
			document.getElementById("imageCode").src = "/WEB_JSP/CheckCode?" + time;
		}
		$("#imageCode").bind('click', reloadCode);
	
		$('#Login').submit(function() {
			var username = $("#inputUsername")[0].value;
			var password = $("#inputPassword")[0].value;
			var checkcode = $("#checkCode")[0].value;
			var reg = new RegExp("^[0-9a-zA-Z_]{1,21}$");
			if (!reg.test(username)) {
				changeBorderColor("#inputUsername", "用户名需要满足:<br/>1.长度在1到20之间。<br/>2.只包含下划线、大小写字母、数字。");
				return false;
			}
			reg = new RegExp("^[!@#$%^&*()0-9a-zA-Z_?<>.]{7,20}$");
			if (!reg.test(password)) {
				changeBorderColor("#inputPassword", "密码需要满足:<br/>1.长度在7到20之间。<br/>2.只包含数字、大小写字母、特殊字符。");
				return false;
			}
			reg = new RegExp("^[a-zA-Z0-9]{4}$");
			if (!reg.test(checkcode)) {
				changeBorderColor("#checkCode", "验证码需要满足:<br>1.长度必须为4。<br/>2.只包含数字、大小写字母。");
				return false;
			}
			return true;
		});
	</script>
</body>
</html>