<%@page import="common.Constant"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改新闻</title>
<%
	int seq=Integer.valueOf(request.getParameter("sequence"));
	String title,content,publisher,date,no;
	if(seq==-1){
		String[] mn=(String[])request.getSession().getAttribute("modifiedNews");
		no=mn[0];
		title=mn[1];
		content=mn[2];
		publisher=mn[3];
		date=mn[4];
	} else {
		String[][] res=(String[][])request.getSession().getAttribute("allResult");
		title=res[seq][1];
		content=res[seq][2];
		publisher=res[seq][3];
		date=res[seq][4];
		no=res[seq][0];
	}
	
	request.getSession().removeAttribute("allResult");
	request.getSession().removeAttribute("modifiedNews");
%>
<style>
*{
	margin:0;
	padding:0;
}
table{
	margin:30px 20%;
}
th,td{
	padding:5px;
}
th{
	background-color:#00f317;
}
td{
	background-color:#00f0a8;
}
.tt{
	background-color:#00fff7;
}
textarea{
	height:8em;
	width:32em;
	resize:none;
}
input[type=text]{
	height:1.5em;
}
.ti{
	width:32em;
}
input[type=button],input[type=submit],input[type=reset]{
	letter-spacing:2em;
	padding:5px 0 5px 2em;
	margin:10px auto;
}
</style>
</head>
<body>
<form name="fillform" action="../../../../ServletNewsModify" method="post" onsubmit="return permitSubmit();">
<table>
<tr>
	<th colspan="4">查看新闻</th>
</tr>
<tr>
	<td class="tt">新闻编号</td>
	<td colspan="3"><input class="ti" name="no" type="text" value="<%=no %>" readonly="readonly"></td>
</tr>
<tr>
	<td class="tt">新闻标题</td>
	<td colspan="3"><input class="ti" name="title" type="text" value="<%=title %>"></td>
</tr>
<tr>
	<td class="tt">新闻正文</td>
	<td colspan="3"><textarea name="content" rows="1" cols="1"><%=content %></textarea></td>
</tr>
<tr>
	<td class="tt">发布人</td>
	<td><input name="username" type="text" value="<%=publisher %>" readonly="readonly"></td>
	<td class="tt">发布时间</td>
	<td><input name="date" type="text" value="<%=date %>" readonly="readonly"></td>
</tr>
<tr>
	<td colspan="4" style="background-color:transparent;"><input style="margin-left:15%;" type="submit" value="提交">
	<input type="reset" value="重置">
	<input type="button" value="返回" onclick="backQuery()"></td>
</tr>
</table>
</form>
</body>
<script type="text/javascript">
function backQuery(){
	window.location="../query/newsQuery.jsp";
}
function permitSubmit(){
	var title=fillform.title.value;
	if(title.length==0){
		alert("新闻标题不能为空！");
		return false;
	}
	return true;
}
</script>
</html>