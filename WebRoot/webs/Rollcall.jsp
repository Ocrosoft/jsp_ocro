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

<title>Rollcall</title>

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

	<form id="Rollcall" class="form-horizontal" role="form"
		action="/WEB_JSP/RollcallAct" method="post">
		<div class="form-group">
			<label for="inputXH">学号</label>
			<div>
				<input class="form-control" id="inputXH" placeholder="请输入学号"
					name="inputXH" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputName">姓名</label>
			<div>
				<input class="form-control" name="inputName" id="inputName"
					placeholder="请输入姓名" />
			</div>
		</div>
		<div class="form-group">
			<label for="selectorSJ" style="display:block;">点名时间</label> <select
				class="form-control" name="selectorSJZ" id="selectorSJZ"
				style="width:48%;float:left;">
				<option value="1">第1周</option>
				<option value="2">第2周</option>
				<option value="3">第3周</option>
				<option value="4">第4周</option>
				<option value="5">第5周</option>
				<option value="6">第6周</option>
				<option value="7">第7周</option>
				<option value="8">第8周</option>
				<option value="9">第9周</option>
				<option value="10">第10周</option>
				<option value="11">第11周</option>
				<option value="12">第12周</option>
				<option value="13">第13周</option>
				<option value="14">第14周</option>
				<option value="15">第15周</option>
				<option value="16">第16周</option>
				<option value="17">第17周</option>
				<option value="18">第18周</option>
			</select> <select class="form-control" name="selectorSJX" id="selectorSJX"
				style="width:48%;float:right;">
				<option value="1">星期一</option>
				<option value="2">星期二</option>
				<option value="3">星期三</option>
				<option value="4">星期四</option>
				<option value="5">星期五</option>
				<option value="6">星期六</option>
				<option value="6">星期天</option>
			</select>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary form-control"
				id="buttonSubmit">提交点名</button>
		</div>
	</form>

	<%@include file="Standard_Content_Footer.jsp"%>
	<!-- Footer -->
	<%@include file="Footer.jsp"%>
</body>
<script>
	if ('${rollcallErrorMsg}' != '') {
			changeBorderColor('${errorMsgShowID}', '${rollcallErrorMsg}');
		}

	$('#Rollcall').submit(function() {
		var xh = $("#inputXH")[0].value;
		var xm = $("#inputName")[0].value.trim();
		var reg = new RegExp("^\\d{12}$");
		console.log(xh);
		if (!reg.test(xh)) {
			changeBorderColor("#inputXH", "学号需要满足:<br/>1.长度必须为12.<br/>2.只包含数字.");
			return false;
		}
		reg = new RegExp("^[ a-zA-Z\u4e00-\u9fa5a]{1,20}$");
		if (!reg.test(xm)) {
			changeBorderColor("#inputName", "姓名需要满足:<br/>1.长度至少为1, 至多为20.<br/>2.只包含中英文或空格.");
			return false;
		}
		return true;
	});
</script>
</html>
