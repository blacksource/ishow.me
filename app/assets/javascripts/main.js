$(function () {
    $("body").append("<p id='go_top'><a href='#top'><span></span></a></p>");
    $("#go_top").hide();
    $(window).scroll(function(){
        if ($(window).scrollTop()>10){
            $("#go_top").fadeIn(500);
        }
        else{
            $("#go_top").fadeOut(500);
        }
    });
    $("#go_top").click(function(){
        $('body,html').animate({scrollTop:0},1000);
        return false;
    });
});
