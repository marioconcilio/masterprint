class Cadastro::ClientesController < ApplicationController
  before_action :auth_user!

  # GET /cadastro/clientes
  def index
    @search = Cliente.ransack(params[:q])
    @clientes = @search.result.page(params[:page])

    respond_to :html, :js
  end

  # POST /cadastro/clientes
  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      flash[:success] = 'Cliente adicionado'
      redirect_to cadastro_clientes_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /cadastro/clientes/new
  def new
    @cliente = Cliente.new
    respond_to :js
  end

  # GET /cadastro/clientes/:id/edit
  def edit
    @cliente = Cliente.find(params[:id])
    respond_to :js
  end

  # GET /cadastro/clientes/:id
  def show
    @cliente = Cliente.find(params[:id])
    @search = Recebimento.where(cliente: @cliente).ransack(params[:q])

    if params[:status]
      @bills = @search.result.status(params[:status]).page(params[:page]).per(20)
    else
      @bills = @search.result.page(params[:page]).per(20)
    end

    respond_to :html, :js
  end

  # PUT /cadastro/cliente/:id
  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(cliente_params)
      flash[:success] = 'Cliente atualizado'
      redirect_to cadastro_cliente_url
    else
      respond_to do |format|
        format.js { render 'edit' }
      end
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
      params[:cliente][:ie].gsub!(/\D/, '') if params[:cliente][:ie]
      params.require(:cliente).permit!
    end

end
