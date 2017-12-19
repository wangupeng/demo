<div style="display: inline;">
	<div style="float: left; margin-left: 10px;">
		<ul class="pagination" id="pagination1"></ul>
	</div>
	<div style="float: right; margin-right: 10px;" class="pagination page-turning ">
		<span class="line-l">
			&nbsp;共&nbsp;<b>${myPage.totalRows }</b>&nbsp;条&nbsp;&nbsp;&nbsp;&nbsp;
			每页<input type="text" name="pageSize" id="pageSize" class="text" value="${myPage.pageSize }">条
			第<input type="text" name="pageNum" id="pageNum" class="text" value="${myPage.pageNum }">页
			&nbsp;共&nbsp;${myPage.totalPages }&nbsp;页
		</span> 
	</div>
</div>
<script>
$(function () {
	$('#queryResult').click(function(){
		loadSubmmit();
		$('#pageNum').val("1");
		$("form")[0].submit();
	 });
	$('#pageSize').blur(function () {
		
		if(isNaN($("#pageNum").val())||isNaN($("#pageSize").val())){
			layer.alert("页码请输入数字！");
			return false;
		}
		if(Number($('#pageSize').val())>=Number('${myPage.totalRows }')){
			$("#pageNum").val('1');
		}
		loadSubmmit();
		$("form")[0].submit();
	}); 
	$('#pageNum').blur(function () {
		if(isNaN($("#pageNum").val())||isNaN($("#pageSize").val())){
			layer.alert("页码请输入数字！");
			return false;
		}
		//选择页数超出范围，默认最后一页
		if(Number($("#pageNum").val())>Number('${myPage.totalPages }')){
			alert("页码超出范围！");
			return false;
			$("#pageNum").val("${myPage.totalPages }");
		}
		loadSubmmit();
		$("form")[0].submit();
	}); 
	<c:if test="${myPage.totalRows > 0 }">
		$('#pagination1').jqPaginator({
		    totalPages: <c:out value="${myPage.totalPages }"/>,
		    visiblePages: 5,
		    currentPage: <c:out value="${myPage.pageNum }"/>,
	
		    first: '<li class="first"><a href="javascript:;" onclick="goPage(\'1\')">首页</a></li>',
		    prev: '<li class="prev"><a href="javascript:;" onclick="goPage(\'${myPage.pageNum-1 }\')">上一页</a></li>',
		    next: '<li class="next"><a href="javascript:;" onclick="goPage(\'${myPage.pageNum+1 }\')">下一页</a></li>',
		    last: '<li class="last"><a href="javascript:;" onclick="goPage(\'${myPage.totalPages }\')">尾页</a></li>',
		    page: '<li class="page"><a href="javascript:;" onclick="goPage(\'{{page}}\')">{{page}}</a></li>',
		    onPageChange: function (num) {
		      //  $('#text').html('当前第' + num + '页');
		    }
		});
	</c:if>
});
function goPage(num){
	var totalPages = Number('${myPage.totalPages }');
	num = Number(num);
	if(num<1){
		return false;
	}else if(num>totalPages){
		return false;
	}
	if((num=='1'&& $("#pageNum").val()=='1')||($("#pageNum").val()=='${myPage.totalPages }' && num == '${myPage.totalPages }' )){
		return false;
	}
	$("#pageNum").val(num);
	loadSubmmit();
	$("form")[0].submit();
};
</script>