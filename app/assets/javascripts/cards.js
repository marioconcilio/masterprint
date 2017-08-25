'use strict';

$(document).on('click', '.card-actions a', function(e) {
  $.panelIconOpened = 'icon-arrow-up';
  $.panelIconClosed = 'icon-arrow-down';

  e.preventDefault();

  if ($(this).hasClass('btn-close')) {
    $(this).parent().parent().parent().fadeOut();
  }
  else if ($(this).hasClass('btn-minimize')) {
    var $target = $(this).parent().parent().next('.card-block');

    if (!$(this).hasClass('collapsed')) {
      $('i',$(this)).removeClass($.panelIconOpened).addClass($.panelIconClosed);
    }
    else {
      $('i',$(this)).removeClass($.panelIconClosed).addClass($.panelIconOpened);
    }

  }
  else if ($(this).hasClass('btn-setting')) {
    $('#modal-window').modal('show');
  }

});
