<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻发布系统-登录页面</title>
<style type="text/css">
*{
	margin:0px;
	padding:0px;
}
table{
	table-layout:auto;
	margin:20px auto;
}
.bg{
	background-color:green;
}
td,th{
	padding:4px;
}
.tf{
	height:20px;
}
.bt{
	height:2em;
	width:6em;
	margin-left:1em;
	letter-spacing:10px;
}
</style>
</head>
<script type="text/javascript">
var username,password,regexp;
function checkAll(){
	username=tab.username.value;
	password=tab.password.value;
	if(username.length==0||password.length==0){
		alert("用户名或密码不能为空！");
		return false;
	}
	regexp=/^[\u4E00-\u9FA5]+$/;
	if(!regexp.test(username)){
		alert("用户名只能输入中文!");
		return false;
	}
	if(password.length<6||password.length>16){
		alert("密码长度为6到16位！");
		return false
	}
	return true;
}
</script>
<body style="text-align: center;">
<h1>新闻发布系统</h1>
<form action="../ServletLogin" method="post" name="tab" onsubmit="return checkAll();">
	<table>
		<tr>
			<th colspan="4" class="bg">用户登录</th>
		</tr>
		<tr>
			<td class="bg">用户名</td><td><input class="tf" type="text" name="username"></td>
			<td class="bg">密码</td><td><input class="tf" type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" value="提交" class="bt">
				<input type="reset" value="重置" class="bt">
				<input type="button" value="注册" class="bt" onclick="window.location.href='../regweb/register.jsp';">
			</td>
		</tr>
	</table>
</form>
</body>
</html>