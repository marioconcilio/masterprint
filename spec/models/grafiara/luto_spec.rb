require 'rails_helper'

module Grafiara
  RSpec.describe Luto, type: :model do
    it { should validate_presence_of(:pagina) }
    it { should validate_presence_of(:referencia) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }
    it { should validate_presence_of(:qtde) }

    context 'when ordering' do
      let!(:lutos) { create_list(:grafiara_luto, 4) }
      let(:sorted) { Luto.all }

      before do
        lutos[1].update(referencia: 'A')
        lutos[0].update(referencia: 'B')
        lutos[3].update(referencia: 'C', pagina: '01')
        lutos[2].update(referencia: 'C', pagina: '02')
      end

      it 'should put first referencia first' do
        expect(sorted[0]).to eql lutos[1]
      end

      it 'should put second referencia second' do
        expect(sorted[1]).to eql lutos[0]
      end

      it 'should put third referencia at first page third' do
        expect(sorted[2]).to eql lutos[3]
      end

      it 'should put third referencia at second page fourth' do
        expect(sorted[3]).to eql lutos[2]
      end
    end

  end
end
