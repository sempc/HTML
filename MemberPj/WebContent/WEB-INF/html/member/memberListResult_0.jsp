<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<MemberVO> list = (List<MemberVO>) request.getAttribute("list");	%>
{
[

<%if(list != null || list.size() > 0 ) {                             	%>
<%	for(int i=0 ; i<list.size() ; i++) {                             	%>
<%		MemberVO vo = list.get(i);                                     	%>
<%		String id = vo.getMemId();                                     	%>
<%		String password = vo.getMemPass();                             	%>
<%		String name = vo.getMemName();                                 	%>
<%		int age = 0;                                                   	%>
<%		String memHp = vo.getMemHp();                                    	%>
<%		String addr1 = vo.getMemAdd1();                                	%>
<%		String addr2 = vo.getMemAdd2();                                	%>
<%		String zip = vo.getMemZip();                                   	%>
<%		String birthday = vo.getMemBir();                              	%>
<%		String job = "";//vo.getMemJobName();                                   	%>
<%		String mail = vo.getMemMail();                                 	%>
<%		                                                               	%>
<%		if(i > 0) {                                                    	%>

			,

<%		}																%>

		{
			"id" : "<%=id %>"
			, "password" : "<%=password %>"
			, "job" : "<%=job %>"
			, "addr" : "<%=addr1 + " " +addr2 %>"
			, "name" : "<%=name %>"
			, "mail" : "<%=mail %>"
			, "memHp" : "<%=memHp %>"
			, "birthday" : "<%=birthday %>"
		}

<%	}																	%>
<%}																		%>

]

}