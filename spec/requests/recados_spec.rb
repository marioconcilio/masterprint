require 'rails_helper'

RSpec.describe 'Recados', type: :request do
  let(:user) { FactoryGirl.create(:usuario) }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context 'when displaying all' do
    let!(:list) do
      FactoryGirl.create_list(:recado_recent, 20) |
      FactoryGirl.create_list(:recado_old, 10) |
      FactoryGirl.create_list(:recado_done_recent, 5)
    end

    before { visit painel_recados_url }

    it 'should put all recados inside card class' do
      cards = all('#rec-cardsview .card-columns .card')
      expect(cards.count).to eql(35)
    end

    it 'should put all recados old inside card-danger class' do
      cards = all('#rec-cardsview .card-columns .card-danger')
      expect(cards.count).to eql(10)
    end

    it 'should put all recados done inside card-success class' do
      cards = all('#rec-cardsview .card-columns .card-success')
      expect(cards.count).to eql(5)
    end

    it 'should show edit button on recados undone' do
      cards = all(:xpath, '//div[@id="rec-cardsview"]
                            //div[@class="card-columns"]
                            //div[@class="card " or @class="card card-inverse card-danger"]')
        .map { |c| c.has_selector? '.card-actions' }

      expect(cards).to all be_truthy
    end

    it 'should not show edit button on recados done' do
      cards = all('#rec-cardsview .card-columns .card-success')
        .map { |c| c.has_selector? '.card-actions' }

      expect(cards).to all be_falsey
    end
  end

end
