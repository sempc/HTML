/**
 * 
 */
//window.addEventListener("load", function() {
//	alert("하이.");
//});
//window.addEventListener("unload", function() {
//	alert("안녕히 가세요.");
//});

window.onload = function() {
	console.log("안녕11");
	if(window.sessionStorage) {
		console.log("id 1:"+sessionStorage.getItem("id"));
		sessionStorage.setItem("id", "a001");
		console.log("id 2:"+sessionStorage.getItem("id"));
	}else{
		console.log("세션이용 불가 브라우저");
	}
};
window.onunload = function() {
	alert("안녕히 가세요.");
//	if(window.sessionStorage) {
//		sessionStorage.clear();
//	}
};