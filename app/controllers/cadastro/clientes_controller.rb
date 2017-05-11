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

  # GET /cadastro/clientes/:id
  def show
    @cliente = Cliente.find(params[:id])

    # respond_to do |format|
      # format.html # show.html.erb
      # format.js # show.js.erb
      # format.json { render json: @cliente }
    # end
  end

  # GET /cadastro/clientes/:id/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(cliente_params)
      flash[:success] = 'Cliente atualizado'
      render 'edit'
    else
      render 'edit'
    end
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      puts 'saved'
    else
      render 'new'
    end
  end

  private
    def cliente_params
      params.require(:cliente).permit(:nome)
    end

end
