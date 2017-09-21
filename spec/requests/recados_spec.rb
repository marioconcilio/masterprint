require 'rails_helper'

RSpec.describe 'Recados', type: :request do
  before do
    @user = Usuario.create!(id: 0, nome: 'Test User', usuario: 'test', password: 'test123')
    allow(controller).to receive(:current_user).and_return(@user)
  end

  context 'displaying all' do
    let!(:list) { FactoryGirl.create_list(:recado, 20) }
    before { visit painel_recados_url }

    it 'should list all inside cards' do
      byebug
      all('#rec-cardsview card-columns card').each { |card| puts card }
    end
  end

end
