<%@page import="reg.Register"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
<jsp:useBean id="info" class="reg.Register" scope="session">
</jsp:useBean>

</head>
<body>
<h1 style="text-align: center;">注册成功！</h1>
您输入的用户名：<jsp:getProperty name="info" property="username"/><br>
您输入的密码：<jsp:getProperty property="password" name="info"/><br>
您选择的性别：<jsp:getProperty property="sex" name="info"/><br>
您的职业：<jsp:getProperty property="profession" name="info"/><br>
您的爱好：<jsp:getProperty property="favourite" name="info"/><br>
您的个人说明：<jsp:getProperty property="note" name="info"/><br>
<h1><a href="../logweb/login.jsp">进入登录页面</a></h1>
</body>
</html>