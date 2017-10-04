require 'rails_helper'

RSpec.describe Blanqueta, type: :model do
  it { should validate_presence_of(:larg) }
  it { should validate_presence_of(:comp) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:moeda) }
  it { should validate_presence_of(:nome) }
  it { should belong_to(:blanqueta_lona) }

  context 'when ordering' do
    let!(:blanquetas) { FactoryGirl.create_list(:blanqueta, 100) }
    let(:sorted) { Blanqueta.all }

    it 'should sort by larg and comp asc' do
      arr = blanquetas.sort_by { |b| [b.larg, b.comp] }
      expect(sorted).to match_array(arr)
    end
  end

  context 'calculating preco_un' do
    context 'when BRL currency' do
      let!(:blanqueta) { FactoryGirl.create(:blanqueta_brl) }

      it 'should be based on larg, comp and blanqueta_lona preco' do
        expected = (blanqueta.larg *
                    blanqueta.comp *
                    blanqueta.blanqueta_lona.preco / 1000000).round(1)
        expect(blanqueta.preco_un).to eql(expected)
      end
    end

    context 'when USD currency' do
      let!(:blanqueta) { FactoryGirl.create(:blanqueta_usd) }

      it 'should be based on larg, comp, blanqueta_lona preco and dolar' do
        dolar = Settings.dolar.blanquetas
        expected = (blanqueta.larg *
                    blanqueta.comp *
                    blanqueta.blanqueta_lona.preco *
                    dolar / 1000000).round(1)
        expect(blanqueta.preco_un).to eql(expected)
      end
    end
  end

  context 'getting size' do
    let!(:blanqueta) { FactoryGirl.create(:blanqueta) }

    it 'should set correctly based on larg and comp' do
      str = '%03d x %03d' % [blanqueta.larg, blanqueta.comp]
      expect(blanqueta.size).to eql(str)
    end
  end

  context 'ransacker' do
    let!(:blanqueta) { FactoryGirl.create(:blanqueta) }
    let!(:ransackers) { blanqueta._ransackers }

    context 'preco_un' do
      it 'should be "larg * comp * blanqueta_lonas.preco"' do
        expected = Arel.sql('larg * comp * blanqueta_lonas.preco')
        expect(ransackers['preco_un'].call).to eql(expected)
      end
    end

    context 'larg' do
      it 'should be "larg::text"' do
        expected = Arel.sql('larg::text')
        expect(ransackers['larg'].call).to eql(expected)
      end
    end

    context 'comp' do
      it 'should be "comp::text"' do
        expected = Arel.sql('comp::text')
        expect(ransackers['comp'].call).to eql(expected)
      end
    end
  end
end
