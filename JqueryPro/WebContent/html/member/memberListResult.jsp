<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

[
<%
//�������� ��ȸ����� "list"��� key�� request�� �������
List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");

for(int i=0 ; i<list.size() ; i++) {
	MemberVO vo = list.get(i);
	String memId = vo.getMemId();
	String memName = vo.getMemName();
	
	//json Ÿ������ ������ �ϴ� �κ� ==> {name : "~", id : "~"}
	
	if(i > 0) {
		%>,<%
	}
	
	%>
	{"name" : "<%=memName %>", "id" : "<%=memId %>"}
	<%
}

%>

]