module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def format_currency(value)
    number_to_currency(value,
                       unit: "R$ ",
                       separator: ",",
                       delimiter: ".",
                       precision: 2)
  end

end
