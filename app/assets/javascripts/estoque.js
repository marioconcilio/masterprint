'use strict';

$(document).ready(function($) {
  $('body').on('click', '#mov_entrada', function() {
    $('#mov_saida').prop('checked', !this.checked);
  });

  $('body').on('click', '#mov_saida', function() {
    $('#mov_entrada').prop('checked', !this.checked);
  });

});
