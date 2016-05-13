<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布新闻</title>
<style type="text/css">
table{
	margin:50px 20%;
}
th{
	padding:5px;
	background-color:#00fff7;
}
td{
	padding:5px;
}
.hint{
	background-color:#00ff4a;
}
.inp{
	width:300px;
}
.bt{
	margin:0px 20px;
}
</style>
</head>
<script type="text/javascript">
var biaoti,neirong;
function checkAll(){
	biaoti=tab.biaoti.value;
	if(biaoti.length==0){
		alert("新闻标题不能为空！");
		return false;
	}
	neirong=tab.neirong.value;
	if(neirong.length==0){
		alert("新闻正文不能为空！");
		return false;
	}
	return true;
}
</script>
<body>
<form action="../../../../ServletNewsAdd" method="post" name="tab" onsubmit="return checkAll();">
<table>
	<tr>
		<th colspan="2">发布新闻</th>
	</tr>
	<tr>
		<td class="hint">新闻标题</td>
		<td><input class="inp" type="text" name="title"></td>
	</tr>
	<tr>
		<td class="hint">新闻正文</td>
		<td><textarea class="inp" style="height:150px;" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input class="bt" type="submit" value="提交">
			<input class="bt" type="reset" value="重置">
		</td>
	</tr>
</table>
</form>
</body>
</html>