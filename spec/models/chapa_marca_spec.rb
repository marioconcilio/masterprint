require 'rails_helper'

RSpec.describe ChapaMarca, type: :model do
  it { should validate_presence_of(:marca) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:esp) }

  it { should have_many(:chapas).dependent(:destroy) }
end
