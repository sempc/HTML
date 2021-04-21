/**
 * 
 */
$(document).ready(function(){
	$("#btnSearch").click(function(){
		
		//서버로 전달할 데이터 만들기
		var userId = $("#userId").val();
		var userName = $("#userName").val();
		
		var param = {
				memId : userId
				, memName : userName
				, flag : "L"
				};
		// ==> { memId : "test", memName : ""}
		
		$.ajax({
			url : "/JqueryPro/MemberServlet"
			,type : "post"
			,data : param
			,dataType : "json"
			,success : function(data){
				console.log(data);
				// data를 이용해서 테이블을 만들기
				makeTable(data);
				
			}
			,error : function(xhr){
				console.log(xhr);
				alert("오류발생");
			}
		});
		
	});
	
});

function makeTable(data){
	var str = "";
	
	for(var i=0 ; i<data.length ; i++) {
		str += "<tr>"
			+ "<td>" + (i + 1) + "</td>"
			+ "<td>" + data[i].memId + "</td>"
			+ "<td>" + data[i].memName + "</td>"
			+ "<td>" + data[i].memPass + "</td>"
			+ "<td>" + data[i].memBir + "</td>"
//			+ "<td>" + data[i].memHp + "</td>" //01012341234
			+ "<td>" + formatHp(data[i].memHp) + "</td>" //01012341234
			+ "<td>" + data[i].memMail + "</td>"
			+ "<td>" + data[i].memJobName + "</td>"
			+ "</tr>";
	}
	console.log(str);
	$("#tbResult tbody").html(str);

}







function goMemberNew() {
	// 페이지이동1
// 	location.href = "/JqueryPro/html/member/memberNew.jsp";
	
 	// 페이지이동2
//	var fm = document.getElementById("tmpFm");
//	fm.method = "post";
//	fm.action = "/JqueryPro/html/member/memberNew.jsp";
//	fm.submit();
 	
	// 페이지이동3
//	$("#targetUrl").val("/html/member/memberNew.jsp");
//	var fm = document.getElementById("tmpFm");
//	fm.method = "post";
//	fm.action = "/JqueryPro/PageServlet";
//	fm.submit();
	
	// 팝업
	window.open("/JqueryPro/html/member/memberNew.jsp");
}