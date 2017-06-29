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

      url = session[:return_to] || root_url
      session[:return_to] = nil
      url = root_url if url.eql?('/logout')
      redirect_to url
    else
      @error = 'Usuário/senha inválidos'
      respond_to do |format|
        format.js { render :new }
      end
    end
  end

  # DELETE /logout
  def destroy
    log_out
    redirect_to root_url
  end

end
