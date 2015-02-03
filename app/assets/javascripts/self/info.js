function screen_height_resize(){
	screen_height = $(window).height()-60;
	info_editSelfInfo = screen_height-40-28;
	$('.main-announce-left,.main-announce-right,.main-self-info,.main-self-frame,.main-info-frame').height(screen_height+"px");
	$('.info-editSelfInfo').height(info_editSelfInfo+"px");
}

$(document).on("page:change", function(){
	$(".content").mCustomScrollbar();
	$(window).resize(function() {
		self_annocument_resize();
		screen_height_resize();
	});
	$(".self-selectBar").hover(function(){
		$(".self-selectIcon").fadeOut();
		$(".self-selectBar").animate({
	        left:"0px",
	    });
	}, function() {
		$(".self-selectIcon").fadeIn();
		$(".self-selectBar").animate({
	        left:"-200px",
	    });
	});
});
