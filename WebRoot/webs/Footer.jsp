<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="clearfix">
	<nav class="navbar navbar-default" role="navigation"
		style="border-radius: 0px; bottom: 0px; margin: 20px 0px 0px 0px;">
		<p class="text-muted credit"
			style="padding: 10px; text-align: center;">
			<span id="copyright">&copy;2017 ocrosoft.com<br />
				浙ICP备16010729号 <span id='cc'>150104400108</span>
			</span>
		</p>
	</nav>
</div>
<script src="//debug.ocrosoft.com:8001/js/particlesON.js"></script>
<script src="//debug.ocrosoft.com:8001/js/main.js"></script>
<script>
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
	$('.panel-heading').css("cursor", "hand");
	$('.panel-heading').bind('click', function() {
		console.log(this.nextSibling.nextSibling);
		if (this.nextSibling.nextSibling.style.display == 'none')
			this.nextSibling.nextSibling.style.display = 'block';
		else
			this.nextSibling.nextSibling.style.display = 'none';
	});
</script>