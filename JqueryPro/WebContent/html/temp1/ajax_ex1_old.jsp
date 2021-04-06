<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
String age = request.getParameter("age");
String name = request.getParameter("name");
%>
<body>
나이 <%= age %>세 인 <%= name %>님 환영합니다.
AJAX를 공부합시다!
</body>
</html>