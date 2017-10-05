require 'rails_helper'

RSpec.describe Cheque, type: :model do
  it { should validate_presence_of(:banco) }
  it { should validate_presence_of(:numero) }
  it { should validate_presence_of(:emitente) }
  it { should validate_presence_of(:valor) }
  it { should validate_presence_of(:data_deposito) }
  it { should validate_presence_of(:cliente) }
  it { should validate_presence_of(:status) }
  it { should belong_to(:cliente) }
  it { should belong_to(:deposito) }

  context 'when ordering' do
    let!(:cheques) { FactoryGirl.create_list(:cheque, 100) }
    let(:sorted) { Cheque.all }

    it 'should sort by data_deposito, banco, numero and valor' do
      arr = cheques.sort_by { |c| [c.data_deposito, c.banco, c.numero, c.valor] }
      expect(sorted).to match_array(arr)
    end
  end

  context 'searching' do
    let!(:cheques) { FactoryGirl.create_list(:cheque, 100) }


  end
end
