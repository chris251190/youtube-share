// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


$(document).ready(function(){

	var fullWidthOfWindow = $(window).width();

	$(window).scroll(function(e){
		if ($(this).scrollTop() > 100) {
			$('.scrollup').fadeIn();
		} else {
			$('.scrollup').fadeOut();
		}
	});

	$(document).on("click", '.scrollup', function(event){
		event.preventDefault();

		$("html, body").animate({ scrollTop: 0 }, {
			duration: 1000,
			easing: 'swing'
		});
		return false;
	});


//Resize iFrames
function resizeIframe() {      	
	var oldHeight = parseInt($(".iframe-resize").attr("height"));        	
	var scaleFactor = $(window).width() / fullWidthOfWindow;      	
	var newHeight = oldHeight * scaleFactor;        	
	$(".iframe-resize").css('height', newHeight);  
}

$(window).resize(resizeIframe);


//scroll to anchor
function scrollToAnchor(aid){
	var aTag = $("a[name='"+ aid +"']");
	$('html,body').animate({scrollTop: aTag.offset().top},'slow');
}

$(document).on("click", ".scroll-to-video", function(e) {
	e.preventDefault();
	var name = $(this).attr("name");
	scrollToAnchor(name);
});

//notifications will fade out after 2 seconds
$(".alert").fadeOut(2000); 



//videolist cant be scrolled to the very top
$(window).scroll(function() {
	if($(window).scrollTop() > 200) {
		$(".videolist").css("position", "fixed");
		$(".videolist").css("max-width", "15%");
		$(".videolist").css("margin-top", "0%");
		
	} else {
		$(".videolist").css("position", "relative");
		$(".videolist").css("max-width", "100%");		
		$(".videolist").css("margin-top", "95%");
	}
});


});





