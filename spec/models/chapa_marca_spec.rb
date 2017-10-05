require 'rails_helper'

RSpec.describe ChapaMarca, type: :model do
  it { should validate_presence_of(:marca) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:esp) }
  it { should have_many(:chapas).dependent(:destroy) }

  context 'getting marca & esp' do
    let!(:chapa_marca) { FactoryGirl.create(:chapa_marca) }

    it 'should match the format "marca (esp)"' do
      str = "#{chapa_marca.marca} (#{chapa_marca.esp})"
      expect(chapa_marca.marca_and_esp).to eql(str)
    end
  end
end
