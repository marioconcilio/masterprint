require 'rails_helper'

RSpec.describe Blanqueta, type: :model do
  it { should validate_presence_of(:larg) }
  it { should validate_presence_of(:comp) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:moeda) }
  it { should validate_presence_of(:nome) }
end
