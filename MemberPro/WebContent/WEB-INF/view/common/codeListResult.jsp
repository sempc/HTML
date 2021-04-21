<%@page import="kr.or.ddit.common.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
[
<%
List<CodeVO> list = (List<CodeVO>)request.getAttribute("list");

for(int i = 0 ; i < list.size() ; i++) {
	if(i > 0) {
		%>,<%
	}
	
	String code = list.get(i).getCode();
// 	String codeName = list.get(i).getCodeName();
	%>
	{
		"value" : "<%=code %>"
		, "name" : "<%=list.get(i).getCodeName() %>"
	}
	<%
}

/*
 {"value" : "07", "name" : "군인"}
 ,{"value" : "08", "name" : "전업주부"}
*/

%>
]