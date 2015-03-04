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
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $('.room_resevation').on('click', function(ev) {
	var element = $(this);
    $.post('/room', element.data(), function(json) {
      location.reload();
    }, 'json');
    ev.preventDefault();
  });

  $('.room_reservation_cancelable').on('click', function(ev) {
  	var option = confirm("Deseja remover a reserva da sala?")
  	if (option == true) {
  		var element = $(this),
    	data = element.data();
    	data._method = 'delete';
    	$.post('/room', data, function(json) {
      		location.reload();
    	}, 'json');
    	ev.preventDefault();
    	
  	}    
  });
});