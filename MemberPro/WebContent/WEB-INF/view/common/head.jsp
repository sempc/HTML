<%@page import="kr.or.ddit.base.vo.ConstVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/listcss.css?v=1">
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/myutils.js"></script>
	<script src="<%=request.getContextPath()%>/js/member/memberList.js?v=1"></script>
	<%
	String url = request.getRequestURI().replace(ConstVO.VIEW_ROOT, ConstVO.WEB_ROOT_JS);
	%>
	<script src="<%=url%>"></script>
	
</head>