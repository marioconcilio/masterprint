module Financeiro
  class DepositosController < ApplicationController
    include DepositosHelper

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

      if @deposito.save
        # update cheques.deposito_id
        all_updated = dpo_read_cache.map { |ch| Cheque.find(ch['id']) }
          .map do |ch|
            ch.depositado!
            ch.update(deposito_id: @deposito.id, status: :depositado)
          end
          .reduce(:&)

        if all_updated
          flash[:success] = 'Depósito adicionado'
          dpo_flush_cache
          redirect_to financeiro_depositos_url and return
        else
          flash[:danger] = 'Não foi possível criar depósito'
          dpo_flush_cache
          Deposito.delete(@deposito.id)
          redirect_to new_financeiro_deposito_url and return
        end
      end

      @cheques = dpo_read_cache
      redirect_to new_financeiro_deposito_url
    end

    # GET /financeiro/depositos/new
    def new
      @deposito = Deposito.new
      @cheques = dpo_get_total
    end

    # GET /financeiro/depositos/ch
    def search
      unless params[:ch_search].try(:empty?)
        @result = Cheque.search(params[:ch_search])

        case @result.size
        when 0
        when 1
          dpo_add_entry(@result.first)
        else
          render :choose and return
        end
      end

      @cheques = dpo_read_cache
      render :cheques
    end

    # POST /financeiro/depositos/ch
    def add
      ch = Cheque.new(cheque_params.to_h)
      dpo_add_entry(ch)
      @cheques = dpo_read_cache
      render :cheques
    end

    # DELETE /financeiro/depositos/ch/:id
    def remove
      dpo_remove_entry(params[:id])
      @cheques = dpo_read_cache
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

  end
end
