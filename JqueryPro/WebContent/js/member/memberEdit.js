/**
 * 
 */
var tmpMemId;
$(function() {
	//기념일 셀렉트박스 세팅
	initMemorial();
	//직업 셀렉트박스 세팅
	initJobSelect();
	//취미 체크박스 세팅
	initHobbyCheck();
	//우편번호 관련 도시 등 셀렉트박스 세팅
	initSidoSelect();
	
	$("#tbZipResult").on("dblclick", "tbody tr", function(){
		var zipCode = $(this).children("td:eq(0)").text();
		var addr1 = $(this).children("td:eq(1)").text();
		
		$("#memZip").val(zipCode);
		$("#memAdd1").val(addr1);
		
		$("#zipModal").modal("hide");
		//$("#btnCloseZipModal").trigger("click");
	})
	
	tmpMemId = $("#memId").val();
	
	
	//프로파일 이미지 미리보기
	var opt = {	img: $('#imgMemImg'), w: 100, h: 100 };
	$('#fileMemImg').setPreview(opt);

})

function initMemorial() {
	$.ajax({
		url : "/CodeServlet"
		,type: "post"
		,data: {"groupCode" : "A03"}
		,dataType: "json"
		,success :function(data) {
			makeMemorialSelect(data);
		}
		,error : function(xhr) {
			console.log(xhr);
			console.log(xhr.responseText);
			alert("기념일 종류 조회 중 오류 발생");
		}
	})
}
function makeMemorialSelect(data) {
	var html = '<option value="">선택하세요</option>';
	for(var i=0 ; i<data.length ; i++) {
		html += '<option value="'
				+data[i].value+'">'
				+data[i].name+'</option>';
	}
	$("#memMemorial").html(html);
	$("#memMemorial").val($("#tempMemMemorial").val());
}

function initJobSelect() {
	$.ajax({
		url : "/CodeServlet"
		,type: "post"
		,data: {"groupCode" : "A02"}
		,dataType: "json"
		,success :function(data) {
			makeJobSelect(data);
		}
		,error : function(xhr) {
			console.log(xhr);
			alert("직업 조회 중 오류 발생");
		}
	})
}
function makeJobSelect(data) {
	var html = '<option value="">선택하세요</option>';
	for(var i=0 ; i<data.length ; i++) {
		html += '<option value="'
				+data[i].value+'">'
				+data[i].name+'</option>';
	}
	$("#memJob").html(html);
	$("#memJob").val($("#tempMemJob").val());
}

function initHobbyCheck() {
	$.ajax({
		url : "/CodeServlet"
		,type: "post"
		,data: {"groupCode" : "A01"}
		,dataType: "json"
		,success :function(data) {
			makeHobbyCheck(data);
		}
		,error : function(xhr) {
			console.log(xhr);
			alert("직업 조회 중 오류 발생");
		}
	})
}
function makeHobbyCheck(data) {
	var memLike = $("#memLike").val();
	var arr = memLike.split(",");
	
	var html = "";
	for(var i=0 ; i<data.length ; i++) {
		var strChecked = "";
		for(var j=0 ; j<arr.length ; j++) {
			if(data[i].name == arr[j]) {
				strChecked = "checked";
				break;
			}
		}
		html += '<label class="checkbox-inline">'
				+'<input type="checkbox" value="'+data[i].value+'" name="memLike1" '+strChecked+'>'+data[i].name
				+'</label>';
	}
	$("#divHobby").html(html);
}

function initSidoSelect() {
	$.ajax({
		url : "/ZipServlet"
		,type: "post"
		,data: {"zipType" : "SIDO"}
		,dataType: "json"
		,success :function(data) {
			var html = '<option value="">선택하세요</option>';
			for(var i=0 ; i<data.length ; i++) {
				html += '<option value="'
						+data[i].sido+'">'
						+data[i].sido+'</option>';
			}
			$("#city").html(html);
			setGu();
		}
		,error : function(xhr) {
			console.log(xhr);
		}
	})
}
function setGu() {
	$("#gu").empty();
	$("#gu").html('<option value="">----------</option>');
	
	$("#dong").empty();
	$("#dong").html('<option value="">----------</option>');
	$("#dong").prop("disabled", true);
	
	$("#btnZip").prop("disabled", true);
	
	if(isEmpty($("#city").val())) {
		$("#gu").prop("disabled", true);
		return;
	}
	
	var pdata = {"zipType" : "GUGUN", "sido" : $("#city").val()};
	$.ajax({
		url : "/ZipServlet"
		,type: "post"
		,data: pdata
		,dataType: "json"
		,success :function(data) {
			var html = '<option value="">선택하세요</option>';
			for(var i=0 ; i<data.length ; i++) {
				html += '<option value="'
						+data[i].gugun+'">'
						+data[i].gugun+'</option>';
			}
			$("#gu").html(html);
			$("#gu").prop("disabled", false);
			
		}
		,error : function(xhr) {
			console.log(xhr);
		}
	})
}

