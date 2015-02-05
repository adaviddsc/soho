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
    $(".eventInfo-open").on("click", function(event) {
		parent_element = $(this).parents('.self-announce-event');
		if( $(this).hasClass('open') ){
			$(this).removeClass('glyphicon-arrow-down').addClass('glyphicon-arrow-up');
			parent_element.find('.event-content').css("padding","10px 0px 10px 15px");
			parent_element.find('.event-content').animate({height:"250px"});
			parent_element.find('.event-bottom-info').hide();
			parent_element.find('.event-bottom-info').animate({height:"0px"});
		}
		else{
			$(this).removeClass('glyphicon-arrow-up').addClass('glyphicon-arrow-down');
			parent_element.find('.event-content').css("padding","0px");
			parent_element.find('.event-content').animate({height:"0px"});
			parent_element.find('.event-bottom-info').show();
			parent_element.find('.event-bottom-info').animate({height:"250px"});
		}
		$(this).toggleClass('open');
	});
});
