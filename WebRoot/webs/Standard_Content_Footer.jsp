<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
</div>
<div class="col-md-1 column"></div>
<div class="col-md-3 column">
	
	<div class="panel panel-danger">
		<div class="panel-heading">查询学号或姓名</div>
		<div class="panel-body">
			<form class="form-horizontal" method="post" action="QueryAction">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" name="key" class="form-control"
							placeholder="请输入学号或姓名" required>
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