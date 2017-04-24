<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
<div class="col-md-1 column"></div>
<div class="col-md-3 column">

	<div class="panel panel-success">
		<div class="panel-heading">点名记录</div>
		<div class="panel-body" style="display:none;">
			<form class="form-horizontal" method="post" action="RollcallQuery"
				id="Query">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" name="rollcall_search_key" class="form-control"
							id="rollcall_search_key" placeholder="请输入学号或姓名">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-default form-control">查询</button>
					</div>
				</div>
			</form>
			<script>
				$('#Query').submit(function() {
					var rollcall_search_key = $('#rollcall_search_key')[0].value.trim()
					if (rollcall_search_key.length == 0) {
						changeBorderColor('#rollcall_search_key', '请输入搜索关键词');
						return false;
					}
					return true;
				});
			</script>
		</div>
	</div>

	<div class="panel panel-success">
		<div class="panel-heading">点名统计</div>
		<div class="panel-body" style="display:none;">
			<form class="form-horizontal" method="post" action="RollcallCount"
				id="Count">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" name="rollcall_count_key" class="form-control"
							id="rollcall_count_key" placeholder="请输入学号或姓名">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-default form-control">查询</button>
					</div>
				</div>
			</form>
			<script>
				$('#Count').submit(function() {
					var rollcall_search_key = $('#rollcall_count_key')[0].value.trim()
					if (rollcall_search_key.length == 0) {
						changeBorderColor('#rollcall_count_key', '请输入搜索关键词');
						return false;
					}
					return true;
				});
			</script>
		</div>
	</div>

	<div class="panel panel-success">
		<div class="panel-heading">按周次查询</div>
		<div class="panel-body" style="display:none;">
			<form class="form-horizontal" method="post" action="RollcallQuery"
				id="QueryByZC">
				<div class="form-group">
					<div class="col-sm-12">
						<select class="form-control" name="selectorSJZ" id="selectorSJZ">
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
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<select class="form-control" name="selectorSJX" id="selectorSJX">
							<option value="1">星期一</option>
							<option value="2">星期二</option>
							<option value="3">星期三</option>
							<option value="4">星期四</option>
							<option value="5">星期五</option>
							<option value="6">星期六</option>
							<option value="6">星期天</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-default form-control">查询</button>
					</div>
				</div>
			</form>
			<script>
				$('#QueryByZC').submit(function() {
					var rollcall_search_key = $('#rollcall_query_zc_key')[0].value.trim()
					if (rollcall_search_key.length == 0) {
						changeBorderColor('#rollcall_query_zc_key', '请输入搜索关键词');
						return false;
					}
					return true;
				});
			</script>
		</div>
	</div>
	
	<div class="panel panel-success">
		<div class="panel-heading">查询作废记录</div>
		<div class="panel-body" style="display:none;">
			<form class="form-horizontal" method="post" action="RollcallCancelDrop"
				id="Query">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" name="rollcall_cancel_key" class="form-control"
							id="rollcall_cancel_key" placeholder="请输入学号或姓名(可留空)">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-default form-control">查询</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
</div>
</div>