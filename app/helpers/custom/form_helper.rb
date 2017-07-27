module Custom::FormHelper

  def modal_form_title(a, b)
    content_tag :h5, class: 'modal-title' do
      a.html_safe + content_tag(:strong, b)
    end
  end

  def modal_form_close_button
    button_tag type: :button, 'data-dismiss': :modal, 'aria-label': :close, class: 'close' do
      content_tag :span, '×', 'aria-hidden': true
    end
  end

  def modal_form_header(a, b)
    modal_form_title(a, b) +
    modal_form_close_button
  end

  def modal_form_save(f)
    content_tag :div, class: 'btn-group' do
      button_tag('Cancelar', type: :button, 'data-dismiss': :modal, class: 'btn btn-secondary') +
      f.submit('Salvar', class: 'btn btn-success')
    end
  end

  def form_label(text)
    content_tag :small, text, class: 'text-muted text-uppercase font-weight-bold'
  end

end
