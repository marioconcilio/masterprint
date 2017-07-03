class Financeiro::DepositosController < ApplicationController

  # GET /financeiro/depositos
  def index
    if logged_in?
      @search = Deposito.ransack(params[:q])
      @depositos = @search.result.page(params[:page])

      respond_to :html, :js
    else
      redirect_to forbidden_url
    end
  end

  # POST /financeiro/depositos
  def create
    @deposito = Deposito.new(deposito_params)
    if @deposito.save
      flash[:success] = 'Depósito adicionado'
      redirect_to financeiro_depositos_url
    else
      respond_to do |format|
        format.js { render :new }
      end
    end
  end

  # GET /financeiro/depositos/new
  def new
    @deposito = Deposito.new
  end

  private
    def deposito_params
      params[:deposito][:total].gsub!('.', '')
      params[:deposito][:total].gsub!(',', '.')
      params.require(:deposito).permit(:total,
                                       :banco,
                                       :agencia,
                                       :conta,
                                       :titular)
    end

end
