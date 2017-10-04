require 'rails_helper'

RSpec.feature 'Querying Recados', js: true do
  given!(:recados_page) { Page::RecadosPage.new }

  before :all do
    @user = FactoryGirl.create(:usuario_teste)
    @list = FactoryGirl.create_list(:recado, 100)
  end

  after :all do
    @user.destroy
    @list.each { |r| r.destroy }
  end

  before do
    login @user
    recados_page.visit_page
  end

  scenario 'view only cards that contain substring on titulo' do
    q = @list.sample.titulo
    recados_page.search_for q
    wait_for_ajax

    result = @list.select { |r| r.titulo.include? q }
    cards = recados_page.all_cards
    expect(cards.count).to eql(result.count)
  end

end
