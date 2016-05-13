<%@page import="common.Constant"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看新闻</title>
<%
	/* 
	通过get方法传值，最大1024字节，编码转换方式
	String title,content,publisher,date;
	title=new String(request.getParameter("thisTitle").getBytes(Constant.STARDARDGET),Constant.CHARSET);
	content=new String(request.getParameter("thisContent").getBytes(Constant.STARDARDGET),Constant.CHARSET);
	publisher=new String(request.getParameter("thisPublisher").getBytes(Constant.STARDARDGET),Constant.CHARSET);
	date=new String(request.getParameter("thisDate").getBytes(Constant.STARDARDGET),Constant.CHARSET); */
	String[][] res=(String[][])request.getSession().getAttribute("allResult");
	int seq=Integer.valueOf(request.getParameter("sequence"));
	String title,content,publisher,date;
	title=res[seq][1];
	content=res[seq][2];
	publisher=res[seq][3];
	date=res[seq][4];
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
input[type=button]{
	letter-spacing:2em;
	padding:5px 0 5px 2em;
	margin:10px 40%;
}
</style>
</head>
<body>
<table>
<tr>
	<th colspan="4">查看新闻</th>
</tr>
<tr>
	<td class="tt">新闻标题</td>
	<td colspan="3"><input class="ti" type="text" value="<%=title %>" readonly="readonly"></td>
</tr>
<tr>
	<td class="tt">新闻正文</td>
	<td colspan="3"><textarea rows="1" cols="1" readonly="readonly" ><%=content %></textarea></td>
</tr>
<tr>
	<td class="tt">发布人</td>
	<td><input type="text" value="<%=publisher %>" readonly="readonly"></td>
	<td class="tt">发布时间</td>
	<td><input type="text" value="<%=date %>" readonly="readonly"></td>
</tr>
<tr>
	<td colspan="4" style="background-color:transparent;"><input type="button" value="返回" onclick="backQuery()"></td>
</tr>
</table>
</body>
<script type="text/javascript">
function backQuery(){
	window.location="./newsQuery.jsp";
}
</script>
</html>