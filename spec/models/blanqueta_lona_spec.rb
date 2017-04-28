require 'rails_helper'

RSpec.describe BlanquetaLona, type: :model do
  it { should validate_presence_of(:lonas) }
  it { should validate_presence_of(:preco) }

  it { should have_many(:blanquetas).dependent(:destroy) }
end
