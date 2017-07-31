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
    # cliente
    @cliente = Cliente.find(params[:id])

    # recebimentos
    @q = Recebimento.includes(:cliente)
      .where("cliente_id = #{@cliente.id}
        AND status NOT ILIKE 'pago'")
      .ransack(params[:q], search_key: :q)

    if params[:rcb_status]
      @bills = @q.result
        .s(params[:rcb_status])
        .page(params[:page])
        .per(10)
    else
      @bills = @q.result
        .page(params[:page])
        .per(10)
    end

    # cheques
    @s = Cheque.includes(:cliente)
      .where("cliente_id = #{@cliente.id}
        AND status NOT ILIKE 'pago'
        AND status NOT ILIKE 'depositado'")
      .ransack(params[:s], search_key: :s)

    if params[:chq_status]
      @cheques = @s.result
        .s(params[:chq_status])
        .page(params[:page])
        .per(10)
    else
      @cheques = @s.result
        .page(params[:page])
        .per(10)
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

  # GET /cadastro/clientes/receber_chart
  def receber_chart
    render json: {
      'Em Aberto'   => helpers.total_aberto(params[:id]),
      'Vencido'     => helpers.total_vencido(params[:id]),
      'Em Cartório' => helpers.total_cartorio(params[:id]),
      'Protestado'  => helpers.total_protestado(params[:id])
    }
  end

  # GET /cadastro/clientes/cheques_chart
  def cheques_chart
    render json: {
      'Em Aberto' => helpers.cheques_aberto(params[:id]),
      'Devolvido' => helpers.cheques_devolvido(params[:id]),
    }
  end

  private
    def cliente_params
      params[:cliente][:cep].gsub!(/\D/, '') if params[:cliente][:cep]
      params[:cliente][:id].gsub!(/\D/, '') if params[:cliente][:id]
      params[:cliente][:ie].gsub!(/\D/, '') if params[:cliente][:ie]
      params.require(:cliente).permit!
    end

end
