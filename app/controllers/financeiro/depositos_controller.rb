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
        all_updated = read_cache.map { |ch| Cheque.find(ch['id']) }
          .map { |ch| ch.update_attribute(:deposito_id, @deposito.id) }
          .reduce(:&)

        if all_updated
          flash[:success] = 'Depósito adicionado'
          clear_cache
          redirect_to financeiro_depositos_url and return
        else
          @error_message = 'Não foi possível atualizar cheque'
          clear_cache
          Deposito.delete(@deposito.id)
        end
      end

      @cheques = read_cache
      render :new
      # redirect_to new_financeiro_deposito_url
    end

    # GET /financeiro/depositos/new
    def new
      @deposito = Deposito.new
      @cheques = read_cache
    end

    # GET /financeiro/depositos/ch
    def search
      unless params[:ch_search].try(:empty?)
        @result = Cheque.search(params[:ch_search])

        case @result.size
        when 0
        when 1
          write_to_cache(@result.first)
        else
          render :choose and return
        end
      end

      @cheques = read_cache
      render :cheques
    end

    # POST /financeiro/depositos/ch
    def add
      ch = Cheque.new(cheque_params.to_h)
      write_to_cache(ch)
      redirect_to new_financeiro_deposito_path
    end

    # DELETE /financeiro/depositos/ch/:id
    def remove
      remove_from_cache(params[:id])
      @cheques = read_cache
      render :cheques
    end

    private
      def deposito_params
        params.require(:deposito).permit!
      end

      def cheque_params
        params.require(:ch).permit!
      end

  end
end
