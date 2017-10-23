require 'rails_helper'

RSpec.describe Tiktak::Calendario, type: :model do
  it { should validate_presence_of(:pagina) }
  it { should validate_presence_of(:referencia) }
  it { should validate_presence_of(:tipo) }
  it { should validate_presence_of(:descricao) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:un) }

  context 'when ordering' do
    let!(:calendarios) { create_list(:tiktak_calendario, 100) }
    let(:sorted) { Tiktak::Calendario.all }

    it 'should order by pagina and referencia asc' do
      arr = calendarios.sort_by { |c| [c.pagina, c.referencia] }
      expect(sorted).to match_array(arr)
    end
  end

end
