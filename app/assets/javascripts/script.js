function checkHeightWidth(){
    var heightWidth = [];
    heightWidth.push($(window).height());
    heightWidth.push($(window).width());
    return heightWidth;
}
function landinPageHeight(){
    var heightWidth = checkHeightWidth();
    var bottomSpace = 280;
    var landingHeight = heightWidth[0]-bottomSpace;
    if(landingHeight<250){
        $('.eventWrapper').css({
            minHeight: '250px'
        });
    }else{
        $('.eventWrapper').css({
            minHeight: landingHeight 
        })
    }
    var formPosition = Math.floor((((heightWidth[1]/100)*70)-380)/2);
    var galleryPosition = Math.floor((((heightWidth[1]/100)*70)-540)/2);
    console.log((((heightWidth[1]/100)*70)-540)/2);
    $('.registerInner').css({marginLeft:formPosition});
    $('.galleryInner').css({marginLeft:galleryPosition});
}

function setFullWidthHeight(){
    var heightWidth = checkHeightWidth();
    $(".geekImage").css({'min-height': heightWidth[0]});
    $(".registerWrapper .scrollWrapper, .galleryWrapper .scrollWrapper").css({'height': heightWidth[0]});
}

function openLandingPage() {
    $('.enter').click(function(){
        $('.johnyCoder').animate({
        /*    opacity:0,
            'z-index':0,
        },500);*/
            top:'-50%'
        },500,'easeInBack',function(){
            $('.landingPage').animate({
                opacity:1,
                'z-index':1,
            },1000);
        });
        return false;
    })
}
function openRegister(){
    $('.register').click(function(){
        var infoPosition = $('.info').offset();
        $('.info').animate({
            opacity:'0',
            marginTop: -(infoPosition.top+191)
        },500,'easeInBack',function(){
            $('.geekLogo.absolute').animate({
                left:'80%',
                marginLeft: '-90px'
            },500,'easeInBack');
            $('.johnnieCoder').animate({
                left:'80%'
            },500,'easeInBack');
            $('.registerWrapper').animate({
                left:'0%'
            },500,'easeInBack');

        })
    })
}

function closeRegister(){
    $('.registerWrapper a.cross').click(function(){

        $('.geekLogo.absolute').animate({
            left:'50%',
            marginLeft: '-250px'
        },500,'easeOutBack');
        $('.johnnieCoder').animate({
            left:'50%'
        },500,'easeOutBack');
        $('.registerWrapper').animate({
            left:'-70%'
        },500,'easeOutBack',function(){
            $('.info').animate({
            opacity:'1',
            marginTop:'0px'
            },500,'easeOutBack')
        });
    })
}

function openGallery(){
    $('.gallery').click(function(){
        
        var infoPosition = $('.info').offset();
        $('.info').animate({
            opacity:'0',
            marginTop: -(infoPosition.top+191)
        },500,'easeInBack',function(){
            $('.geekLogo.absolute').animate({
                left:'10%',
                marginLeft: '10px'
            },500,'easeInOutQuad');
            $('.johnnieCoder').animate({
                left:'10%'
            },500,'easeInOutQuad');
            $('.galleryWrapper').animate({
                right:'0%'
            },500,'easeInOutQuad');

        })
    })
}

function closeGallery(){
    $('.galleryWrapper a.cross').click(function(){

        $('.geekLogo.absolute').animate({
            left:'50%',
            marginLeft: '-250px'
        },500,'easeInOutQuad');
        $('.johnnieCoder').animate({
            left:'50%'
        },500,'easeInOutQuad');
        $('.galleryWrapper').animate({
            right:'-70%'
        },500,'easeInOutQuad',function(){
            $('.info').animate({
            opacity:'1',
            marginTop:'0px'
            },500,'easeOutBack')
        });
    })
}

$(document).ready(function(){
    setFullWidthHeight();
    landinPageHeight();
    openRegister();
    closeRegister();
    openGallery();
    closeGallery();
    openLandingPage();
    var slideshows = $('.cycle-slideshow').on('cycle-next cycle-prev', function(e, opts) {
        // advance the other slideshow
        slideshows.not(this).cycle('goto', opts.currSlide);
    });
    $(".scrollWrapper").mCustomScrollbar();

    $('#cycle-2 .cycle-slide').click(function(){
        var index = $('#cycle-2').data('cycle.API').getSlideIndex(this);
        slideshows.cycle('goto', index);
    });
    $(window).resize(function(){
       setFullWidthHeight();
       landinPageHeight();
    });
});

