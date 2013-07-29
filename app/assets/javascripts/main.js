$(document).ready(function(){
var windowHeight = $(window).height();
var windowWidth= $(window).width();

// Background image animation
var bgImg = $('.mainBg');
var bgImgHeight = windowHeight;
var bgImgWidth = (bgImgHeight/800)*780;
var bgImgLeft = (windowWidth-bgImgWidth)/2;
var bgImgLeftAnimate = bgImgLeft-(bgImgWidth/2.5);

bgImg.css({
    height: bgImgHeight,
    left:bgImgLeft
});
bgImg.load(function(){
    $('.loader').fadeOut(500);
    setTimeout(function(){
        bgImg.animate({
            left:bgImgLeftAnimate
        },1500,function(){
//            $('.homeInner').fadeIn(1000);
            $('.homeInner, .galleryInner, .registerForm').animate({
                opacity:1
            },1000);
        });
    },2000);
});
$('.rBtn').click(function(){
    $.scrollTo($('#registerForm'),{top:'10px', left:'290px', duration: 800});
})
$('.home, .gallery, .registerForm').css({
    minHeight:windowHeight
});
$('.homeInner, .galleryInner, .registerForm').css({
//    display: 'none'
    opacity:0
})
$(window).scroll(function(){
    var scrollTop = $(window).scrollTop();
    var homeHeight = $('.home').height();
    var galleryHeight = $('.gallery').height();
    var formShow = homeHeight + galleryHeight
    //console.log(scrollTop);
    if(scrollTop >= 100){
        $('.galleryInner').stop().animate({
            opacity:1
        },1000);
        $('.homeInner').stop().animate({
            opacity:0
        },1000);
    }else{
        //console.log('else');
        $('.galleryInner').stop().animate({
            opacity:0
        },1000);
        $('.homeInner').stop().animate({
            opacity:1
        },1000);
    }
});
});
