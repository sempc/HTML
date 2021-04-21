<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/listcss.css?v=1">
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/myutils.js"></script>
<script src="<%=request.getContextPath()%>/js/member/memberList.js?v=1"></script>
</head>
<body>
	<!-- 본문영역 시작 -->
	<main id="content">
		<!-- 검색영역 -->
		<article class="search-wrap">
			<header class="search-wrap-header">
				<h4>검색조건</h4>
			</header>
			<div class="search-wrap-body">
				<form id="fm">
					<dl>
						<dt>ID</dt>
						<dd>
							<input type="text" name="memId" id="memId">
						</dd>
						<dt>이름</dt>
						<dd>
							<input type="text" name="memName" id="memName">
						</dd>
					</dl>
					<div class="btn-box-center">
						<button class="btn btn-search" type="button" id="btnSearch"><i class="ico-search-w"></i>검색</button>
						<button class="btn btn-reset" type="reset" id="btnReset"><i class="ico-reset-w"></i>초기화</button>
					</div>
					<input type="hidden" name="flag" value="L">
				</form>
			</div>
		</article>
		<!-- 그리드 목록 -->
		<article class="grid-wrap">
			<header class="grid-wrap-header">
				<h4>회원목록</h4>
				<div class="btn-box-right">
					<div class="btn-group">
						<button type="button" class="btn btn-outline" id="btnExcel1"><i class="ico-download2"></i>엑셀다운로드</button>
						<button type="button" class="btn btn-outline" id="btnExcel2"><i class="ico-excel2"></i>엑셀(상세)다운로드</button>
					</div>
					<button type="reset" class="btn btn-outline"><i class="ico-sms"></i>SMS보내기</button>
				</div>
			</header>
			<div class="grid-wrap-body">
				<table class="gridtbl tbl" id="tbResult">
					<caption>회원 목록</caption>
					<colgroup>
						<col style="width:60px">
						<col style="width:80px">
						<col style="width:12%">
						<col style="width:12%">
						<col style="width:110px">
						<col style="width:160px">
						<col style="width:auto">
						<col style="width:70px">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>비밀번호</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>메일</th>
							<th>직업</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="8">검색 버튼을 클릭하세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="grid-wrap-footer">
				<div class="btn-box-right">
					<button type="button" class="btn btn-dark" onclick="goMemberNew()">신규등록</button>
				</div>
			</div>
		</article>
		<form id="tmpFm">
			<input type="hidden" name="action" value="R">
			<input type="hidden" name="memId" id="selectedMemId">
			<input type="hidden" name="targetUrl" id="targetUrl">
		</form>
	</main>
	<!-- 본문영역 끝 -->
</body>
</html>