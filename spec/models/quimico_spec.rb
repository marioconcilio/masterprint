require 'rails_helper'

RSpec.describe Quimico, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:marca) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:un) }
  it { should validate_presence_of(:moeda) }
end
