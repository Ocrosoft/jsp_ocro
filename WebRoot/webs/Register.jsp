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

<title>Register</title>
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
	<form role="form" action="/WEB_JSP/CodeChecker" method="post"
		id="Register">
		<div class="form-group">
			<label for="inputUsername">用户名</label><input type="text"
				class="form-control" name="inputUsername" id="inputUsername"
				placeholder="邮箱 / 姓名 / 手机号" />
		</div>
		<div class="form-group">
			<label for="inputPassword">密码</label><input type="password"
				class="form-control" name="inputPassword" id="inputPassword"
				placeholder="请输入你的密码" />
		</div>
		<div class="form-group">
			<label for="inputRepeatPassword">确认密码</label><input type="password"
				class="form-control" name="inputRepeatPassword"
				id="inputRepeatPassword" placeholder="请重复你的密码" />
		</div>
		<div class="form-group">
			<label for="selectorSex" style="display:block;">性别&nbsp</label> <label
				for="selectorSexMan"><input type="radio" name="optionSex"
				id="optionSex1" value="1" checked>&nbsp 男 &nbsp&nbsp</label> <label
				for="electorSexWoman"><input type="radio" name="optionSex"
				id="optionSex2" value="0">&nbsp 女 &nbsp&nbsp</label>
		</div>
		<div class="form-group">
			<label for="inputYear" style="display:block;">年龄</label> <input
				type="text" class="form-control" name="inputYear" id="inputYear"
				placeholder="请填写你的年龄" />
		</div>
		<div class="form-group">
			<label for="selectorGrade" style="display:block;">年级</label> <select
				class="form-control" name="selectGrade" id="selectGrade">
				<option value="2016">2016</option>
				<option value="2015">2015</option>
				<option value="2014">2014</option>
				<option value="2013">2013</option>
			</select>
		</div>
		<div class="form-group">
			<label for="selectorMajor" style="display:block;">专业</label> <select
				class="form-control" name="selectMajor" id="selectMajor">
				<option>电子商务</option>
				<option>计算机</option>
				<option>软件工程</option>
				<option>信息技术</option>
			</select>
		</div>
		<div class="form-group">
			<label for="inputCheckCode" style="display:block;">验证码</label> <input
				type="text" id="checkCode" name="checkCode" value=""
				class="form-control" style="width:75%;display:inline;"
				placeholder="请输入验证码" /> <img style="cursor:hand;float:right;"
				alt="CheckCode" id="imageCode" src="/WEB_JSP/CheckCode" />
		</div>
		<button type="submit" class="btn btn-primary form-control"
			id="buttonSubmit">注册</button>
		<a href="/WEB_JSP/webs/Login.jsp"> <input type="button"
			class="btn btn-link" style="right:0;position:absolute;outline: none"
			value="登录->" /></a>
	</form>
	<%@include file="Standard_Content_Footer.jsp"%>
	<!-- Footer -->
	<%@include file="Footer.jsp"%>
	<script>
		if ('${regErrorMsg}' != '') {
			changeBorderColor('${errorMsgShowID}', '${regErrorMsg}');
		}
	
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
				alignY : 'bottom',
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
			if (password != repassword) {
				changeBorderColor("#inputRepeatPassword", "两次输入的密码不一致！");
				return false;
			}
			if (year < 18 || year > 100) {
				changeBorderColor("#inputYear", "年龄需要满足:<br/>1.已年满十八周岁。<br/>2.不能超过100岁。");
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