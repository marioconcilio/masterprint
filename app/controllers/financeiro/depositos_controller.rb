class Financeiro::DepositosController < ApplicationController
  before_action :auth_user!

  # GET /financeiro/depositos
  def index
    @search = Deposito.ransack(params[:q])
    @depositos = @search.result.page(params[:page])
    respond_to :html, :js
  end

  # POST /financeiro/depositos
  def create
    @deposito = Deposito.new(deposito_params)
    cache = DepositoCache.new(cache_name)

    if @deposito.save
      # update cheques.deposito_id
      all_updated = cache.read.map { |ch| Cheque.find(ch['id']) }
        .map do |ch|
          ch.depositado!
          ch.update(deposito_id: @deposito.id, status: :depositado)
        end
        .reduce(:&)

      cache.clear

      if all_updated
        flash[:success] = 'Depósito adicionado'
        redirect_to financeiro_depositos_url and return
      else
        flash[:danger] = 'Não foi possível criar depósito'
        Deposito.delete(@deposito.id)
        redirect_to new_financeiro_deposito_url and return
      end
    end

    @cheques = cache.read
    redirect_to new_financeiro_deposito_url
  end

  # GET /financeiro/depositos/new
  def new
    @deposito = Deposito.new
    cache = DepositoCache.new(cache_name)
    @cheques = cache.read
  end

  # GET /financeiro/depositos/ch
  def search
    cache = DepositoCache.new(cache_name)

    unless params[:ch_search].try(:empty?)
      @result = Cheque.search(params[:ch_search])

      case @result.size
      when 0
      when 1
        cache.write(@result.first)
      else
        render :choose and return
      end
    end

    @cheques = cache.read
    render :cheques
  end

  # POST /financeiro/depositos/ch
  def add
    cache = DepositoCache.new(cache_name)
    cache.write(Cheque.new(cheque_params.to_h))
    @cheques = cache.read
    render :cheques
  end

  # DELETE /financeiro/depositos/ch/:id
  def remove
    cache = DepositoCache.new(cache_name)
    cache.remove(params[:id].to_i)
    @cheques = cache.read
    render :cheques
  end

  # GET /financeiro/depositos/:id
  def show
    @deposito = Deposito.find(params[:id])
    @cheques = Cheque.where(deposito_id: @deposito.id)
    respond_to :js
  end

  private
    def deposito_params
      params.require(:deposito).permit!
    end

    def cheque_params
      params.require(:cheque).permit!
    end

    def cache_name
      "#{session[:user_id]}:deposito"
    end

end
