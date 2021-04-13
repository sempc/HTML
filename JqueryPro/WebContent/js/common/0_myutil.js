/**
 * 
 */
// strUrl = "http://localhost:9090/JqueryPro/html/jquery9/jquery9_submit_result.html?userName=아이유&userAge=25"
// strKey = "userId"
function getValue(strUrl, strKey) {
	var val = "";
	// strUrl 에서 strKey에 해당하는 값을 추출해서
	val = "~";
	return val;
}

function isEmpty(val){
	//val이 빈 값이거나 null이거나 undefined이거나 " ", "     "
	return true;
	
//	return false;
}

function format(val, type){
	//010-1234-1234, 01012341234,010-12341234, 010 123 1234
	
	
	if(type == "hpno") {
		val = val.replaceAll("-", "").replaceAll(" ", "");
		val = val.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1-$2-$3");
		return val;
	}
	
//		// 2020-04-08
//		val.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1-$2-$3");
//		// 2020/04/08
//		val.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1/$2/$3");
//		// 2020년04월08일
//		val.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1년$2월$3일");
	
}

function chkRegExp(val, type){
	
}
