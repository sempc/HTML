<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="<%=request.getContextPath()%>/js/common/myutils.js"></script>
</head>
<body>
	<p>회원관리 페이지 입니다.</p>
	<a href="javascript:movePage2('/member/memberList.jsp');">메뉴로 이동</a>
	<form id="fmPg">
		<input type="hidden" name="targetUrl">
	</form>
</body>
</html>