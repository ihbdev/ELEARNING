jQuery().ready(function(){		
	// note show
	$(".text-intro-show").click(function () {
	  $(".test-introduction").slideToggle("fast");
	  $(".text-intro-show").css('display','none');
	  $(".text-intro-hide").css('display','block');
	});	
	$(".text-intro-hide").click(function () {
	  $(".test-introduction").slideToggle("fast");
	  $(".text-intro-show").css('display','block');
	  $(".text-intro-hide").css('display','none');
	});
	// label click 
	$('label', $('.text-box .text-check div')).live("click", function(){
		var parent = $(this).parent();
		
    	if ($(parent).hasClass("active")){
        	$(parent).removeClass("active");
			$("input", $(parent)).attr('checked', false);
        }else{
            $(parent).addClass("active");
			$("input", $(parent)).attr('checked', true);
        }    	
   	return false;
    });
	// checkbox click 
	$('input', $('.text-box .text-check div')).live("click", function(){
		var parent = $(this).parent();
		
    	if ($(parent).hasClass("active")){
        	$(parent).removeClass("active");
			$(this).attr('checked', false);
			$(this).checked(false);
			
        }else{
            $(parent).addClass("active");
			$(this).attr('checked', true);
			$(this).checked(true);
			
        }    	
   	return false;
    });		
});
