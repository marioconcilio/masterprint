class Cadastro::ClientesController < ApplicationController

  # GET /cadastro/clientes
  def index
    if logged_in?
      @search = Cliente.ransack(params[:q])
      @clientes = @search.result.page(params[:page])
    else
      redirect_to login_path
    end
  end

  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      #format.json { render json: @cliente }
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

end
