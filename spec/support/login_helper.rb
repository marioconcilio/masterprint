module LoginHelper

  def login(user)
    visit root_path
    within 'ul.nav.navbar-nav.ml-auto' do
      click_on 'Entrar'
    end

    wait_for_ajax

    within 'form#form-login' do
      fill_in 'session_user', with: user.usuario
      fill_in 'session_password', with: user.password
      click_button 'Entrar'
    end

    wait_for_ajax
  end

  def stub_login(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

end
