// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor-jquery
// require ckeditor/config
// require_tree .


// HIDE LOADER SCREEN ONCE ASSETS ARE LOADED
$(window).load(function() {
	setTimeout(function() {
		$('.loader').animate({
			opacity: 0
		}, 500, 'linear', function() {
			$('#welcome-container').animate({
					right: '100%'
				}, 500, 'linear', function() { $('#welcome-container').remove() }
			)
			}
		)
	}, 2000)
})

function setLink(cnumb,url) {
	CKEDITOR.tools.callFunction(cnumb, url);
	window.close();
}
