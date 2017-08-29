require 'rails_helper'

RSpec.describe GrafiaraFolhinha, type: :model do
  it { should validate_presence_of(:referencia) }
  it { should validate_presence_of(:descricao) }
  it { should validate_presence_of(:un) }
  it { should validate_presence_of(:preco) }
end
