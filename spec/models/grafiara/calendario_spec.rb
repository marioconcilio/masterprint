require 'rails_helper'

module Grafiara
  RSpec.describe Calendario, type: :model do
    let(:calendarios) { create_list(:grafiara_calendario, 3) }

    it { should validate_presence_of(:referencia) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }

    it 'orders by pagina nulls last' do
      calendarios.first.update(pagina: nil)
      calendarios.second.update(pagina: '02 à 04')
      calendarios.last.update(pagina: '01')

      sorted = Calendario.all
      expect(sorted.first).to eql calendarios.last
      expect(sorted.second).to eql calendarios.second
      expect(sorted.last).to eql calendarios.first
    end

  end
end
