//= require jquery
//= require bootstrap-sprockets
//= require jquery.scrollTo
//= require jquery-localscroll
//= require jquery-parallax


var showErrorModals = function() {
  $('.has-error').parents('.modal').modal('show')
};

var resizeSections = function(){
    var windowHeight = $(window).height() - $('.navbar').first().height();
    $.each($('.section'), function(i, e) {
      $(e).css('min-height', windowHeight + 'px');
    });
};

var startupFunctions = function() {
  showErrorModals();
  resizeSections();
  $.localScroll({offset: {top: -60}});
};

$(document).ready(startupFunctions);
$(document).ajaxStop(startupFunctions);
$(window).resize(resizeSections);

