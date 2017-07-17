require 'rails_helper'

RSpec.describe CadastroHelper, type: :helper do

  context 'cnpj' do
    it 'formats' do
      expect(helper.format_cnpj(11234567000189)).to eq('11.234.567/0001-89')
    end

    it 'formats with leading zero' do
      expect(helper.format_cnpj(1234567000189)).to eq('01.234.567/0001-89')
    end
  end

  context 'cep' do
    it 'formats' do
      expect(helper.format_cep(12345678)).to eq('12345-678')
    end

    it 'formats with leading zero' do
      expect(helper.format_cep(1234567)).to eq('01234-567')
    end
  end

  context 'ie' do
    it 'formats' do
      expect(helper.format_ie(123456789123)).to eq('123.456.789.123')
    end

    it 'formats with leading zero' do
      expect(helper.format_ie(1234567890)).to eq('001.234.567.890')
    end
  end

end
