require 'rails_helper'

RSpec.describe Financeiro::PagSeguro, type: :model do
  it { should validate_presence_of(:tipo_pagamento) }
  it { should validate_presence_of(:valor_bruto) }
  it { should validate_presence_of(:valor_taxa) }
  it { should validate_presence_of(:valor_liquido) }
  it { should validate_presence_of(:data) }
  it { should validate_presence_of(:parcelas) }
  it { should validate_presence_of(:bandeira) }

  context 'when querying' do
    let!(:list) { FactoryGirl.create_list(:financeiro_pag_seguro, 100) }
    let(:sorted) { Financeiro::PagSeguro.all }

    it 'should order by data desc and valor_bruto asc' do
      arr = list.sort_by(&:data).reverse
      expect(sorted).to match_array(arr)
    end
  end
end
