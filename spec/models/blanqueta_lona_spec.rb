require 'rails_helper'

RSpec.describe BlanquetaLona, type: :model do
  it { should validate_presence_of(:lonas) }
  it { should validate_presence_of(:preco) }
  it { should have_many(:blanquetas).dependent(:destroy) }

  context 'when ordering' do
    let!(:blanqueta_lonas) { FactoryGirl.create_list(:blanqueta_lona, 10) }
    let(:sorted) { BlanquetaLona.all }

    it 'should sort by lona asc' do
      arr = blanqueta_lonas.sort_by &:lonas
      expect(sorted).to match_array(arr)
    end
  end

end
