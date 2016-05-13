<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String error=(String)session.getAttribute("error");
%>
<body>
<h1 style="text-align: center;color: red">注册失败！</h1>
<h2>错误信息：<%=error %></h2>
<h1><a href="./register.jsp">重新注册</a></h1>
</body>
</html>