'use strict';

$(document).ready(function($) {

  // tooltip
  $('[data-toggle="tooltip"]').tooltip({
    delay: {
      show: 400,
      hide: 200
    }
  });

  // popover
  $('[rel="popover"],[data-rel="popover"],[data-toggle="popover"]').popover();

  // clickable table rows
  $('body').on('click', 'tr[data-href]', function() {
    window.location = $(this).data('href');
  });

  // hide modal on submit
  $('.modal').on('click', 'input[type="submit"]', function() {
    $('.modal').modal('hide');
  });

  // clear search field
  $('#clear-searchfield').on('click', function() {
    $('input.form-control').val('');
  });

});
