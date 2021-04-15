/**
 * 
 */

$(document).ready(function(){
	// 화면 초기화 작업들 진행
	
	// 1. '직업코드' 세팅
	initJobSelect();
	// 2. '기념일코드' 세팅
	initMemorialSelect();
	// 3. '광고메일 수신 여부' 기본값 세팅- 미수신
//	$("[name=recvEmailYn]")
	$("#recvEmailYnN").prop("checked", true);
	// 4. '취미코드' 세팅 (체크박스)
	initHobbyCheck();
	
	// 5. '우편번호찾기 화면-시' 세팅
	initCitySelect();
	
});

function initJobSelect(){
	// 직업코드 조회해서 세팅하기
	$.ajax({
		url : "/JqueryPro/CodeServlet"
		,type : "post"
		,data : {"groupCode" : 'A02'} // 직업코드 조회
		,dataType : "json"
		,success : function(data){
			console.log(data);
			makeJobSelect(data);
		}
		,error : function(xhr){
			console.log(xhr);
			alert("오류");
		}
	});
}

function initMemorialSelect(){
	$.ajax({
		url : "/JqueryPro/CodeServlet"
		,type : "post"
		,data : {"groupCode" : 'A03'} // 직업코드 조회
		,dataType : "json"
		,success : function(data){
			console.log(data);
			makeMemorialSelect(data);
		}
		,error : function(xhr){
			console.log(xhr);
			alert("오류");
		}
	});
}
function initHobbyCheck(){
	
}
function initCitySelect(){
	$.ajax({
		url : "/JqueryPro/ZipServlet"
		,type : "post"
//		,data : {"groupCode" : 'A02'} // 직업코드 조회
		,dataType : "json"
		,success : function(data){
			console.log(data);
			makeCitySelect(data);
		}
		,error : function(xhr){
			console.log(xhr);
			alert("오류");
		}
	});
}


function makeJobSelect(data){
	var strHtml = "";
	for(var i=0 ; i<data.length ; i++){
		strHtml += '<option value="' + data[i].value +'">' + data[i].name + '</option>';
	}
	$("#memJob").html(strHtml);
	
}

function makeMemorialSelect(data){
	var strHtml = '<option value="">선택하세요</option>';
	for(var i=0 ; i<data.length ; i++){
		strHtml += '<option value="' + data[i].value +'">' + data[i].name + '</option>';
	}
	$("#memMemorial").html(strHtml);
	
}

function makeCitySelect(data){
	var strHtml = "";
	for(var i=0 ; i<data.length ; i++){
		strHtml += '<option value="' + data[i].sido +'">' + data[i].sido + '</option>';
	}
	$("#city").html(strHtml);
}

function setGu(){
	var param = {
			'sido' : $("#city").val()
			,'flag' : 'GU'
			};
	
	$.ajax({
		url : "/JqueryPro/ZipServlet"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			console.log(data);
			makeCitySelect(data);
		}
		,error : function(xhr){
			console.log(xhr);
			alert("오류");
		}
	});
	
}


// [중복검사] 버튼에 클릭 이벤트
function chkId1(){
	var memId = $("#memId").val();
	
	// 빈 값 확인     
	if(isEmpty(memId)) {
		alert("ID 값이 입력되지 않았습니다.");
		$("#memId").focus();
		$("#spMemId").show();
		return;
	}
	
	// 유효성 검사 - 영어소문자와 숫자로 구성. 3글자 이상 10글자 이하 
	var regExp = /^[a-z0-9]{3,10}$/;
	if(!regExp.test(memId)) {
		alert("ID 값이 유효하지 않습니다.");
		$("#memId").focus();
		$("#spMemId").show();
		return;
	}
	
	// DB에서 중복검사 수행
	$.ajax({
		url : "/JqueryPro/MemberServlet"
		,type : "post"
		,data : {"memId" : memId, "flag" : "CHKID"}
		,dataType : "json"
		,success : function(data){
			console.log(data);
		}
		,error : function(xhr){
			console.log(xhr);
			alert("ID 중복 검사 중 오류가 발생했습니다.");
		}
			
	});
	
}

//function openZip() {
//	initSidoSelect();
//	$("#divZipResult").hide();
//	$("#tbZipResult tbody").empty();
//	$("#zipModal").modal();
//}