function setDong() {
	$("#dong").empty();
	$("#dong").html('<option value="">----------</option>');
	$("#dong").prop("disabled", true);
	$("#btnZip").prop("disabled", true);
	
	if(isEmpty($("#gu").val())) {
		$("#dong").prop("disabled", true);
		return;
	}
	
	var pdata = {"zipType" : "DONG"
		, "sido" : $("#city").val()
		, "gugun" : $("#gu").val()
		};
	$.ajax({
		url : "/ZipServlet"
		,type: "post"
		,data: pdata
		,dataType: "json"
		,success :function(data) {
			var html = '<option value="">선택하세요</option>';
			for(var i=0 ; i<data.length ; i++) {
				html += '<option value="'
						+data[i].dong+'">'
						+data[i].dong+'</option>';
			}
			$("#dong").html(html);
			$("#dong").prop("disabled", false);
			
			$("#btnZip").prop("disabled", false);
		}
		,error : function(xhr) {
			console.log(xhr);
		}
	})
}
function searchZipCode() {
	
	if( isEmpty($("#city").val()) 
			|| isEmpty($("#gu").val())
			|| isEmpty($("#dong").val()) ) {
		alert("시/도, 구/군, 동 값을 선택하세요.");
		return;
	}
	
	var pdata = {"sido" : $("#city").val()
		, "gugun" : $("#gu").val()
		, "dong" : $("#dong").val()
		};
	$.ajax({
		url : "/ZipServlet"
		,type: "post"
		,data: pdata
		,dataType: "json"
		,success :function(data) {
			console.log(data);
			makeZipcodeList(data);
		}
		,error : function(xhr) {
			console.log(xhr);
		}
	})
	
}

function makeZipcodeList(data) {
	$("#divZipResult").show();
	
	$("#tbZipResult tbody").empty();
	var html = "";
	if(data != null) {
		for(var i=0 ; i<data.length ;i++) {
			html += "<tr>"
					+"<td>"+data[i].zipcode+"</td>"
					+"<td>"+data[i].sido+" "+data[i].gugun+" "+data[i].dong+" "+changeEmptyVal(data[i].bunji)+"</td>"
					+"</tr>";
		}
	}
	$("#tbZipResult tbody").html(html);
}

function openZip() {
	initSidoSelect();
	$("#divZipResult").hide();
	$("#tbZipResult tbody").empty();
	$("#zipModal").modal();
}

