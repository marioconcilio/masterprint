require 'rails_helper'

RSpec.describe Recebimento, type: :model do
  it { should validate_presence_of(:vencimento) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:valor) }

  it { should belong_to(:cliente) }
end
