var showImgFun
var removeImgFun
function showImg(value){
  $('.main-home').css('transition','1s linear');
  $('.main-home').css('opacity','1');
  $('.main-home').addClass('main-home-img'+value);
  if(value==4){
    removeImgFun = setTimeout("removeImg(1)", 8000);
  }
  else{
    removeImgFun = setTimeout("removeImg("+(value+1)+")", 8000);
  }
}
function removeImg(value){
  $('.main-home').css('transition','none');
  $('.main-home').css('opacity','0');
  $('.main-home').removeClass('main-home-img1');
  $('.main-home').removeClass('main-home-img2');
  $('.main-home').removeClass('main-home-img3');
  $('.main-home').removeClass('main-home-img4');
  showImgFun = setTimeout("showImg("+value+")", 100);
}


$(document).on("page:change", function(){
  /*******警告視窗********/
  $("#alert-notice,#alert-background").show();
  $("#alert-close").on("click", function(event) {
    $("#alert-notice,#alert-background").fadeOut();
  });
  /*******警告視窗********/




  
});
