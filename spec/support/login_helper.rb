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
    mock_login(user)
  end

  def logout(user)
    visit root_path
    within 'ul.nav.navbar-nav.ml-auto' do
      click_on user.nome
      click_on 'Sair'
    end
  end

  def mock_login(user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end

  def mock_logout
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(nil)
  end

  def login_test_user
    user = FactoryGirl.create(:usuario_teste)
    login user
    return user
  end

  def mock_login_test_user
    user = FactoryGirl.create(:usuario_teste)
    mock_login user
    return user
  end

end
