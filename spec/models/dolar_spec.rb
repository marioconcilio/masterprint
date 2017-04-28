require 'rails_helper'

RSpec.describe Dolar, type: :model do
  it { should validate_presence_of(:value) }
end
