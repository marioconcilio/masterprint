module Custom::HtmlHelper

  def link_tooltip_to(name, tip_options, options=nil, html_options=nil, &block)
    html_options ||= {}
    html_options['data-toggle'] = 'tooltip'
    html_options['data-placement'] = tip_options[:placement] || 'bottom'
    html_options['data-original-title'] = tip_options[:title]
    html_options['class'] ||= tip_options[:class]

    link_to(name, options, html_options, &block)
  end

  def link_details_to(name=nil, options=nil, html_options=nil, &block)
    link_tooltip_to(name, { title: 'Detalhes', class: 'fa fa-search-plus btn btn-success' },
                    options, html_options, &block)
  end

  def link_movimento_to(name=nil, options=nil, html_options=nil, &block)
    link_tooltip_to(name, { title: 'Movimento', class: 'fa fa-pencil-square-o btn btn-info' },
                    options, html_options, &block)
  end

  def fa_tag(klass)
    content_tag :i, nil, class: klass
  end

end
