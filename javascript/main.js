var navTop;
var returnPos;

$(document).ready(function() 
{  
	var navPassed = false;
	
	var navTop = $('#navbar').offset().top;
	var returnPos = $('#navbar').position().top;

    $('.email').fadeTo(1000, 1);
    
    //Many options from here down are either animations
    //or plugin options that I recieved from github
    
    //All plugin providers are named inside the appropriate files
	$('#logo').toggleClass("bounceInDown visible animated");
	setTimeout(function(){ $('#headerText').toggleClass("bounceInLeft visible animated"); }, 1000);
	setTimeout(function(){ $('#headerIcons').toggleClass("bounceInRight visible animated"); }, 1000);

	$('#myFoot').localScroll({duration:1600});
	
	$('#navbar').scrollspy({offset: 40, animate: true});
	
	$(".panel").hide();
	
	//This will act as a way to show/hide information in my resume section
	$('.accordion').click(function()
	{
	    $(this).toggleClass("accActive");
	    
	    if (!$(this).hasClass("accActive"))
	    {
	        $(this).next().slideUp(400);
	    }
	    else
	    {
	        $(this).siblings().next(".panel").slideUp(400);
	        $(this).siblings().removeClass("accActive");
	        
	        $(this).next().slideDown(400);
	    }
	});
	
	$(window).resize(function()
	{
	    //reset the return position everytime the window is resized
	    returnPos = $('#navbar').position().top;
	});
	
	$(window).scroll(function() 
	{	
	
		if($(window).scrollTop() >= returnPos && !navPassed)			
	    {
            $('#navList').addClass('stickList');
			$('#navbar').addClass('shrink');
			navPassed = true;
        }
		else if($(window).scrollTop() <= returnPos && navPassed)
		{
			$('#navList').removeClass("stickList");
			$('#navbar').removeClass('shrink');
			navPassed = false;
		}
		
	    if($(window).scrollTop() + $(window).height() == $(document).height()) 
	    {
            $('li').removeClass('active');
            $('#lastNavItem').addClass('active');
        }
	});
	
	function scrollView(elem)
	{
		var docTop = $(window).scrollTop();
		var docBot = docTop + $(window).height();
		var elemTop = $(elem).offset().top;
		var elemBot = elemTop + ($(elem).height() - ($(elem).height() * .4));
		
		return ((elemBot >= docTop) && (elemTop <= docBot) && (elemBot <= docBot) && (elemTop >= docTop));
	}
});