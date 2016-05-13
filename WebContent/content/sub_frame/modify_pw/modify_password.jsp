<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改当前用户密码</title>
</head>
<style>
*{
	margin:0;
	padding:0;
}
th,td{
	padding:5px;
}
table{
	margin:20px 25%;
}
td{
	background-color:
}
th{
	background-color:#00fff7;
}
.bind{
	background-color:#00f317;
}
input[type=submit],input[type=reset]{
	width:4em;
	height:2em;
	letter-spacing:0.5em;
	padding-left:0.5em;
}
input[type=submit]{
	margin:0.5em 2em 0.5em 30%;
}
</style>
<body>
<form action="../../../ModifyPassword" method="post" name="inp" onsubmit="return couldSub();">
<table>
	<tr>
		<th colspan="2">修改密码</th>
	</tr>
	<tr>
		<td class="bind">输入原密码</td><td><input type="password" name="originalPW"></td>
	</tr>
	<tr>
		<td class="bind">输入新密码</td><td><input type="password" name="newPW"></td>
	</tr>
	<tr>
		<td class="bind">再次输入新密码</td><td><input type="password" name="newPW2"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit">
		<input type="reset"></td>
	</tr>
</table>
</form>
</body>
<script type="text/javascript">
function couldSub(){
	var pw1=inp.newPW.value,pw2=inp.newPW2.value;
	if(pw1!=(pw2)){
		alert("你新密码两次输入不一致！");
		return false;
	}
	if(pw1.length<6||pw1.length>16){
		alert("新密码长度必须在6到16位之间");
		return false;
	}
	return true;
}
</script>
</html>