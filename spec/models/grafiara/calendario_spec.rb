require 'rails_helper'

RSpec.describe Grafiara::Calendario, type: :model do
  it { should validate_presence_of(:referencia) }
  it { should validate_presence_of(:descricao) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:un) }

  context 'when ordering' do
    let!(:calendarios) { create_list(:grafiara_calendario, 3) }
    let(:sorted) { Grafiara::Calendario.all }

    before do
      calendarios.first.update(pagina: nil)
      calendarios.second.update(pagina: '02 à 04')
      calendarios.last.update(pagina: '01')
    end

    it 'should put the first page first' do
      expect(sorted.last).to eql calendarios.first
    end

    it 'should put the second page second' do
      expect(sorted.second).to eql calendarios.second
    end

    it 'sohuld put null page last' do
      expect(sorted.first).to eql calendarios.last
    end
  end

end
