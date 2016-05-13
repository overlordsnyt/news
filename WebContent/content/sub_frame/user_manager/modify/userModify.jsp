<%@page import="common.Userinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
</head>
<%
	String[][] res=(String[][])request.getSession().getAttribute("userResult");
	int seq=Integer.valueOf(request.getParameter("sequence"));
	String username,sex,profession,favourite,note,type;
	username=res[seq][0];
	sex=res[seq][2];
	profession=res[seq][3];
	favourite=res[seq][4];
	note=res[seq][5];
	type=res[seq][6];
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
.sr{
	letter-spacing:2em;
	padding:5px 0 5px 2em;
}
input[type=button]{
	letter-spacing:2em;
	padding:5px 0 5px 2em;
	margin:10px auto;
}
input[type=submit]{
	margin-left:15%;
}
input[type=password]{
	height:1.5em;
}
</style>
<body>
<form action="../../../../userModify" method="post">
<table>
<tr>
	<th colspan="4">用户信息</th>
</tr>
<tr>
	<td class="tt">用户名</td>
	<td colspan="3"><input class="ti" type="text" name="username" value="<%=username %>" readonly="readonly"></td>
</tr>
<tr>
	<td class="tt">密码</td>
	<td ><input type="password" name="password"></td>
	<td class="tt">确认密码</td>
	<td ><input type="password" name="repassword"></td>
</tr>
<tr>
	<td class="tt">性别</td>
	<td>
	<input type="radio" name="sex" value="0" <%if("0".equals(sex))out.print("checked=\"checked\""); %> >
	男&nbsp;&nbsp;
	<input type="radio" name="sex" value="1" <%if("1".equals(sex))out.print("checked=\"checked\""); %> >
	女&nbsp;&nbsp;
	</td>
	<td class="tt">职业</td>
	<td>
		<select name="profession" >
				<option value="学生" <%if("学生".equals(profession))out.print("selected=\"selected\""); %> >学生</option>
				<option value="程序员" <%if("程序员".equals(profession))out.print("selected=\"selected\""); %>>程序员</option>
				<option value="教师" <%if("教师".equals(profession))out.print("selected=\"selected\""); %>>教师</option>
		</select>
	</td>
</tr>
<tr>
	<td class="tt">个人爱好</td>
	<td colspan="3">
		<input type="checkbox" name="favourite" value="电脑网络" <%if(Userinfo.judgeFavourite1(favourite))out.print("checked=\"checked\""); %>>电脑网络&nbsp;&nbsp;
		<input type="checkbox" name="favourite" value="影视娱乐"  <%if(Userinfo.judgeFavourite2(favourite))out.print("checked=\"checked\""); %>>影视娱乐&nbsp;&nbsp;
		<input type="checkbox" name="favourite" value="棋牌娱乐"  <%if(Userinfo.judgeFavourite3(favourite))out.print("checked=\"checked\""); %>>棋牌娱乐&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td class="tt">个人说明</td>
	<td colspan="3"><textarea name="note" rows="1" cols="1"><%=note %></textarea></td>
</tr>
<tr>
	<td class="tt">用户类型</td>
	<td colspan="3">
		<input type="radio" value="0" name="type" <%if("0".equals(type))out.print("checked=\"checked\""); %> >
		管理员&nbsp;&nbsp;
		<input type="radio" value="1" name="type" <%if("1".equals(type))out.print("checked=\"checked\""); %> >
		一般用户&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td colspan="4" style="background-color:transparent;">
		<input class="sr" type="submit">
		<input class="sr" type="reset">
		<input type="button" value="返回" onclick="backQuery()">
	</td>
</tr>
</table>
</form>
</body>
<%
	request.getSession().setAttribute("queryUsers", res);
	request.getSession().removeAttribute("userResult");
%>
<script type="text/javascript">
function backQuery(){
	window.location="../query/userQuery.jsp";
}
</script>
</html>