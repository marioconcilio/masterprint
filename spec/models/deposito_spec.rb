require 'rails_helper'

RSpec.describe Deposito, type: :model do
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:titular) }
  it { should validate_numericality_of(:total).is_greater_than(0) }

  it { should have_many(:cheques).dependent(:destroy) }
end
