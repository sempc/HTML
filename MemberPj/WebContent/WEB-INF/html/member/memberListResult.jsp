<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
[
<%
List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");
for(int i=0 ; i<list.size() ; i++) {
	// json타입으로 obj만들기 ==> { "name":"홍길동", "age":20, ~}
	
	if(i > 0) {
		%>,<%
	}
	
	MemberVO vo = list.get(i);
	String memId = vo.getMemId();
	String memName = vo.getMemName();
	
%>	{
		"memId": "<%=memId %>"
		, "memName": "<%=memName %>"
		, "memPass": "<%=vo.getMemPass() %>"
		, "memBir": "<%=vo.getMemBir() %>"
		, "memHp": "<%=vo.getMemHp() %>"
		, "memMail": "<%=vo.getMemMail() %>"
		, "memJob": "<%=vo.getMemJob() %>"
		, "no": "<%=i+1%>"
	} <%
}
%>
]
