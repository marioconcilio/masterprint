'use strict';

$(document).ready(function($) {
  function resizeBroadcast() {
    var timesRun = 0;

    var interval = setInterval(function() {
      timesRun += 1;

      if(timesRun === 5) {
        clearInterval(interval);
      }

      window.dispatchEvent(new Event('resize'));
    }, 62.5);
  }

  $.navigation = $('nav > ul.nav');

  // Add class .active to current link
  $.navigation.find('a').each(function() {
    var fullUrl = String(window.location)
    var cUrl = fullUrl.split('?')[0];

    if (cUrl.substr(cUrl.length - 1) == '#') {
      cUrl = cUrl.slice(0,-1);
    }

    if ($($(this))[0].href == fullUrl) {
      $(this).addClass('active');
    }

    if ($($(this))[0].href == cUrl) {
      $(this).parents('ul').add(this).each(function() {
        $(this).parent().addClass('open');
      });
    }

  });

  // Dropdown Menu
  $.navigation.on('click', 'a', function(e) {
    if ($.ajaxLoad) {
      e.preventDefault();
    }

    if ($(this).hasClass('nav-dropdown-toggle')) {
      $(this).parent().toggleClass('open');
      resizeBroadcast();
    }

  });

  // Main Menu Open/Close, Min/Full
  $('.navbar-toggler').click(function() {
    if ($(this).hasClass('sidebar-toggler')) {
      $('body').toggleClass('sidebar-hidden');
      resizeBroadcast();
    }

    if ($(this).hasClass('sidebar-minimizer')) {
      $('body').toggleClass('sidebar-minimized');
      resizeBroadcast();
    }

    if ($(this).hasClass('aside-menu-toggler')) {
      $('body').toggleClass('aside-menu-hidden');
      resizeBroadcast();
    }

    if ($(this).hasClass('mobile-sidebar-toggler')) {
      $('body').toggleClass('sidebar-mobile-show');
      resizeBroadcast();
    }

  });

  $('.sidebar-close').click(function() {
    $('body').toggleClass('sidebar-opened').parent().toggleClass('sidebar-opened');
  });

  // Disable moving to top
  $('a[href="#"][data-top!=true]').click(function(e) {
    e.preventDefault();
  });

});
