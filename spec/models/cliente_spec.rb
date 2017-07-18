require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:contato) }

  it { should have_many(:recebimentos).dependent(:destroy) }
  it { should have_many(:cheques).dependent(:destroy) }
end
