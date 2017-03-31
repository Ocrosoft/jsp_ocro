<%@ page language="java" import="java.util.*" import="WebStyleService.*" import="LRService.*"
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
	WebStyle.Import_CSS(out);
%>

<title>Login</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<!-- Header -->
	<%
		WebStyle.Get_Header(out,request);
	%>

	<!-- Content -->
	<%
		WebStyle.Get_Standard_Content_Heander(out);
	%>
	<form id="Login" class="form-horizontal" role="form" action="/WEB_JSP/LoginAct"
		method="post">
		<div class="form-group">
			<label for="inputUsername">Username</label>
			<div>
				<input class="form-control" id="inputUsername"
					placeholder="Email/Name/Phone Number" name="inputUsername" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword">Password</label>
			<div>
				<input type="password" class="form-control" name="inputPassword"
					id="inputPassword" placeholder="Password" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputCheckCode" style="display:block;">CheckCode</label>
			<input type="text" id="checkCode" name="checkCode" value=""
				class="form-control" style="width:75%;display:inline;"
				placeholder="Enter checkcode" /> <img
				style="cursor:hand;float:right;" alt="CheckCode" id="imageCode"
				src="/WEB_JSP/CheckCode" />
		</div>
		<div class="form-group">
			<div>
				<input type="submit" value="Login"
					class="btn btn-primary form-control" />
			</div>
			<a href="/WEB_JSP/webs/Register.jsp"> <input type="button"
				class="btn btn-link"
				style="outline: none;right:0;position:absolute;" value="Register->" /></a>
		</div>
	</form>
	<%
		WebStyle.Get_Standard_Content_Footer(out);
	%>

	<!-- Footer -->
	<%
		WebStyle.Get_Footer(out);
	%>
	<script>
		function reloadCode() {
			var time = new Date().getTime();
			document.getElementById("imageCode").src = "/WEB_JSP/CheckCode?" + time;
		}
		$("#imageCode").bind('click', reloadCode);
	
		function changeBorderColor(id) {
			$(id).css('border-color', '#f00');
			$(id).focus(function() {
				$(id).css('border-color', '#ccc');
			});
		}
	
		$('#Login').submit(function() {
			var username = $("#inputUsername")[0].value;
			var password = $("#inputPassword")[0].value;
			var checkcode = $("#checkCode")[0].value;
			var valid = true;
	
			if (username.length == 0) {
				changeBorderColor("#inputUsername");
				valid = false;
			}
			if (password.length < 6 || password.length > 20) {
				changeBorderColor("#inputPassword");
				valid = false;
			}
			if (checkcode.length != 4) {
				changeBorderColor("#checkCode");
				valid = false;
			}
	
			return valid;
		});
	</script>
</body>
</html>