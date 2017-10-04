require 'rails_helper'

module Grafiara
  RSpec.describe Aniversario, type: :model do
    it { should validate_presence_of(:codigo) }
    it { should validate_presence_of(:preco) }
    it { should validate_presence_of(:un) }

    context 'when ordering' do
      let!(:aniversarios) { FactoryGirl.create_list(:grafiara_aniversario, 3) }
      let(:sorted) { Aniversario.all }

      before do
        aniversarios.first.update(pagina: nil)
        aniversarios.second.update(pagina: '02 à 04')
        aniversarios.last.update(pagina: '01')
      end

      it 'should put the first page first' do
        expect(sorted.first).to eql aniversarios.last
      end

      it 'should put the second page second' do
        expect(sorted.second).to eql aniversarios.second
      end

      it 'sohuld put null page last' do
        expect(sorted.last).to eql aniversarios.first
      end
    end
  end
end
