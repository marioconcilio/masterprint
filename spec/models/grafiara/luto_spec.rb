require 'rails_helper'

module Grafiara
  RSpec.describe Luto, type: :model do
    let(:lutos) { create_list(:grafiara_luto, 4) }

    it { should validate_presence_of(:pagina) }
    it { should validate_presence_of(:referencia) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }
    it { should validate_presence_of(:qtde) }

    it 'orders by referencia and pagina asc' do
      lutos[1].update(referencia: 'A')
      lutos[0].update(referencia: 'B')
      lutos[3].update(referencia: 'C', pagina: '01')
      lutos[2].update(referencia: 'C', pagina: '02')

      sorted = Luto.all
      expect(sorted[0]).to eql lutos[1]
      expect(sorted[1]).to eql lutos[0]
      expect(sorted[2]).to eql lutos[3]
      expect(sorted[3]).to eql lutos[2]
    end
  end
end
