/**
 * 
 */

function goList(){
	$("#targetUrl").val("/html/member/memberList.jsp");
	var fm = document.getElementById("fm");
	fm.action = "/PageServlet";
	fm.method = "post";
	fm.submit();
}
function goEdit(){
	$("#action").val('R');
	$("#viewType").val('EDIT');
	
	var fm = document.getElementById("fm");
	fm.action = "/MemberServlet";
	fm.method = "post";
	fm.submit();
}
