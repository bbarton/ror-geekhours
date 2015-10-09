		$(document).ready(function() {

			/*
			* Plugin intialization
			*/
	    	$('#pagepiling').pagepiling({
	    		//menu: '#menu',
	    		anchors: ['page1', 'page2', 'page3', 'page4', 'page5'],
			    //sectionsColor: ['white', '#ee005a', '#2C3E50', '#39C'],
			    navigation: {
			    	//'position': 'right',
			   		'tooltips': ['Page 1', 'Page 2', 'Page 3', 'Page 4', 'Page 5']
			   	},
			    /*afterRender: function(){
			    	$('#pp-nav').addClass('custom');
			    },*/
			    afterLoad: function(anchorLink, index){
			    	if(index!=5){
			    		$('.downArrow').addClass('active');
			    		$('.downArrow').removeClass('hideArrow');
			    	}
			    },
			    onLeave: function(index, nextIndex, direction){
			    	if(nextIndex==5){
			    		$('.downArrow').removeClass('active');
			    		$('.downArrow').addClass('hideArrow');
			    	}
		        }
			});
			$('.downArrow').click(function(e){
				e.stopPropagation();
				e.preventDefault();
		    	$.fn.pagepiling.moveSectionDown();
			});
	    	var windowWidth = $(window).width();
	    	var windowHegiht = $(window).height();
	    	if(windowWidth<=windowHegiht){
	    		$('body').addClass('portrait');
	    		$('body').removeClass('landscape');
	    	}else{
	    		$('body').removeClass('portrait');
	    		$('body').addClass('landscape');
	    	}
	    	$(window).resize(function(event) {
		    	windowWidth = $(window).width();
		    	windowHegiht = $(window).height();
		    	if(windowWidth<=windowHegiht){
		    		$('body').addClass('portrait');
		    		$('body').removeClass('landscape');
		    	}else{
		    		$('body').removeClass('portrait');
		    		$('body').addClass('landscape');
		    	}
	    	});
	    	var wrapperWidht = windowWidth-385;
	    	var registerWrap = $('.registerWrap');
            var galleryWrap = $(".galleryWrap");
	    	registerWrap.css({
	    		width: wrapperWidht,
	    		right: -wrapperWidht,
	    		opacity:1
	    	});
            galleryWrap.css({
                width: wrapperWidht,
                right: -wrapperWidht,
	    		opacity:1
            });
            if(windowWidth <= 768){
		    	registerWrap.css({
		    		width: '100%',
		    		right: '-100%'
		    	});
	            galleryWrap.css({
		    		width: '100%',
		    		right: '-100%'
	            });
            }

			var gh = $( ".ghLogo" );
			var ghl;
			//var ght;
	    	$('.linkButton').click(function(e) {
				e.stopPropagation();
				e.preventDefault();
	    		var windowWidth = $(window).width();
	            var whichWrap = $(this).data("target");
	    		if(windowWidth >= 768){
					var offset = gh.offset();
					ghl = offset.left;
					//ght = offset.top;

					gh.css({
						position: 'relative'
					})
		    		/* Act on the event */
	                $(whichWrap).animate({
			    		right: 0
			    	},1000);
	                $(whichWrap).addClass("activeSide");
			    	gh.animate({
			    		left: -(ghl - 115)},
			    		1000);
			    	/*$('.codersLogo').animate({
			    		marginLeft: 76},
			    		1000
			    	);*/
			    	$('.outer').animate({
			    		width: 385},
			    		1000
			    	);
			    	$('.section5 .centerHeading').animate({
			    		fontSize: 28},
			    		1000
			    	);
			    	//$('.inner, .buttons').fadeOut(500);
		    	}else{
		    		$(whichWrap).animate({
			    		right: 0,
			    		top:0,
			    		width:'100%',
			    		height:'100%'
			    	},500);
		    	}
	    	});

          	$('a.close').click(function(e) {
                var whichWrap = $(this).parents(".activeSide");
				e.stopPropagation();
				e.preventDefault();
	    		/* Act on the event */
            	if(windowWidth >= 768){
			    	$(whichWrap).animate({
			    		right: -wrapperWidht
			    	},1000);
	                $(whichWrap).removeClass("activeSide");
			    	gh.animate({
			    		left: 0},
			    		1000);
			    	/*$('.codersLogo').animate({
			    		marginLeft: 'auto'},
			    		1000
			    	);*/
			    	$('.outer').animate({
			    		width: windowWidth},
			    		1000
			    	);
			    	$('.section5 .centerHeading').animate({
			    		fontSize: 48},
			    		1000
			    	);
			    	//$('.inner, .buttons').fadeIn(1500);
		    	}else{
			    	registerWrap.animate({
			    		width: '100%',
			    		right: '-100%'
			    	},500);
		            galleryWrap.animate({
			    		width: '100%',
			    		right: '-100%'
		            },500);
		    	}
	    	});

			/*
		    * Internal use of the demo website
		    */
		    /*
		    $('#showExamples').click(function(e){
				e.stopPropagation();
				e.preventDefault();
				$('#examplesList').toggle();
			});

			$('html').click(function(){
				$('#examplesList').hide();
			});*/


            var slideshows = $('.cycle-slideshow').on('cycle-next cycle-prev', function(e, opts) {
                // advance the other slideshow
                slideshows.not(this).cycle('goto', opts.currSlide);
            });

            $('#cycle-2 .cycle-slide').click(function(){
                var index = $('#cycle-2').data('cycle.API').getSlideIndex(this);
                slideshows.cycle('goto', index);
            });
        });
