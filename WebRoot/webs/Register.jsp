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
<%@include file="Import_CSS.jsp" %>

<title>Register</title>
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
	<form role="form" action="/WEB_JSP/CodeChecker" method="post" id="Register">
		<div class="form-group">
			<label for="inputUsername">Username</label><input type="text"
				class="form-control" name="inputUsername" id="inputUsername"
				placeholder="Email/Phone Number/Name/ID" />
		</div>
		<div class="form-group">
			<label for="inputPassword">Password</label><input type="password"
				class="form-control" name="inputPassword" id="inputPassword"
				placeholder="Enter your password" />
		</div>
		<div class="form-group">
			<label for="inputRepeatPassword">Repeat Password</label><input
				type="password" class="form-control" name="inputRepeatPassword"
				id="inputRepeatPassword" placeholder="Repeat your password" />
		</div>
		<div class="form-group">
			<label for="selectorSex" style="display:block;">Sex&nbsp</label> <label
				for="selectorSexMan"><input type="radio" name="optionSex"
				id="optionSex1" value="1" checked>&nbspMale&nbsp</label> <label
				for="electorSexWoman"><input type="radio" name="optionSex"
				id="optionSex2" value="0">&nbspFemale&nbsp</label>
		</div>
		<div class="form-group">
			<label for="inputYear" style="display:block;">Year</label> <input
				type="text" class="form-control" name="inputYear" id="inputYear"
				placeholder="Enter your year" />
		</div>
		<div class="form-group">
			<label for="selectorGrade" style="display:block;">Grade</label> <select
				class="form-control" name="selectGrade" id="selectGrade">
				<option value="1">Grade 1</option>
				<option value="2">Grade 2</option>
				<option value="3">Grade 3</option>
				<option value="4">Grade 4</option>
			</select>
		</div>
		<div class="form-group">
			<label for="selectorMajor" style="display:block;">Major</label> <select
				class="form-control" name="selectMajor" id="selectMajor">
				<option>Software Engineering</option>
				<option>Computer</option>
				<option>Infomation</option>
				<option>Electronic Commerce</option>
			</select>
		</div>
		<div class="form-group">
			<label for="inputCheckCode" style="display:block;">CheckCode</label>
			<input type="text" id="checkCode" name="checkCode" value=""
				class="form-control" style="width:75%;display:inline;"
				placeholder="Enter checkcode" /> <img
				style="cursor:hand;float:right;" alt="CheckCode" id="imageCode"
				src="/WEB_JSP/CheckCode" />
		</div>
		<button type="submit" class="btn btn-primary form-control"
			id="buttonSubmit">Register</button>
		<a href="/WEB_JSP/webs/Login.jsp"> <input type="button"
			class="btn btn-link"
			style="right:0;position:absolute;outline: none" value="Login->" /></a>
	</form>
	<%@include file="Standard_Content_Footer.jsp" %>
	<!-- Footer -->
	<%@include file="Footer.jsp" %>
	<script>
		function reloadCode() {
			var time = new Date().getTime();
			document.getElementById("imageCode").src = "/WEB_JSP/CheckCode?" + time;
		}
		$("#imageCode").bind('click', reloadCode);
	
		function changeBorderColor(id,message) {
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
	
		$('#Register').submit(function() {
			var username = $("#inputUsername")[0].value;
			var password = $("#inputPassword")[0].value;
			var repassword = $("#inputRepeatPassword")[0].value;
			var year = $("#inputYear")[0].value;
			var checkcode = $("#checkCode")[0].value;
	
			if (username.length == 0) {
				changeBorderColor("#inputUsername","Please enter username");
				return false;
			}
			if (password.length < 6 || password.length > 20) {
				changeBorderColor("#inputPassword","Password's length should be more than 7 and less than 20");
				return false;
			}
			if (password != repassword) {
				changeBorderColor("#inputRepeatPassword","Password you entered is not equal");
				return false;
			}
			if (year < 18 || year > 100) {
				changeBorderColor("#inputYear","Please enter a valid age");
				return false;
			}
			if (checkcode.length != 4) {
				changeBorderColor("#checkCode","Checkcode's length should be 4");
				return false;
			}
	
			return true;
		});
	</script>
</body>
</html>