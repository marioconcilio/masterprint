module Custom::SwitchHelper

  def switch_tag(opt={}, checked=false)
    opt.symbolize_keys!
    content_tag :label, class: "switch switch-icon #{opt[:class]}" do
      content_tag(:input, nil,
                  type: 'checkbox',
                  id: "#{opt[:name]}_#{opt[:value]}",
                  name: opt[:name],
                  value: opt[:value],
                  class: 'switch-input',
                  data: opt[:data],
                  checked: checked) +
      content_tag(:span, nil, class: 'switch-label') +
      content_tag(:span, nil, class: 'switch-handle')
    end
  end

  def switch_success_tag(opt={}, checked=false)
    opt.symbolize_keys!
    switch_tag name: opt[:name],
               value: opt[:value],
               class: "switch-success #{opt[:class]}",
               data: opt[:data],
               checked: checked
  end

  def switch_success_sm_tag(opt={}, checked=false)
    opt.symbolize_keys!
    switch_tag name: opt[:name],
               value: opt[:value],
               class: "switch-success switch-sm #{opt[:class]}",
               data: opt[:data],
               checked: checked
  end

end
