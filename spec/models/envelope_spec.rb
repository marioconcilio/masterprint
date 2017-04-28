require 'rails_helper'

RSpec.describe Envelope, type: :model do
  it { should validate_presence_of(:preco_milheiro) }
  it { should validate_presence_of(:moeda) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:un) }
  it { should validate_presence_of(:grs) }
  it { should validate_presence_of(:larg) }
  it { should validate_presence_of(:comp) }
  it { should validate_presence_of(:tipo) }
end
