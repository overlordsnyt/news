<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<style type="text/css">
*{
	margin:0px;
	padding:0px;
}
.top{
	margin:30px auto;
	width:600px;
}
.title{
	background-color:green;
	width:500px;
}
td{
	padding:4px;
}
#bg{
	background-color: green;
}
.butter{
	margin-left:5%;
	width:6em;
	height:2em;
}
</style>
</head>
<script type="text/javascript">
var regexp;
var username,password,repassword;
function checkAll(){
// 	检测用户名是否不为空且为中文
	username=regs.username.value;
	regexp=/^[\u4E00-\u9FA5]+$/;
	if(!regexp.test(username)){
		alert("用户名不为空且为中文!");
		return false;
	}
// 	检测密码输入是否长度至少为6位
	password=regs.password.value;
	if(password.length<6){
		alert("密码长度至少为6位！");
		return false;
	}
// 	检测两次输入的密码是否一致
	repassword=regs.repassword.value;
	if(password!=repassword){
		alert("你两次输入的密码不一致！");
		return false;
	}
	return true;
}
</script>
<body>
<h1 style="margin-top:10px;text-align:center;">注册页面</h1>
<div class="top">
	<div class="title">
		<h3>新用户注册</h3>
	</div>
<form action="../RegisterServlet" method="post" name="regs" onsubmit="return checkAll();">
<table>
	<tr>
		<td id="bg" style="width:5em;"><b>用户名</b></td><td colspan="3"><input type="text" name="username" style="width:30em;"></td>
	</tr>
	<tr>
		<td><b>密码</b></td><td><input type="password" name="password"></td>
		<td style="width:5em;"><b>确认密码</b></td><td><input type="password" name="repassword"></td>
	</tr>
	<tr>
		<td id="bg"><b>性别</b></td>
		<td><input type="radio" name="sex" value="0" checked="checked"><b>男</b>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="1"><b>女</b></td>
		<td id="bg"><b>职业</b></td>
		<td>
			<select name="profession">
				<option value="学生">学生</option>
				<option value="程序员">程序员</option>
				<option value="教师">教师</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><b>个人爱好</b></td>
		<td id="bg" colspan="3">
			<input type="checkbox" name="favourite" value="电脑网络"><b>电脑网络</b>&nbsp;&nbsp;
			<input type="checkbox" name="favourite" value="影视娱乐"><b>影视娱乐</b>&nbsp;&nbsp;
			<input type="checkbox" name="favourite" value="棋牌娱乐"><b>棋牌娱乐</b>&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td id="bg"><b>个人说明</b></td><td colspan="3"><textarea name="note" rows="12" cols="45"></textarea></td>
	</tr>
	<tr>
		<td colspan="4" style="text-align:center;">
			<input class="butter" type="submit" value="提交">
			<input class="butter" type="reset" value="重置">
			<input class="butter" type="button" value="返回登录" onclick="window.location.href='../logweb/login.jsp';">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>