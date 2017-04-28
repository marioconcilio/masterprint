require 'rails_helper'

RSpec.describe Tinta, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:marca) }
  it { should validate_presence_of(:preco_kg) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:un) }
  it { should validate_presence_of(:moeda) }
end
