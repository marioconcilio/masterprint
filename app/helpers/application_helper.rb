module ApplicationHelper

  def active_class(link_path)
    if request.fullpath == root_path
      link_path == estoque_blanquetas_path ? 'active' : ''
    else
      # current_page?(link_path) ? 'active' : ''
      request.fullpath.include?(link_path) ? 'active' : ''
    end
  end

  def active_button(args)
    if args.values.first == nil && params[args.keys.first] == nil
      'btn btn-default active'
    elsif args.values.first.to_s == params[args.keys.first]
      'btn btn-default active'
    else
      'btn btn-default'
    end
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

  def format_date(date)
    date.strftime('%d/%m/%y')
  end

end
