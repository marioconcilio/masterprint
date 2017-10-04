require 'rails_helper'

RSpec.feature 'Updating Recado' do
  given!(:recado) { FactoryGirl.create(:recado) }
  given!(:recados_page) { Page::RecadosPage.new(recado) }

  before do
    mock_login_test_user
    recados_page.visit_page
    recados_page.click_on_edit
  end

  scenario 'user updates recado' do
    recados_page.fill_in_form 'Título Atualizado', 'Texto Atualizado'

    expect(recados_page).to be_at_index
    expect(page).to have_toastr 'success'
    expect(page).to have_content 'Título Atualizado'
    expect(page).to have_content 'Texto Atualizado'
  end

  scenario 'user tries to save invalid changes' do
    recados_page.fill_in_form '', ''

    expect(page).to have_toastr 'error'
    expect(recados_page).to be_at_editing_recado
    expect(recados_page).to be_explaining_error
  end
end
