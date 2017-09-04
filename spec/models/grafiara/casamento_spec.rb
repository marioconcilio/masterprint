require 'rails_helper'

module Grafiara
  RSpec.describe Casamento, type: :model do
    let(:casamentos) { create_list(:grafiara_casamento, 3) }

    it { should validate_presence_of(:codigo) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }

    it 'orders by pagina nulls last' do
      casamentos.first.update(pagina: nil)
      casamentos.second.update(pagina: '02 à 04')
      casamentos.last.update(pagina: '01')

      sorted = Casamento.all
      expect(sorted.first).to eql casamentos.last
      expect(sorted.second).to eql casamentos.second
      expect(sorted.last).to eql casamentos.first
    end
  end
end
