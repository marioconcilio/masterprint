require 'rails_helper'

RSpec.feature 'Recados index' do
  given!(:recados_page) { Page::RecadosPage.new }
  given!(:list) do
    FactoryGirl.create_list(:recado_recent, 20) |
    FactoryGirl.create_list(:recado_old, 10) |
    FactoryGirl.create_list(:recado_done_recent, 5)
  end

  before do
    mock_login_test_user
    recados_page.visit_page
  end

  scenario 'view all recados inside cards' do
    cards = recados_page.all_cards
    expect(cards.count).to eql(35)
  end

  scenario 'view all old recados inside danger cards' do
    cards = recados_page.all_danger_cards
    expect(cards.count).to eql(10)
  end

  scenario 'view all done recados inside success cards' do
    cards = recados_page.all_success_cards
    expect(cards.count).to eql(5)
  end

end
