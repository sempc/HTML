<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DDIT AJAX</title>
	<!-- style -->	
	<link rel="stylesheet" type="text/css" href="../../css/listcss.css?v=1">
	<!-- js -->
	<script src="../../js/jquery-3.5.1.js"></script>
	<script src="../../js/com/dditUtils.js"></script>
	<script src="../../js/member/memberView.js"></script>

	<%
	MemberVO memberVo = (MemberVO) request.getAttribute("memberVo");
	String sMemHometel = "";
	%>
	<script type="text/javascript">
	$(function() {
		$("#selectedMemId").val('<%=memberVo.getMemId()%>');
		
		//생년월일 포맷
		var sMemBir = formatDate("yyyy-mm-dd", '<%=memberVo.getMemBir()%>');
		$("#spMemBir").text(sMemBir);
		//기념일 포맷
		var sMememorial = formatDate("yyyy-mm-dd", '<%=memberVo.getMemMemorialday()%>');
		$("#spMememorial").text("["+"<%=memberVo.getMemMemorial()%>"+"] " + sMememorial);
		
		//집전화번호 포맷
		//...
		//핸드폰번호 포맷
		var sMemHp = format("hpno", '<%=memberVo.getMemHp()%>');
		$("#spMemHp").text(sMemHp);
		//회사전화번호 포맷
		var sMemComtel = "";
		$("#spMemComtel").text(sMemComtel);
		
	})
	
	</script>
</head>
<body>
	<!-- 본문영역 시작 -->
	<main id="content" class="layout3">
		<article class="card detail-wrap">
            <header class="card-header">
                <h4>회원정보</h4>
            </header>
			<div class="card-body">
				<dl>
					<dt>회원ID</dt>
					<dd><%=memberVo.getMemId() %></dd>
					<dt>회원명</dt>
					<dd><%=memberVo.getMemName() %></dd>
				</dl>
				<dl>
					<dt>비밀번호</dt>
					<dd><%=memberVo.getMemPass() %></dd>
					<dt>생년월일</dt>
					<dd><span id="spMemBir"></span></dd>
				</dl>
				<dl>
					<dt>집전화번호</dt>
					<dd><script>document.write(format("telno", '<%=sMemHometel %>'))</script></dd>
					<dt>핸드폰번호</dt>
					<dd><span id="spMemHp"></span></dd>
				</dl>
				<dl>
					<dt>회사전화번호</dt>
					<dd><span id="spMemComtel"></span></dd>
					<dt>이메일</dt>
					<dd><%=memberVo.getMemMail() %></dd>
				</dl>
				<dl>
					<dt>주소</dt>
					<dd><span class="zipno"><%=memberVo.getMemZip() %></span><%=memberVo.getMemAdd1() + " " + memberVo.getMemAdd2() %></dd>
				</dl>
				<dl>
					<dt>직업</dt>
					<dd><%=memberVo.getMemJobName() %></dd>
					<dt>기념일</dt>
					<dd><span id="spMememorial"></span></dd>
				</dl>
				<dl>
					<dt>취미</dt>
					<dd><%=memberVo.getMemLike() %></dd>
					<dt>마일리지</dt>
					<dd><%=memberVo.getMemMileage() %></dd>
				</dl>
				<dl>
					<dt>첨부파일</dt>
					<dd class="mh300">
						<img alt="" src="../../images/no_cat.jpg" height="200">
					</dd>
				</dl>
				<dl>
					<dt>내용</dt>
					<dd class="h300">
					</dd>
				</dl>
				
			</div>
		</article>
		
		<div class="page-footer">
			<div class="btn-box-center">
				<button type="button" class="btn btn-secondary lg" onclick="goList()">목록</button>
				<button type="button" class="btn btn-secondary lg" onclick="goBack()">이전화면</button>
				<button type="button" class="btn btn-primary lg" onclick="goEdit()">수정</button>
			</div>
		</div>
	</main>
	<form id="fm">
		<input type="hidden" id="selectedMemId" name="memId">
		<input type="hidden" id="action" name="action">
		<input type="hidden" id="viewType" name="viewType">
		<input type="hidden" id="targetUrl" name="targetUrl">
	</form>
	<!-- 본문영역 끝 -->

</body>
</html>