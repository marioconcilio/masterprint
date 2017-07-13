class Financeiro::ChequesController < ApplicationController
  before_action :auth_user!

  # GET /financeiro/cheques
  def index
    @search = Cheque.left_joins(:cliente).ransack(params[:q])
    @cheques = @search.result.includes(:cliente).page(params[:page])

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
    @cheque = Cheque.find(params[:id])
    @deposito = Deposito.find(@cheque.deposito_id) if @cheque.deposito_id
    respond_to :js
  end

  private
    def cheque_params
      params[:cheque][:valor].gsub!('.', '')
      params[:cheque][:valor].gsub!(',', '.')
      params.require(:cheque).permit!
    end

end
