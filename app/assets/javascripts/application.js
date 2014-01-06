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
//= require_tree .

document.onkeyup = function(event){
  if (!window.disableRedirect) {
    if (event.keyCode === 37 || event.keyCode === 40) {
      window.location = window.location.href + '/previous';
      window.disableRedirect = true;
    } else if (event.keyCode === 38 || event.keyCode === 39) {
      window.location = window.location.href + '/next';
      window.disableRedirect = true;
    }
  }
};
