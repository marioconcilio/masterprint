require 'rails_helper'

RSpec.describe Fornecedor, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:contato) }
end
