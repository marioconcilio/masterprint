module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def format_currency(value, currency='BRL')
    unit = currency == 'BRL'? 'R$' : 'US$'

    if value
      number_to_currency(value,
                         unit: unit,
                         separator: ',',
                         delimiter: '.',
                         precision: 2)
    else
      '-'
    end
  end

  def format_decimal(value)
    number_with_delimiter(value,
                          delimiter: '.',
                          separator: ',')
  end

end
