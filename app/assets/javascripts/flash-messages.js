'use strict';

$(document).ready(function($) {
  var showFlashMessages, title;

  title = {
    success: 'Sucesso',
    info: 'Info',
    warning: 'Atenção',
    error: 'Erro'
  };

  showFlashMessages = function(jqXHR) {
    var flash;
    if (!jqXHR || !jqXHR.getResponseHeader) {
      return;
    }

    flash = jqXHR.getResponseHeader('X-Flash');
    flash = JSON.parse(flash);

    return _.each(flash, function(message, key) {
      return toastr[key](message, title[key], {
        'closeButton': true,
        'progressBar': true
      });
    });
  };

  $(document).ajaxComplete(function(event, xhr, settings) {
    showFlashMessages(xhr);
  });

});
