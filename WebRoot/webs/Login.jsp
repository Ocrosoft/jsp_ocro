<%@ page isELIgnored="false" language="java" import="java.util.*,WebStyleService.*,LRService.*" pageEncoding="UTF-8"%>
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
	<!-- Header -->
	<%@include file="Header_Script.jsp" %>
	<jsp:include page="/webs/Header.jsp" flush="true" />
	
	<!-- Content -->
	<%@include file="Standard_Content_Header.jsp" %>
	<form id="Login" class="form-horizontal" role="form"
		action="/WEB_JSP/LoginAct" method="post">
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
			<input type="checkbox" name="remember" id="checkBoxRemember" /> <label
				id="rememberLabel" for="checkRemember"> Remember me</label>
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
	<%@include file="Standard_Content_Footer.jsp" %>
	<!-- Footer -->
	<%@include file="Footer.jsp" %>
	<script>
		if('${loginErrorMsg}'!=''){
			changeBorderColor('${errorMsgShowID}','${loginErrorMsg}');
		}
		
		$('#rememberLabel').bind('click', function() {
			document.getElementById('checkBoxRemember').checked = !document.getElementById('checkBoxRemember').checked;
		});
		function reloadCode() {
			var time = new Date().getTime();
			document.getElementById("imageCode").src = "/WEB_JSP/CheckCode?" + time;
		}
		$("#imageCode").bind('click', reloadCode);
	
		function changeBorderColor(id, message) {
			$(id).css('border-color', '#f00');
			$(id).poshytip('destroy');
			$(id).poshytip({
				content : message,
				className : 'tip-skyblue',
				showOn : 'none',
				alignTo : 'target',
				alignX : 'inner-right',
				offsetY : '10'
			});
			$(id).poshytip('show');
			$(id).focus(function() {
				$(id).css('border-color', '#ccc');
				$(id).poshytip('destroy');
			});
		}
	
		$('#Login').submit(function() {
			var username = $("#inputUsername")[0].value;
			var password = $("#inputPassword")[0].value;
			var checkcode = $("#checkCode")[0].value;
	
			if (username.length == 0) {
				changeBorderColor("#inputUsername", "Please enter username");
				return false;
			}
			if (password.length < 6 || password.length > 20) {
				changeBorderColor("#inputPassword", "Password's length should be more than 7 and less than 20");
				return false;
			}
			if (checkcode.length != 4) {
				changeBorderColor("#checkCode", "Checkcode's length should be 4");
				return false;
			}
			return true;
		});
	</script>
</body>
</html>