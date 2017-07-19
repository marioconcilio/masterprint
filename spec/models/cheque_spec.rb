require 'rails_helper'

RSpec.describe Cheque, type: :model do
  it { should validate_presence_of(:banco) }
  it { should validate_presence_of(:numero) }
  it { should validate_presence_of(:emitente) }
  it { should validate_presence_of(:valor) }
  it { should validate_presence_of(:data_deposito) }
  it { should validate_presence_of(:cliente) }
  it { should validate_presence_of(:status) }

  it { should belong_to(:cliente) }
  it { should belong_to(:deposito) }
end
