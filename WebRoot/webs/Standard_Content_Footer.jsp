<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
<div class="col-md-1 column"></div>
<div class="col-md-3 column">

	<div class="panel panel-danger">
		<div class="panel-heading">查询学号或姓名</div>
		<div class="panel-body">
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
</div>
</div>
</div>