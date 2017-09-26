require 'rails_helper'

RSpec.describe 'Recados', type: :feature do
  before :all do
    @user = FactoryGirl.create(:usuario_teste)
  end

  before { stub_login @user }

  context 'when displaying' do
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

  context 'when querying', js: true do
    before :all do
      @list = FactoryGirl.create_list(:recado_recent, 100)
    end

    before do
      login @user
      visit painel_recados_path
    end

    after :all do
      @list.each { |r| r.destroy }
    end

    it 'should list only containing substring on titulo' do
      q = @list.sample.titulo
      within 'form#recado_search' do
        fill_in 'q_titulo_cont', with: q
        find('i.fa.fa-search').click
      end

      wait_for_ajax

      result = @list.select { |r| r.titulo.include? q }
      cards = all('#rec-cardsview .card-columns .card')
      expect(cards.count).to eql(result.count)
    end
  end

  context 'when adding new' do
    before do
      visit painel_recados_url
      click_on 'Novo Recado'
    end

    it 'should accept a valid one' do
      expect{
        within 'form#new_recado' do
          fill_in 'recado_titulo', with: 'Novo Título'
          fill_in 'recado_texto', with: 'Novo Texto'
          click_on 'Salvar'
        end
      }.to change(Recado, :count).by 1

      script = find('main script', visible: false).text(:all)
      expect(script).to include('toastr', 'success', 'Recado criado')

      expect(page).to have_current_path painel_recados_path
      expect(page).to have_content 'Novo Título'
      expect(page).to have_content 'Novo Texto'
    end

    it 'should reject a invalid one'
  end

  context 'when managing existing' do
    let!(:recado) { FactoryGirl.create(:recado_recent) }
    before { visit painel_recados_url }

    it 'should edit and update recado' do
      find(:xpath, "//a[@href='#{edit_painel_recado_path(recado)}']").click
    end

    it 'should mark recado as done'
    it 'should delete recado'
  end

end
