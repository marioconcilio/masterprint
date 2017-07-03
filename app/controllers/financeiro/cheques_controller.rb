class Financeiro::ChequesController < ApplicationController

  # GET /financeiro/cheques
  def index
    if logged_in?
      @search = Cheque.left_joins(:cliente).ransack(params[:q])
      @cheques = @search.result.includes(:cliente).page(params[:page])

      respond_to :html, :js
    else
      redirect_to forbidden_url
    end
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

  private
    def cheque_params
      params[:cheque][:valor].gsub!('.', '')
      params[:cheque][:valor].gsub!(',', '.')
      params.require(:cheque).permit(:banco,
                                     :numero,
                                     :emitente,
                                     :valor,
                                     :data_deposito,
                                     :cliente_id)
    end

end
