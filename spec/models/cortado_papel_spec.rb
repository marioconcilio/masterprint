require 'rails_helper'

RSpec.describe CortadoPapel, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:moeda) }
  it { should validate_presence_of(:un) }
end
