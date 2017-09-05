module Custom
  class FormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def money_field(method, options={})
      content_tag :div, class: 'input-prepend input-group' do
        content_tag(:span, 'R$', class: 'input-group-addon') +
        text_field(method,
                   value: number_with_precision(object[method], precision: 2),
                   class: "money-field #{options[:class]}")
      end
    end

  end
end
