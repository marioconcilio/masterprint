class Cadastro::ClientesController < ApplicationController

  # GET /cadastro/clientes
  def index
    if logged_in?
      @search = Cliente.ransack(params[:q])
      @clientes = @search.result.page(params[:page])

      respond_to :html, :js
    else
      redirect_to '/404'
    end
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
    @search = Recebimento.where(cliente: @cliente).ransack(params[:q])

    @aberto = ActiveRecord::Base.connection.execute("select recebimentos_aberto(#{@cliente.id})").getvalue(0,0)
    @vencido = ActiveRecord::Base.connection.execute("select recebimentos_vencido(#{@cliente.id})").getvalue(0,0)
    @cartorio = ActiveRecord::Base.connection.execute("select recebimentos_cartorio(#{@cliente.id})").getvalue(0,0)
    @protesto = ActiveRecord::Base.connection.execute("select recebimentos_protesto(#{@cliente.id})").getvalue(0,0)

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
      params.require(:cliente).permit(:id, :nome, :email, :endereco, :cidade, :uf, :cep)
    end

end
