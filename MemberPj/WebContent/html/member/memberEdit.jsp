<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/com/dditUtils.js?v=1"></script>
	<script type="text/javascript" src="../../js/com/dditFileUtils.js?v=1"></script>
	<script type="text/javascript" src="../../js/member/memberEdit.js?v=1"></script>
<!--     <script type="text/javascript" src="../../js/lib/moment.min.js"></script> -->
<!--     <script type="text/javascript" src="../../js/lib/daterangepicker.js"></script> -->
<!--     <script type="text/javascript" src="../../js/comm/ui.js"></script> -->
	
	<style type="text/css">
	body {background: #eaf0f7;}
	.container .form-horizontal .form-group:first-child {border-top: 1px solid;}
	.container .form-horizontal .form-group {
		border-bottom: 1px solid;
		padding: 5px 0px;
		margin: 0 -15px;
		background-color: aliceblue;
	}
	.container .form-horizontal .form-group .control-label {background-color: #f1f5fa;}
	.form-button {padding: 10px 0px;}
	.form-inline .form-inline-zip1 {width: 90px;}
	.form-inline .form-inline-zip2 {width: calc(100% - 90px - 54px);}
	.form-group-inner-down{width: 100%; margin-top: 5px;}
	.form-group-inner-down .form-control{width: 100%}
	.form-control1{width: 50%;}
	.form-control {padding-left: 16px;}
	.form-control:required {background:#fff url(../../images/bg-required.png) no-repeat left 7px center}
	.form-control:disabled, .form-control[readonly] {background: #f2f5fa;}
	
	
	.form-control.singleDate {min-width:125px;padding-right:25px;background:#fff url(../../images/ico-date.png) no-repeat right 7px center}
	.form-control.singleDate:required{background:#fff url(../../images/bg-required.png) no-repeat left 7px center, url(../../images/ico-date.png) no-repeat right 5px center}
	
	
.input-group {	
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -webkit-box-align: stretch;
    -ms-flex-align: stretch;
    align-items: stretch;
    width: 100%;
}	
.dFile.input-group .control {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    margin-right: 0;
    border-right: 0;
    height: 40px;
    padding-right: 100px;
    text-align: left;
}
.dFile .file-size {
    right: 110px;
    top: 11px;
    width: 50px;
    font-size: 10px;
    font-family: tahoma;
    font-style: normal;
}
.dFile .file-delete, .dFile .file-size {
    display: none;
    position: absolute;
    text-align: right;
    color: #999;
}

.dFile.input-group .btn-outline {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
    margin-right: -3px;
    cursor: pointer;
}
.btn-outline {
    border: 1px solid #ced4da;
    background: #fff;
    margin-left: 0;
    margin-right: 0;
    color: #646c9a;
    box-shadow: 0 1px 1px 0 rgba(28,35,69,0.04);
}
.btn {
    border-radius: 3px;
    height: 40px;
    font-size: 15px;
    line-height: 1.5;
    padding: 5px 12px;
    margin-bottom: 0;
    display: inline-block;
    text-decoration: none;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
}
.dFile .btn span {
    line-height: 32px;
}

.dFile .input-file {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
}
a, input, select, button, textarea {
    font-family: inherit;
}
img, fieldset, button, input {
    border: 0;
    vertical-align: middle;
}

.dFile .file-delete {
    right: 90px;
    top: 12px;
    width: 16px;
    height: 16px;
    text-indent: -9999px;
    background: url(../../images/ico-remove.png) no-repeat center center;
    text-indent: -9999px;
    overflow: hidden;
    font-size: 0;
}
.dFile .file-delete, .dFile .file-size {
    display: none;
    position: absolute;
    text-align: right;
    color: #999;
}
a, input, select, button, textarea {
    font-family: inherit;
}
a {
    text-decoration: none;
    color: inherit;
}
	</style>
<!-- 	<link rel="stylesheet" type="text/css" href="../../css/listcss.css?v=1"> -->
	<%
	MemberVO memberVo = (MemberVO) request.getAttribute("memberVo");
	if(memberVo == null) {
		%>
		alert("회원 정보를 조회해 오는데 오류가 발생했습니다.");
		<%
		memberVo = new MemberVO();
	}
	%>
</head>
<body>
	<!-- 본문영역 시작 -->
	<div class="container">
		<h2>회원 정보 변경</h2>
		<form class="form-horizontal" id="fm" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="memId">ID</label>
				<div class="col-sm-4 form-inline">
					<input type="text" class="form-control" id="memId" name="memId" readonly="readonly" value="<%=memberVo.getMemId()%>">
				</div>
				<label class="control-label col-sm-2" for="fileMemImg">프로필사진</label>
				<div class="col-sm-4 form-inline">
					
					<div class="input-group dFile">
						<span class="control file-name"></span>
						<i class="file-size">30MB</i>
						<span class="btn btn-outline">
							<span>파일찾기</span>
							<input type="file" name="preAttchNm" id="preAttchNm" class="input-file">
						</span>
						<a href="#none" class="file-delete">삭제</a>
					</div>
                                
<!-- 					<input type="file" class="form-control" id="fileMemImg" name="memProfile" > -->
<!-- 					<img id="imgMemImg" style="display:none;"/> -->
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memName">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control form-control1" id="memName" value="<%=memberVo.getMemName()%>" name="memName" required>
					<span id="spMemName" style="display: none;">영어 대문자와 한글 사용 가능. 2~20자리</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memPass">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control form-control1" id="memPass" value="<%=memberVo.getMemPass()%>" name="memPass" required>
					<span id="spMemPass" style="display: none;">영어와 숫자를 포함한 8~15자리</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memPass">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control form-control1" id="memPass1" value="<%=memberVo.getMemPass()%>" name="memPass" required>
					<span id="spMemPass1" style="display: none;">비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="memMail">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control form-control1" id="memMail" name="memMail" value="<%=memberVo.getMemMail()%>" required>
					<span id="spMemMail" style="display: none;">이메일 형식이 바르지 않습니다.</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memId">주소</label>
				<div class="col-sm-10 form-inline">
					<input type="text" class="form-control form-inline-zip1" id="memZip" name="memZip" readonly="readonly" required value="<%=memberVo.getMemZip()%>">
					<button type="button" class="btn btn-info btn-sm" id="btnAddr" onclick="openZip()">검색</button>
					<input type="text" class="form-control form-inline-zip2" id="memAdd1" name="memAdd1" readonly="readonly" required value="<%=memberVo.getMemAdd1()%>">
					<br>
					<div class="form-group-inner-down">
					<input type="text" class="form-control" id="memAdd2" name="memAdd2" value="<%=memberVo.getMemAdd2()%>" required>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memBir">생년월일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control singleDate" id="memBir" name="memBir" value="<%=memberVo.getMemBir()%>" required>
				</div>
				<label class="control-label col-sm-2" for="memHp">핸드폰번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="memHp" name="memHp" value="<%=memberVo.getMemHp()%>" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memMemorial">기념일</label>
				<div class="col-sm-10 form-inline">
					종류 : <select class="form-control" id="memMemorial" name="memMemorial"></select>
					<input type="hidden" id="tempMememorial" value="<%=memberVo.getMemMemorial()%>">
					날짜 : <input type="text" class="form-control singleDate" id="memMemorialday" name="memMemorialday" value="<%=memberVo.getMemMemorialday()%>">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="recvEmail">광고메일</label>
				<div class="col-sm-4">
					<label class="radio-inline"><input type="radio" name="recvEmailYn" value="Y" checked>수신</label>
					<label class="radio-inline"><input type="radio" name="recvEmailYn" value="N" >미수신</label>
				</div>
				<label class="control-label col-sm-2" for="memJob">직업</label>
				<div class="col-sm-4">
					<select class="form-control" id="memJob" name="memJob">
					</select>
					<input type="hidden" id="tempMemJob" value="<%=memberVo.getMemJob()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="hobby">취미</label>
				<div class="col-sm-10" id="divHobby">
				</div>
			    <input type="hidden" name="memLike" id="memLike" value="<%=memberVo.getMemLike()%>">
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memComment">Comment</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" id="memComment" name="memComment" maxlength="1000" ><%=memberVo.getMemComment()%></textarea>
				</div>
			</div>
			<input type="hidden" name="action" id="actionFm">
		</form>
		<div class="form-button text-center">
			<button type="button" class="btn btn-primary" onclick="save()">저장</button>
			<button type="button" class="btn btn-default" onclick="goMemberView()">취소</button>
		</div>
	</div>
	<form id="tmpFm">
		<input type="hidden" id="selectedMemId" name="memId">
		<input type="hidden" id="actionTmpFm" name="action">
	</form>


	<!-- 우편번호 검색 Modal -->
	<div class="modal fade" id="zipModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">주소 검색</h5>
				</div>
				<div class="modal-body">
					시: <select id="city" onchange="setGu()">
						<option value="">선택하세요</option>
						<option value="대전">대전</option>
						<option value="세종">세종</option>
						<option value="충남">충남</option>
					</select>
					구: <select id="gu" onchange="setDong()" disabled="disabled">
						<option>선택하세요</option>
					</select>
					동: <select id="dong" disabled="disabled">
						<option>선택하세요</option>
					</select>
					<button type="button" onclick="searchZipCode()" id="btnZip">검색</button>
					<hr>
					<div id="divZipResult" style="display: none;">
						<table class="table table-striped" id="tbZipResult">
						  <thead>
						    <tr>
						      <th>우편번호</th>
						      <th>주소</th>
						    </tr>
						  </thead>
						  <tbody>
						  </tbody>
						</table>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btnCloseZipModal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 본문영역 끝 -->

</body>
</html>