

function screen_height_resize(){
	screen_height = $(window).height()-60;
	info_editAllInfo = screen_height-40-28;
	$('.main-announce-left,.main-announce-right,.main-self-info,.main-self-frame,.main-info-frame').height(screen_height+"px");
	$('.info-editAllInfo').height(info_editAllInfo+"px");
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

	$(".addAvatar-btn").on("click", function(event) {
		$(".edit-avatarInput").click();

	});
	$(".edit-avatarInput").on("change", function(event) {
		readURL(this, $(".edit-avatarImg") );
	});

	$(".bgimg-btn").on("click", function(event) {
		$(".bgimg-input").click();
	});
	$(".bgimg-input").on("change", function(event) {
		$(".bgimg-form").submit();
	});

	
});
