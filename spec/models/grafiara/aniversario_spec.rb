require 'rails_helper'

module Grafiara
  RSpec.describe Aniversario, type: :model do
    let(:aniversarios) { create_list(:grafiara_aniversario, 3) }

    it { should validate_presence_of(:codigo) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }

    it 'orders by pagina nulls last' do
      aniversarios.first.update(pagina: nil)
      aniversarios.second.update(pagina: '02 à 04')
      aniversarios.last.update(pagina: '01')

      sorted = Aniversario.all
      expect(sorted.first).to eql aniversarios.last
      expect(sorted.second).to eql aniversarios.second
      expect(sorted.last).to eql aniversarios.first
    end
  end
end
