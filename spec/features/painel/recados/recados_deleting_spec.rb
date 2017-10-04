require 'rails_helper'

RSpec.feature 'Deleting Recado', js: true do
  before :all do
    @user = FactoryGirl.create(:usuario_teste)
    @recado = FactoryGirl.create(:recado)
    @recados_page = Page::RecadosPage.new(@recado)
  end

  before do
    login @user
    @recados_page.visit_page
    @recados_page.click_on_edit
  end

  after :all do
    @user.destroy
    @recado.destroy
  end

  scenario 'user deletes a recado' do
    expect {
      @recados_page.click_on_delete
      alert = page.driver.browser.switch_to.alert
      alert.accept
    }.to change { Recado.count }.by 0

    expect(@recados_page).to be_at_index
    expect(page).to have_toastr 'success'
    expect(page).not_to have_content @recado.texto
  end
end
