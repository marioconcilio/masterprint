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

  def link_delete_to(name=nil, options=nil, html_options=nil, &block)
    link_tooltip_to(name, { title: 'Excluir', class: 'fa fa-trash-o btn btn-danger' },
                    options, html_options, &block)
  end

  def link_check_to(name=nil, options=nil, html_options=nil, &block)
    link_tooltip_to(name, { title: 'Conferido', class: 'fa fa-check btn btn-info' },
                    options, html_options, &block)
  end

  def link_estoque_to(name=nil, options=nil, html_options=nil, &block)
    link_to options, html_options do
      content_tag(:i, nil, class: 'icon-tag') + name
    end
  end

  def link_cadastro_to(name=nil, options=nil, html_options=nil, &block)
    link_to options, html_options do
      content_tag(:i, nil, class: 'icon-user' ) + name
    end
  end

  def link_financeiro_to(name=nil, options=nil, html_options=nil, &block)
    link_to options, html_options do
      content_tag(:i, nil, class: 'icon-wallet') + name
    end
  end

  def link_grafiara_to(name=nil, options=nil, html_options=nil, &block)
    link_to options, html_options do
      content_tag(:i, nil, class: 'icon-layers') + name
    end
  end

  def link_tiktak_to(name=nil, options=nil, html_options=nil, &block)
    link_to options, html_options do
      content_tag(:i, nil, class: 'icon-layers') + name
    end
  end

  def fa_tag(klass)
    content_tag :i, nil, class: klass
  end

  def qtde_badge(product)
    if product.qtde <= 0
      content_tag :span, nil, class: 'badge badge-danger' do
        fa_tag 'fa fa-exclamation'
      end
    else
      tag(:br)
    end
  end

end
