class Financeiro::ChequesController < ApplicationController
  before_action :auth_user!
  before_action :auth_admin!, only: [:index, :update]

  # GET /financeiro/cheques
  def index
    @search = Cheque.left_joins(:cliente).ransack(params[:q])
    @search_field = :numero_text_or_emitente_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]

    if params[:chq_status]
      @z[:s] = params[:chq_status]

      @cheques = @search.result
        .includes(:cliente)
        .s(params[:chq_status])
        .page(params[:page])
    else
      @cheques = @search.result
        .includes(:cliente)
        .page(params[:page])
    end

    respond_to :html, :js
  end

  # POST /financeiro/cheques
  def create
    @cheque = Cheque.new(cheque_params)
    if @cheque.save
      flash[:success] = 'Cheque adicionado'
      redirect_to financeiro_cheques_url
    else
      respond_to do |format|
        format.js { render :new }
      end
    end
  end

  # GET /financeiro/cheques/new
  def new
    @cheque = Cheque.new
    respond_to :js
  end

  # GET /financeiro/cheques/:id
  def show
    @cheque = Cheque.left_joins(:deposito).find(params[:id])
    @deposito = @cheque.deposito
    respond_to :js
  end

  # PATCH /financeiro/cheques/:id
  def update
    @cheque = Cheque.find(params[:id])
    if @cheque.update_attribute(:status, params[:cheque][:status])
      flash[:success] = "Cheque atualizado → #{params[:cheque][:status]}"
    else
      flash[:danger] = "Erro ao atualizar cheque → #{params[:cheque][:status]}"
    end

    params[:z][:s] = nil if params[:z][:s].empty?
    redirect_to financeiro_cheques_path(page: params[:z][:page],
                                         tipo: params[:z][:s],
                                         q: { numero_text_or_emitente_cont: params[:z][:q] })
  end

  private
    def cheque_params
      if params[:cheque][:valor]
        params[:cheque][:valor].gsub!('.', '')
        params[:cheque][:valor].gsub!(',', '.')
      end

      params.require(:cheque).permit!
    end

end
