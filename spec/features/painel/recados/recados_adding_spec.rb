require 'rails_helper'

RSpec.feature 'Adding new Recado' do
  given!(:recados_page) { Page::RecadosPage.new }

  before do
    mock_login_test_user
    recados_page.visit_page
    click_on 'Novo Recado'
  end

  scenario 'user creates a new valid one' do
    expect {
      recados_page.fill_in_form 'Novo Título', 'Novo Texto'
    }.to change { Recado.count }.by 1

    expect(recados_page).to be_at_index
    expect(page).to have_toastr 'success'
    expect(page).to have_content 'Novo Título'
    expect(page).to have_content 'Novo Texto'
  end

  scenario 'user tries to create an invalid one' do
    expect {
      recados_page.fill_in_form '', ''
    }.not_to change { Recado.count }

    expect(page).to have_toastr 'error'
    expect(recados_page).to be_at_new_recado
    expect(recados_page).to be_explaining_error
  end
end
