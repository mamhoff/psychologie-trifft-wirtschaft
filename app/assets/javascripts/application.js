//= require jquery
//= require bootstrap-sprockets

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
};

$(document).ready(startupFunctions);
$(document).ajaxStop(startupFunctions);
$(window).resize(resizeSections);
