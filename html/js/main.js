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
setTimeout(function(){
    bgImg.animate({
        left:bgImgLeftAnimate
    },1500);
},2000);

$('.home, .gallery, .registerForm').css({
    minHeight:windowHeight
})