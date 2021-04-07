<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<%
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		userId = URLDecoder.decode(userId);
	%>
</head>
<body>
	<h1 id="tmp">안녕하세요,<%=userId%></h1>
</body>
<script> 
<%--  	document.getElementById("tmp").innerHTML += decodeURI("<%=param%>");  --%>
</script>
</html>