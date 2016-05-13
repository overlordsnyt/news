<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
</head>
<jsp:useBean id="userinfo" class="common.Userinfo" scope="session"></jsp:useBean>
<body>
<h1 style="text-align:center;">
欢迎<jsp:getProperty property="username" name="userinfo"/>
</h1>
</body>
</html>