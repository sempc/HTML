<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
MemberVO memberVo = (MemberVO)request.getAttribute("memberVo");
if(memberVo == null) {
	%>{"result" : "OK"}<%
} else {
	%>{}<%
}
%>