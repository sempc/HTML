/**
 * 회원정보목록 JS
 */

$(document).ready(function(){
	
	$("#btnSearch").click(function(){
//		event.preventDefault(); // <== submit 유형이라서 기본 동작을 막고 싶을때 필요할껄?
		
		var pmemId = $("#memId").val();
		var pmemName = $("#memName").val();
		var param = {memId: pmemId, memName: pmemName};
//		var param = {memId: $("#memId").val(), memName: $("#memName").val()};
		
		$.ajax({
			url : "/JqueryPro/MemberServlet"
			,type : "post"
//			,data : param
			,data : $("#fm").serialize()
			,dataType : "json"
			,success : function(data) {
				alert('성공');
				makeTable(data);
			}
			,error : function(xhr) {
				alert("오류발생\n" + xhr.status);
				console.log(xhr);
			}
		});
	})
	
	$("#tbResult").on("click", "a", function() {
		goMemberView($(this).text());
	});
})

function makeTable(data){
	var resList = data;
	alert(resList);
	
	$("#tbResult tbody").remove();
	
	var html = "<tbody>";
	if(resList == null || resList.length == 0) {
			html = html
					+ '<tr>'
					+ '	<td colspan="8">검색 결과가 존재하지 않습니다.</td> '
					+ '</tr>'
					+ '</tbody>';
	} else {
		
		
		for(i in resList) {
			var num = parseInt(i) + 1;
			html = html
					+ '	<tr>		   '
					+ '		<td>' + num + '</td> '
					+ '		<td><a href="#">' + resList[i].memId + '</a></td> '
					+ '		<td>' + resList[i].memName + '</td> '
					+ '		<td>' + resList[i].memPass + '</td> '
					+ '		<td>' + resList[i].memBir + '</td> '
//					+ '		<td>' + formatDate("yyyy-mm-dd", resList[i].birthday) + '</td> '
					+ '		<td>' + resList[i].memHp + '</td> '
//					+ '		<td>' + format("hpno", resList[i].memHp) + '</td> '
					+ '		<td>' + resList[i].memMail + '</td> '
					+ '		<td>' + resList[i].memJob + '</td> '
					+ '	</tr>		  ';
		}
		html = html + '</tbody>';
	}
	
	$("#tbResult").append(html);
	
}

function goMemberNew() {
// 	window.location.href = "/html/member/memberNew.jsp";
	
	$("#targetUrl").val("/html/member/memberNew.jsp");
	var fm = document.getElementById("tmpFm");
	fm.method = "post";
	fm.action = "/JqueryPro/PageServlet";
	fm.submit();
}
