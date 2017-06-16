class SessionsController < ApplicationController

  def new
  end

  def create
    user = Usuario.find_by(usuario: params[:session][:user].downcase)
    if user.try(:authenticate, params[:session][:password])
      log_in user

      url = session[:return_to] || root_url
      session[:return_to] = nil
      url = root_url if url.eql?('/logout')
      redirect_to url
    else
      flash.now[:danger] = 'Usuário/senha inválidos'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
