$(function () {
  // Search form.
  $('#estoque_search').submit(function () {
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });
});
