/**
 * 
 */
const ROOT = "/MemberPro";
function movePage1(url){
	// 페이지이동1
// 	location.href = ROOT + "/PageServlet?targetUrl=" + url;
// 	location.href = "/member/memberNew.do";
// 	location.href = "~.do";

 	var fm = document.getElementById("fmPg");
	fm.method = "post";
	fm.action = ROOT + "/PageServlet?targetUrl=" + url;
	fm.submit();

}
function movePage2(url){
	console.log(">>>>>>>>>>movePage2");
	console.log(url);
	
	
 	// form submit을 수행하기 위해 form이 없는 경우 form을 생성해서 body에 추가함
	var fm = document.getElementById("fmPg");
	if(isEmpty(fm)) {
		fm = document.createElement("form");
		fm.id = "fmPg";
		document.body.append(fm);
	}
	
	// url이 없는 경우 form에 hidden으로 'targetUrl'이 있다고 가정
	if(isEmpty(url)){
		var obj = $("[name=targetUrl]", fm);
		if(isEmpty(obj)){
			alert('이동할 페이지 정보가 없습니다.');
			return;
		}
		
	} else {
		var obj = $("[name=targetUrl]", fm);
		if(isEmpty(obj)){
			alert('이동할 페이지 정보가 없습니다.');
			return;
		} else {
			obj.val(url);
		}
	}
	
	fm.method = "post";
	fm.action = ROOT + "/PageServlet";
	fm.submit();
 	
}

function getValue(url, key){
	// url = "http://localhost:9090/JqueryPro/html/jquery9/jquery9_submit_result.html?userName=아이유&userAge=25"
	var idx = url.indexOf("?");
	if(idx > -1) {
		url = url.substr(idx + 1);
		// url = "userName=아이유&userAge=25"
		
		var arr = url.split("&");
		// ["userName=아이유", "userAge=25"]
		
		for(var i = 0 ; i<arr.length ; i++) {
			//arr[i];// "userName=아이유" 또는 "userName="
			var tmp = arr[i].split("=");
			// ["userName", "아이유"]
			if(tmp[0] == key) {
				if(tmp.length > 1) {
					return tmp[1];
				} else {
					return "";
				}
			}
		}
	}
	
}

function isEmpty(val) {
	if(val == undefined) return true;
	if(val == null) return true;
	if(val == "null") return true;
	
	val = jQuery.trim(val);
	if(val.length == 0) return true;
	
	return false;
}

function changeEmptyVal(val) {
	if(isEmpty(val)) return "";
	else return val;
}

/** 핸드폰 번호 포맷 */
function formatHp(val){
	//val : 01012341234, 010-1234-1234, 010-12341234, 0101234-1234
	//      010 1234 1234, 010 12341234, 0101234 1234
	val = val.replaceAll("-", "").replaceAll(" ", "");
	
	// 010-123-1234, 010-1234-1234
	val = val.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1-$2-$3");
	return val;
}
