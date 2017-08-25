var ufOptions, phoneMaskBehavior, phoneOptions;

phoneMaskBehavior = function(val) {
  if (val.replace(/\D/g, '').length === 11) {
    return '(00) 00000-0000';
  }
  else {
    return '(00) 0000-00009';
  }
};

phoneOptions = {
  onKeyPress: function(val, e, field, options) {
    field.mask(phoneMaskBehavior.apply({}, arguments), options);
  }
};

ufOptions = {
  onKeyPress: function(uf, event, currentField, options) {
    currentField.val(uf.toUpperCase());
  }
};

$('.date-field').mask('00/00/0000', {
  placeholder: '__/__/____'
});

$('.number-field').mask('#');

$('.money-field').mask('#.##0,00', {
  reverse: true,
  placeholder: '0,00'
});

$('.cep-field').mask('00000-000');

$('.cnpj-field').mask('00.000.000/0000-00');

$('.ie-field').mask('000.000.000.000');

$('.phone-field').mask(phoneMaskBehavior, phoneOptions);

$('.uf-field').mask('SS', ufOptions);