/**저장버튼 클릭 시 */
function save(){
	$("#actionFm").val("U");
	$("#selectedMemId").val(tmpMemId);
	
	$.ajax({
		url: "/MemberServlet"
		,type: "post"
		,data: $("#fm").serialize
		,dataType: "json" 
		,success: function(){
			alert("저장되었습니다.");
			goMemberView();
		}
		,error: function(xhr) {
			console.log(xhr);
			alert("저장에 실패하였습니다.");
		}
	});
	
}
function validateData() {
	//ID검사
	var memId = $("#memId").val();
	if(isEmpty(memId)) {
		alert("ID는 필수 입력 입니다.");
		$("#spMemId").show();
		$("#memId").focus();
		return false;
	}
	
	if( !chkRegExp(memId, "MEMBERID") ) {
		$("#spMemId").show();
		$("#memId").focus();
		return false;
	} else {
		$("#spMemId").hide();
	}
	
	var checkedMemId = $("#checkedMemId").val();
	if(isEmpty(checkedMemId)) {
		alert("ID 중복 체크 하세요.");
		$("#memId").focus();
		return false;
	}
	if(checkedMemId != memId) {
		alert("ID가 변경되었습니다. ID 중복 체크 하세요.");
		$("#memId").focus();
		return false;
	}
	
	//이름검사
	var memName = $("#memName").val();
	if(isEmpty(memName)) {
		alert("이름은 필수 입력 입니다.");
		$("#spMemName").show();
		$("#memName").focus();
		return false;
	}
	
	if( !chkRegExp(memName, "MEMBERNAME") ) {
		$("#spMemName").show();
		$("#memName").focus();
		return false;
	} else {
		$("#spMemName").hide();
	}
	
	//비밀번호검사
	var memPass = $("#memPass").val();
	if(isEmpty(memPass)) {
		alert("비밀번호는 필수 입력 입니다.");
		$("#spMemPass").show();
		$("#memPass").focus();
		return false;
	}
	
	if( !chkRegExp(memPass, "MEMBERPASSWORD") ) {
		$("#spMemPass").show();
		$("#memPass").focus();
		return false;
	} else {
		$("#spMemPass").hide();
	}
	
	//비밀번호확인 검사
	var memPass1 = $("#memPass1").val();
	if(isEmpty(memPass1)) {
		alert("비밀번호 확인은 필수 입력 입니다.");
		$("#memPass1").focus();
		return false;
	}
	
	if( memPass != memPass1 ) {
		$("#spMemPass1").show();
		$("#memPass1").focus();
		return false;
	} else {
		$("#spMemPass1").hide();
	}
	
	//이메일검사
	var memMail = $("#memMail").val();
	if(isEmpty(memMail)) {
		alert("이메일은 필수 입력 입니다.");
		$("#spMemMail").show();
		$("#memMail").focus();
		return false;
	}
	
	if( !chkRegExp(memMail, "EMAIL") ) {
		$("#spMemMail").show();
		$("#memMail").focus();
		return false;
	} else {
		$("#spMemPass").hide();
	}
	
	//우편번호검사
	var memZip = $("#memZip").val();
	if(isEmpty(memZip)) {
		alert("우편번호는 필수 입력 입니다.");
		$("#btnAddr").focus();
		return false;
	}
	if( !chkRegExp(memZip, "ZIPCODE") ) {
		alert("우편번호 형식이 바르지 않습니다.");
		$("#btnAddr").focus();
		return false;
	}
	
	//memAdd1
	if(isEmpty($("#memAdd1").val())) {
		alert("주소는 필수 입력 입니다.");
		$("#btnAddr").focus();
		return false;
	}
	//memAdd2
	if(isEmpty($("#memAdd2").val())) {
		alert("상세 주소는 필수 입력 입니다.");
		$("#memAdd2").focus();
		return false;
	}
	
	//생년월일검사
	var memBir = $("#memBir").val();
	if(isEmpty(memBir)) {
		alert("생년월일은 필수 입력 입니다.");
		$("#memBir").focus();
		return false;
	}
	if( !chkRegExp(memBir, "DATE") ) {
		alert("생년월일 형식이 바르지 않습니다.");
		$("#memBir").focus();
		return false;
	}
	var age = parseInt((new Date()).getFullYear())
			 - parseInt(memBir.substr(0,4)) + 1;
	if(age < 10) {
		alert("10살 미만은 가입하실 수 없습니다.");
		$("#memBir").focus();
		return false;
	}
	
	//핸드폰번호검사
	var memHp = $("#memHp").val();
	if(isEmpty(memHp)) {
		alert("핸드폰번호는 필수 입력 입니다.");
		$("#memHp").focus();
		return false;
	}
	if( !chkRegExp(memHp, "HP") ) {
		alert("핸드폰번호 형식이 바르지 않습니다.");
		$("#memHp").focus();
		return false;
	}
	
	//기념일검사
	var mememorial = $("#mememorial").val();
	var memMemorialday = $("#memMemorialday").val();
	if(!isEmpty(mememorial) || !isEmpty(memMemorialday)) {
		if(isEmpty(mememorial)) {
			alert("(기념일 날짜 입력 시)기념일 종류를 입력하세요");
			$("#mememorial").focus();
			return false;
		} else if(isEmpty(memMemorialday)) {
			alert("(기념일 종류 입력 시)기념일 날짜를 입력하세요");
			$("#memMemorialday").focus();
			return false;
		}
		
		if( !chkRegExp(memMemorialday, "DATE") ) {
			alert("기념일 날짜 형식이 바르지 않습니다.");
			$("#memMemorialday").focus();
			return false;
		}
	}
	
	//Comment검사
	var memComment = $("#memComment").val();
	if(memComment.length > 1000) {
		alert("Comment는 1000자 이하로 입력하세요.");
		$("#memComment").focus();
		return false;
	}
	
	return true;
}

/**취소버튼 클릭 시 - 상세화면으로 이동 */
function goMemberView(){
	$("#actionTmpFm").val("R");
	$("#selectedMemId").val(tmpMemId);
	
	var fm = document.getElementById("tmpFm");
	fm.action = "/MemberServlet";
	fm.method = "post";
	fm.submit();
}