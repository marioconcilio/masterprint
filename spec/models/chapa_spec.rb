require 'rails_helper'

RSpec.describe Chapa, type: :model do
  it { should validate_presence_of(:larg) }
  it { should validate_presence_of(:comp) }
  it { should validate_presence_of(:qtde) }
  it { should validate_presence_of(:moeda) }
  it { should belong_to(:chapa_marca) }

  context 'when ordering' do
    let!(:chapas) { FactoryGirl.create_list(:chapa, 100) }
    let(:sorted) { Chapa.all.includes(:chapa_marca) }

    it 'should sort by larg and comp asc' do
      arr = chapas.sort_by { |c| [c.larg, c.comp] }
      expect(sorted).to match_array(arr)
    end
  end

  context 'calculating preco' do
    context 'when BRL currency' do
      let!(:chapa) { FactoryGirl.create(:chapa_brl) }

      it 'should be based on larg, comp and chapa_marca preco' do
        expected = (chapa.larg *
                    chapa.comp *
                    chapa.chapa_marca.preco / 1000000).round(1)
        expect(chapa.preco).to eql(expected)
      end
    end

    context 'when USD currency' do
      let!(:chapa) { FactoryGirl.create(:chapa_usd) }

      it 'should be based on larg, comp, chapa_marca preco and dolar' do
        dolar = Settings.dolar.chapas
        expected = (chapa.larg *
                    chapa.comp *
                    chapa.chapa_marca.preco *
                    dolar / 1000000).round(1)
        expect(chapa.preco).to eql(expected)
      end
    end
  end

  context 'calculating preco_avulso' do
    let!(:chapa) { FactoryGirl.create(:chapa) }

    it 'should be preco multiplied by a factor' do
      expected = (chapa.preco * Settings.chapa.avulso).round(1)
      expect(chapa.preco_avulso).to eql(expected)
    end
  end

  context 'getting size' do
    let!(:chapa) { FactoryGirl.create(:chapa) }

    it 'should set correctly based on larg and comp' do
      str = '%03d x %03d' % [chapa.larg, chapa.comp]
      expect(chapa.size).to eql(str)
    end
  end

  context 'ransacker' do
    let!(:chapa) { FactoryGirl.create(:chapa) }
    let!(:ransackers) { chapa._ransackers }

    context 'preco_un' do
      it 'should be "larg * comp * chapa_marcas.preco"' do
        expected = Arel.sql('larg * comp * chapa_marcas.preco')
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
