class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.is_numeric?(s)
    !!Float(s) rescue false
  end

end
