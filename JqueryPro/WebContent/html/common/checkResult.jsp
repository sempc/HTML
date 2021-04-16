<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%
Integer resultCnt = (Integer) request.getAttribute("resultCnt");
%>
{"resultCnt" : "<%=resultCnt%>"}