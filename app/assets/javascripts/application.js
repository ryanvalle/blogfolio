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
if (window.history) {
	$(window).load(function() {
		setTimeout(function() {
			$('.loader').animate({
				opacity: 0
			}, 500, 'linear', function() {
				$('#welcome-container').addClass('loaderAnimateOut')
				$('#welcome-container').bind('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', function() {
					$('#welcome-container').remove()
				})
				}
			)
		}, 500)
	})

	// Prevent default on link clicks in #content frame
	$(function() {
		$('#content').on('click','a',function(e) {
			var reqPage = $(this).attr('href')
			window.history.pushState('','',reqPage)
			getRequestedPage(reqPage)
			e.preventDefault()
			function getRequestedPage(page) {
				$('#content').removeClass('contentIn').addClass('contentOut')
				$('#content').bind('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', function() {
					$.ajax({
						url: page,
						dataType: 'script',
						success: function() {
							setTimeout(function(){$('#content').removeClass('contentOut').addClass('contentIn')}, 500)
							$('#content').unbind('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd')
						}
					})
				})
			}
		})

		$('#content').on('touchend','a',function(e) {
			var reqPage = $(this).attr('href')
			window.history.pushState('','',reqPage)
			getRequestedPage(reqPage)
			e.preventDefault()
			function getRequestedPage(page) {
				$('#content').removeClass('contentIn').addClass('contentOut')
				$('#content').bind('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', function() {
					$.ajax({
						url: page,
						dataType: 'script',
						success: function() {
							setTimeout(function(){$('#content').removeClass('contentOut').addClass('contentIn')}, 500)
							$('#content').unbind('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd')
						}
					})
				})
			}
		})
	})
} else {
	$(document).ready(function(){$('#welcome-container').remove()})
}