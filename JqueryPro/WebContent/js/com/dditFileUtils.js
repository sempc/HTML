/**
 * 
 */
/** 이미지 파일 미리보기 */
$.fn.setPreview = function(opt){
	"use strict"
	var defaultOpt = { inputFile: $(this), img: null, w: 200, h: 200 };
	$.extend(defaultOpt, opt);
	
	var previewImage = function(){
		if (!defaultOpt.inputFile || !defaultOpt.img) return;
		
		var inputFile = defaultOpt.inputFile.get(0);
		var img = defaultOpt.img.get(0);
		
		// FileReader
		if (window.FileReader) {
			// image 파일만 
			if (!inputFile.files[0].type.match(/image\//)) return;
			// preview
			try {
				var reader = new FileReader();
				reader.onload = function(e){
					img.src = e.target.result;
					img.style.width = defaultOpt.w+'px';
					img.style.height = defaultOpt.h+'px';
					img.style.display = '';
				}
				reader.readAsDataURL(inputFile.files[0]);
			} catch (e) {
				// exception...
			}
		} else if (img.filters) { // img.filters(MSIE)
			inputFile.select();
			inputFile.blur();
			
			var imgSrc = document.selection.createRange().text;
			img.style.width = defaultOpt.w+'px';
			img.style.height = defaultOpt.h+'px';
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
			img.style.display = '';
		} else { // no support
			// Safari5, ...
		}
	};
	// onchange
	$(this).change(function(){
		previewImage();
	});

};