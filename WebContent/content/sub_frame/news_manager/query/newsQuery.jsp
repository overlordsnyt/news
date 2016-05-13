<%@page import="common.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻查询</title>
</head>
<%	
	//从session中获取查询结果
	String[][] res=(String[][])request.getSession().getAttribute("queryResult");
	//是否已执行过查询
	boolean queried=res!=null;
%>
<style>
*{
	margin:0;
	padding:0;
}
table{
	margin:30px 20%;
}
.Qresult{
	margin:0px 15%;
}
.Qresult th{
	background-color:#00f317;
}
.Qresult td{
	background-color:#00f2c8;
}
th,td{
	padding:5px;
}
.tt{
	background-color:#00fff7;
}
.ti{
	background-color:#00ff4a;
}
.bt{
	letter-spacing:2em;
	padding:5px 0 5px 2em;
	margin:10px 35%;
}
input[type=text]{
	height:1.5em;
}
</style>
<body>
<form action="../../../../ServletNewsQuery" method="post">
<table>
	<tr>
		<th colspan="4" class="tt">查询新闻</th>
	</tr>
	<tr>
		<td class="ti">新闻标题</td><td><input type="text" name="title"></td>
		<td class="ti">发布人</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td colspan="4"><input class="bt" type="submit" value="提交"></td>
	</tr>
</table>
<%
	if(queried){
%>	
<table class="Qresult">
	<tr>
		<th>新闻编号</th>
		<th>新闻标题</th>
		<th>发布人</th>
		<th>发布时间</th>
		<th>操作</th>
	</tr>
	<%
		for(int i=0;i<res.length;i++){
	%>
			<tr>
				<td><%=res[i][0] %></td>
				<td><%=res[i][1] %></td>
				<td><%=res[i][3] %></td>
				<td><%=res[i][4] %></td>
				<td>
					<a href="./newsRead.jsp?sequence=<%=i %>">查看</a>
					<a href="../modify/newsModify.jsp?sequence=<%=i %>">修改</a>
					<a href="../../../../newsDel?newsid=<%=res[i][0] %>" onclick="return reallyDel('<%=res[i][1]%>');">删除</a>
				</td>
			</tr>
	<%
		}
	%>
</table>
<%
	}
	request.getSession().setAttribute("allResult", res);
	request.getSession().removeAttribute("queryResult");
%>
</form>
</body>
<script type="text/javascript">
function reallyDel(titi){
	var hint="确认要删除新闻:“"+titi+"”？";
	var jg=confirm(hint);
	if(jg){
		return true;
	}
	return false;
}
</script>
</html>