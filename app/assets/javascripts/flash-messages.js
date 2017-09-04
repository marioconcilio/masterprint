'use strict';

$(document).ready(function($) {
  var title = {
    success: 'Sucesso',
    info: 'Info',
    warning: 'Atenção',
    error: 'Erro'
  };

  var showFlashMessages = function(jqXHR) {
    if (!jqXHR || !jqXHR.getResponseHeader) {
      return;
    }

    var flash = jqXHR.getResponseHeader('X-Flash');
    flash = decodeURIComponent(escape(flash))
    flash = JSON.parse(flash);

    var key;
    for (key in flash) {
      if (flash.hasOwnProperty(key)) {
        toastr[key](flash[key], title[key], { 'closeButton': true, 'progressBar': true });
      }
    }
  };

  $(document).ajaxComplete(function(event, xhr, settings) {
    showFlashMessages(xhr);
  });

});
