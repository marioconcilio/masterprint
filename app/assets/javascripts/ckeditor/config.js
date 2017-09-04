CKEDITOR.editorConfig = function(config) {
  config.language = 'pt-br';
  config.enterMode = CKEDITOR.ENTER_DIV;
  config.height = '300px';
  config.toolbar_default = [
    { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
    { name: 'insert', items: [ 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar' ] },
    { name: 'links', items: [ 'Link', 'Unlink' ] },
    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat' ] },
    { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
    '/',
    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] }
  ];

  config.toolbar_mini = [
    // { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ] },
    // { name: 'insert', items: [ 'HorizontalRule', 'SpecialChar' ] },
    // { name: 'styles', items: [ 'FontSize' ] },
    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript','-', 'RemoveFormat' ] },
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
    { name: 'paragraph', items: [ '-', 'Outdent', 'Indent', '-', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] }
  ];

  return true;
};
