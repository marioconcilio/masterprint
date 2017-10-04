require 'rails_helper'

module Grafiara
  RSpec.describe Casamento, type: :model do
    it { should validate_presence_of(:codigo) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }

    context 'when ordering' do
      let!(:casamentos) { create_list(:grafiara_casamento, 3) }
      let(:sorted) { Casamento.all }

      before do
        casamentos.first.update(pagina: nil)
        casamentos.second.update(pagina: '02 à 04')
        casamentos.last.update(pagina: '01')
      end

      it 'should put the first page first' do
        expect(sorted.first).to eql casamentos.last
      end

      it 'should put the second page second' do
        expect(sorted.second).to eql casamentos.second
      end

      it 'sohuld put null page last' do
        expect(sorted.last).to eql casamentos.first
      end
    end

  end
end
