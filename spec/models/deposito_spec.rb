require 'rails_helper'

RSpec.describe Deposito, type: :model do
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:banco) }
  it { should validate_presence_of(:agencia) }
  it { should validate_presence_of(:conta) }
  it { should validate_presence_of(:titular) }

  it { should have_many(:cheques).dependent(:destroy) }
end
