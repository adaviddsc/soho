function self_annocument_resize(){
  	outerFrame_width = $(".main-announce-right").width();
	inerFrame_width = $(".self-announce-event").width()+20;
	result_width = Math.floor(outerFrame_width/inerFrame_width)*inerFrame_width;
	if (result_width == 0) {
		$(".announce-middle").width(inerFrame_width+"px");
	}
	else{
		$(".announce-middle").width(result_width+"px");
	}
}
$(document).on("page:change", function(){
    //$(".content").mCustomScrollbar();
});
