<%@page import="common.Userinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询用户信息</title>
</head>
<%
	String[][] res=(String[][])request.getSession().getAttribute("queryUsers");
	boolean queried=res!=null;
	String sex,type;
%>
<style>
*{
	margin:0;
	padding:0;
}
h1{
	color:red;
	margin:30px 30%;
}
table{
	margin:30px 30%;
}
.Qresult{
	margin:0px 22%;
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
	margin:10px 30%;
}
input[type=text]{
	height:1.5em;
}
</style>
<body>
<form action="../../../../userQuery" method="post">
<table>
	<tr>
		<th colspan="2" class="tt">查询用户</th>
	</tr>
	<tr>
		<td class="ti">用户名</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td colspan="2"><input class="bt" type="submit" value="提交"></td>
	</tr>
</table>
<%
	if(queried){
%>	
<table class="Qresult">
	<tr>
		<th>用户名</th>
		<th>性别</th>
		<th>职业</th>
		<th>用户类型</th>
		<th>操作</th>
	</tr>
	<%
		for(int i=0;i<res.length;i++){
	%>
			<tr>
				<td><%=res[i][0] %></td>
				<td><%=Userinfo.transSex(res[i][2]) %></td>
				<td><%=res[i][3] %></td>
				<td><%=Userinfo.transType(res[i][6]) %></td>
				<td>
					<a href="./userDetail.jsp?sequence=<%=i %>">查看</a>
					<a href="../modify/userModify.jsp?sequence=<%=i %>">修改</a>
					<a href="../../../../userDelete?sequence=<%=i %>" onclick="return reallyDel('<%=res[i][0] %>')">删除</a>
				</td>
			</tr>
	<%
		}
	%>
</table>
<%
	} else if(request.getSession().getAttribute("submitted")!=null){
		%>
		<h1>没有查询结果！</h1>
		<%
	}
	request.getSession().setAttribute("userResult", res);
	request.getSession().removeAttribute("queryUsers");
	request.getSession().removeAttribute("submitted");
%>
</form>
</body>
<script type="text/javascript">
function reallyDel(uuu){
	var hint="确认要删除用户:"+uuu+"？";
	var jg=confirm(hint);
	if(jg){
		return true;
	}
	return false;
}
</script>
</html>