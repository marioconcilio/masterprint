require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:endereco) }
  it { should validate_presence_of(:cidade) }
  it { should validate_presence_of(:uf) }
  it { should validate_presence_of(:cep) }

  it { should have_many(:recebimentos) }
end
