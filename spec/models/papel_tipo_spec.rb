require 'rails_helper'

RSpec.describe PapelTipo, type: :model do
  it { should validate_presence_of(:tipo) }
  it { should validate_presence_of(:preco_kg) }
  it { should validate_presence_of(:moeda) }

  it { should have_many(:papeis).dependent(:destroy) }
end
