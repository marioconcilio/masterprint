class SessionsController < ApplicationController

  # GET /login
  def new
    session[:return_to] ||= request.referer
    respond_to :js
  end

  # POST /login
  def create
    user = Usuario.find_by(usuario: params[:session][:user].downcase)
    if user.try(:authenticate, params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to last_visited
    else
      flash[:error] = 'Usuário/senha inválidos'
      redirect_to last_visited
    end
  end

  # DELETE /logout
  def destroy
    session[:return_to] ||= request.referer
    log_out if logged_in?
    redirect_to root_url
  end

end
