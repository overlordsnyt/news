<%@page import="common.Userinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询详细</title>
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
	<th colspan="4">用户信息</th>
</tr>
<tr>
	<td class="tt">用户名</td>
	<td colspan="3"><input class="ti" type="text" value="<%=username %>" readonly="readonly"></td>
</tr>
<tr>
	<td class="tt">密码</td>
	<td colspan="3"><input class="ti" type="text" value="" readonly="readonly"></td>
</tr>
<tr>
	<td class="tt">性别</td>
	<td>
	<input type="radio" name="sex" <%if("0".equals(sex))out.print("checked=\"checked\""); %> disabled="disabled">
	男&nbsp;&nbsp;
	<input type="radio" name="sex" <%if("1".equals(sex))out.print("checked=\"checked\""); %> disabled="disabled">
	女&nbsp;&nbsp;
	</td>
	<td class="tt">职业</td>
	<td>
		<select name="profession" disabled="disabled">
				<option value="学生" <%if("学生".equals(profession))out.print("selected=\"selected\""); %> >学生</option>
				<option value="程序员" <%if("程序员".equals(profession))out.print("selected=\"selected\""); %>>程序员</option>
				<option value="教师" <%if("教师".equals(profession))out.print("selected=\"selected\""); %>>教师</option>
		</select>
	</td>
</tr>
<tr>
	<td class="tt">个人爱好</td>
	<td colspan="3">
		<input type="checkbox" name="favourite" disabled="disabled" <%if(Userinfo.judgeFavourite1(favourite))out.print("checked=\"checked\""); %>>电脑网络&nbsp;&nbsp;
		<input type="checkbox" name="favourite" disabled="disabled" <%if(Userinfo.judgeFavourite2(favourite))out.print("checked=\"checked\""); %>>影视娱乐&nbsp;&nbsp;
		<input type="checkbox" name="favourite" disabled="disabled" <%if(Userinfo.judgeFavourite3(favourite))out.print("checked=\"checked\""); %>>棋牌娱乐&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td class="tt">个人说明</td>
	<td colspan="3"><textarea rows="1" cols="1" readonly="readonly" ><%=note %></textarea></td>
</tr>
<tr>
	<td class="tt">用户类型</td>
	<td colspan="3">
		<input type="radio" name="type" <%if("0".equals(type))out.print("checked=\"checked\""); %> disabled="disabled">
		管理员&nbsp;&nbsp;
		<input type="radio" name="type" <%if("1".equals(type))out.print("checked=\"checked\""); %> disabled="disabled">
		一般用户&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td colspan="4" style="background-color:transparent;"><input type="button" value="返回" onclick="backQuery()"></td>
</tr>
</table>
</body>
<%
	request.getSession().setAttribute("queryUsers", res);
	request.getSession().removeAttribute("userResult");
%>
<script type="text/javascript">
function backQuery(){
	window.location="./userQuery.jsp";
}
</script>
</html>