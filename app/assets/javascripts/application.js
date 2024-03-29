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
//= require turbolinks
//= require highlightjs
//= require select2
//= require faye
//= require_tree .

Turbolinks.enableProgressBar();

$(document).on('ready page:load', function () {
  $('.select').select2();

  $('.paste-link').click(function() {
    Turbolinks.visit($(this).data("href"));
  });

  $('.paste-body').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});