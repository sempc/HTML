/**
 * 
 */

	function addImg(obj, fileName){
		var arrImgs = document.getElementsByTagName("img");
		// arrImgs : [<img>, ..]
		for(var i = 0 ; i < arrImgs.length ; i++) {
			arrImgs[i].remove();// <li>
		}
		
// 		alert(obj);//<li id="tmp1" onclick="addImg(this)">컴퓨터</li>
// 		alert(obj.innerHTML);
// 		alert(obj.id);
		
		var objImg = document.createElement("img");
		objImg.src = "../../images/" + fileName;
		objImg.height = "30";
		
		obj.appendChild(objImg);
	}