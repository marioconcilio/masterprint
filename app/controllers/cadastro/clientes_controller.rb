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

  # POST /cadastro/clientes
  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      flash[:success] = 'Cliente adicionado'
      redirect_to cadastro_clientes_url
    else
      render 'new'
    end
  end

  # GET /cadastro/clientes/new
  def new
    @cliente = Cliente.new
    @show_cnpj = true
    respond_to :js
  end

  # GET /cadastro/clientes/:id/edit
  def edit
    @cliente = Cliente.find(params[:id])
    @show_cnpj = false
    respond_to :js
  end

  # GET /cadastro/clientes/:id
  def show
    @cliente = Cliente.find(params[:id])
  end

  # PUT /cadastro/cliente/:id
  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(cliente_params)
      flash[:success] = 'Cliente atualizado'
      redirect_to cadastro_cliente_url
    else
      render 'edit'
    end
  end

  # DELETE /cadastro/cliente/:id
  def destroy
    Cliente.find(params[:id]).destroy
    flash[:success] = 'Cliente removido'
    redirect_to cadastro_clientes_url
  end

  private
    def cliente_params
      params[:cliente][:cep].gsub!(/\D/, '') if params[:cliente][:cep]
      params[:cliente][:id].gsub!(/\D/, '') if params[:cliente][:id]
      params.require(:cliente).permit(:id, :nome, :email, :endereco, :cidade, :uf, :cep)
    end

end
