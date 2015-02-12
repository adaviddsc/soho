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

function manage_order(){
	order = 0;
	$('.nested_fields').each(function() {
		if ( $(this).css('display')!="none" ){
			$(this).find('.nested-ability-order').attr("value",order);
			order++;
		}
    });
}
function remove_noImgUpload(){
	$('.nested_fields').each(function() {
		if( $(this).find('.announceImg-container').attr('src')==undefined ){
			$(this).find('.nested-ability-remove').click();
		}
    });
}
function show_ability_img(){
	var ability_id;
	$('.self-announce-event').each(function() {
		if( $(this).hasClass('active') ){
			ability_id = $(this).find('.ability-event-hidden').attr('value');
			return false;
		}
	});
	return ability_id;
}
function ability_event_bind(){
	//$(".event-content").unbind('mouseenter mouseleave')
	$(".event-content").hover(
	  	function() {
	    	$(this).parents('.self-announce-event').css('box-shadow','0px 2px 8px #688184');
	  	}, function() {
	    	$(this).parents('.self-announce-event').css('box-shadow','0 1px 2px #BABABA');
	  	}
	);

	$(".filter-focus select").change(function () {
		if( $(".filter-focus select :selected").val()=="focused" ){
			$(".self-announce-event").hide();
			$(".focused").fadeIn();
		}
		else if( $(".filter-focus select :selected").val()=="none" ){
			$(".self-announce-event").fadeIn();
		}
		else if( $(".filter-focus select :selected").val()=="browsed" ){
			$(".self-announce-event").hide();
			$(".browsed").fadeIn();
		}
		else if( $(".filter-focus select :selected").val()=="nobrowse" ){
			$(".self-announce-event").fadeIn();
			$(".browsed").hide();
		}
	});

	$(".event-focus").on("click", function(event) {
		event_focus = $(this);
		event_onfocus = $(this).siblings('.event-onfocus');
		if( $(this).attr('ability-id')!=undefined ){
			$.ajax({
			    url: "/self/ability/focus",
			    data: "ability_id="+$(this).attr('ability-id'),
			    type: "post",
			    success: function(response) {
			    	event_focus.parents('.self-announce-event').addClass('focused');
			    	event_focus.hide();
			    	event_onfocus.show();
			    },
			    error: function( req, status, err ) {
			    }
			});
		}
		else if( $(this).attr('job-id')!=undefined ){
			$.ajax({
			    url: "/self/job/focus",
			    data: "job_id="+$(this).attr('job-id'),
			    type: "post",
			    success: function(response) {
			    	event_focus.parents('.self-announce-event').addClass('focused');
			    	event_focus.hide();
			    	event_onfocus.show();
			    },
			    error: function( req, status, err ) {
			    }
			});

		}
	});

	$(".event-onfocus").on("click", function(event) {
		event_focus = $(this).siblings('.event-focus');
		event_onfocus = $(this);
		if( $(this).attr('ability-id')!=undefined ){
			$.ajax({
			    url: "/self/ability/focus",
			    data: "ability_id="+$(this).attr('ability-id'),
			    type: "post",
			    success: function(response) {
			    	event_focus.parents('.self-announce-event').removeClass('focused');
			    	event_onfocus.hide();
			    	event_focus.show();
			    },
			    error: function( req, status, err ) {
			    }
			});
		}
		else if( $(this).attr('job-id')!=undefined ){
			$.ajax({
			    url: "/self/job/focus",
			    data: "job_id="+$(this).attr('job-id'),
			    type: "post",
			    success: function(response) {
			    	event_focus.parents('.self-announce-event').removeClass('focused');
			    	event_onfocus.hide();
			    	event_focus.show();
			    },
			    error: function( req, status, err ) {
			    }
			});

		}
	});

	$(".event-content").on("click", function(event) {
		if( $(this).attr('ability-id')!=undefined ){
			$.ajax({
			    url: "/self/ability/browse",
			    data: "ability_id="+$(this).attr('ability-id'),
			    type: "post",
			    success: function(response) {
			    	//alert(response);
			    },
			    error: function( req, status, err ) {
			    	//console.log( 'something went wrong:', status, err );
	      			//alert('something went wrong:'+ status + err);
			    }
			});
		}
		else if( $(this).attr('job-id')!=undefined ){
			$.ajax({
			    url: "/self/job/browse",
			    data: "job_id="+$(this).attr('job-id'),
			    type: "post",
			    success: function(response) {
			    	//alert(response);
			    },
			    error: function( req, status, err ) {
			    	//console.log( 'something went wrong:', status, err );
	      			//alert('something went wrong:'+ status + err);
			    }
			});
		}

		$('.self-announce-event').removeClass('active');
		$(this).parents('.self-announce-event').addClass('active');
		$('.announceImg-hide').hide();
		$('.ability-event-'+show_ability_img()).fadeIn();
	});
}
function remove_eventImg_btn(){
	$(".nested_fields").hover(
	  	function() {
	    	$(this).find('.nested-ability-remove').animate({right:"0px"},200);
	  	}, function() {
	  		$(this).find('.nested-ability-remove').animate({right:"-57px"},200);
	  	}
	);
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

	$(".add-announceImg").on("click", function(event) {
		remove_noImgUpload();
		$('.add-ability-nested').click();
		remove_eventImg_btn();
		$('.nested-ability-image').unbind('change').on("change", function(event) {
			parents_element = $(this).parents('.nested_fields');
			parents_element.append('<div class="announceImg"><img src="" class="announceImg-container"></div>');
			parents_element.find('.announceImg-hide').remove();
			readURL(this, parents_element.find('.announceImg-container') );
			manage_order();
		});
		$('.nested_fields').each(function(index) {
			if ( $('.nested_fields').length==index+1 ){
				$(this).find('.nested-ability-image').click();
			}
	    });
	});

	$('.nested_ability_submit').on("click", function(event) {
		manage_order();
	});

	remove_eventImg_btn();
});
