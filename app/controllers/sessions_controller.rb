class SessionsController < ApplicationController

  def new
  end

  def create
    user = Usuario.find_by(usuario: params[:session][:user].downcase)
    if user.try(:authenticate, params[:session][:password])
      log_in user
      redirect_to estoque_blanquetas_path
    else
      flash.now[:danger] = 'Usuário/senha inválidos'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
