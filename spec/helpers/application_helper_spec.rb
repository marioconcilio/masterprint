require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  it 'should format currency' do
    expect(format_currency(1)).to eql 'R$ 1,00'
    expect(format_currency(10)).to eql 'R$ 10,00'
    expect(format_currency(100)).to eql 'R$ 100,00'
    expect(format_currency(1000)).to eql 'R$ 1.000,00'
    expect(format_currency(1.5)).to eql 'R$ 1,50'
    expect(format_currency(1.55)).to eql 'R$ 1,55'
    expect(format_currency(1.555)).to eql 'R$ 1,56'
  end
end
