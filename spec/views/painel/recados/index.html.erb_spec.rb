require 'rails_helper'

RSpec.describe "painel/recados/index", type: :view do

  it 'display recados correctly' do
    render
    expect(rendered).to have_selector('#rec-cardsview')
  end

end
