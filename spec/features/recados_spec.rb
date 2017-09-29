require 'rails_helper'

RSpec.describe 'Recados', type: :feature do
  before do
    @user = FactoryGirl.create(:usuario_teste)
    stub_login @user
  end

  context 'when displaying' do
    let!(:list) do
      FactoryGirl.create_list(:recado_recent, 20) |
      FactoryGirl.create_list(:recado_old, 10) |
      FactoryGirl.create_list(:recado_done_recent, 5)
    end

    before { visit painel_recados_path }

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
      @list = FactoryGirl.create_list(:recado, 100)
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
      visit painel_recados_path
      click_on 'Novo Recado'
    end

    it 'should accept a valid one' do
      expect {
        within 'form#new_recado' do
          fill_in 'recado_titulo', with: 'Novo Título'
          fill_in 'recado_texto', with: 'Novo Texto'
          click_on 'Salvar'
        end
      }.to change { Recado.count }.by 1

      within 'h3.card-title.clearfix' do
        expect(page).to have_content 'Recados'
      end

      expect(page).to have_toastr 'success'
      expect(page).to have_content 'Novo Título'
      expect(page).to have_content 'Novo Texto'
    end

    it 'should reject a invalid one' do
      expect {
        within 'form#new_recado' do
          fill_in 'recado_titulo', with: ''
          fill_in 'recado_texto', with: ''
          click_on 'Salvar'
        end
      }.not_to change { Recado.count }

      within 'div.card-header' do
        expect(page).to have_content 'NovoRecado'
      end

      expect(page).to have_toastr 'error'
      expect(page).to have_selector 'form#new_recado div#error_explanation'
    end
  end

  context 'when editing' do
    let!(:recado) { FactoryGirl.create(:recado) }
    before do
      visit painel_recados_path
      find(:xpath, "//a[@href='#{edit_painel_recado_path(recado)}']").click
    end

    it 'should accept a valid one' do
      within "form#edit_recado_#{recado.id}" do
        fill_in 'recado_texto', with: 'Texto Atualizado'
        click_on 'Salvar'
      end

      within 'h3.card-title.clearfix' do
        expect(page).to have_content 'Recados'
      end

      expect(page).to have_toastr 'success'
      expect(page).to have_content 'Texto Atualizado'
    end

    it 'should reject a invalid one' do
      within "form#edit_recado_#{recado.id}" do
        fill_in 'recado_titulo', with: ''
        click_on 'Salvar'
      end

      within 'div.card-header' do
        expect(page).to have_content 'EditandoRecado'
      end

      expect(page).to have_toastr 'error'
      expect(page).to have_selector "form#edit_recado_#{recado.id} div#error_explanation"
    end
  end

  context 'when deleting', js: true do
    before :all do
      @recado = FactoryGirl.create(:recado)
    end

    before do
      login @user
      visit painel_recados_path
      find(:xpath, "//a[@href='#{edit_painel_recado_path(@recado)}']").click
    end

    it 'should show alert' do
      expect {
        within "form#edit_recado_#{@recado.id}" do
          click_on 'Excluir'
        end

        alert = page.driver.browser.switch_to.alert
        alert.accept
      }.to change { Recado.count }.by 0

      within 'h3.card-title.clearfix' do
        expect(page).to have_content 'Recados'
      end

      expect(page).to have_toastr 'success'
      expect(page).not_to have_content @recado.texto
    end
  end

end
