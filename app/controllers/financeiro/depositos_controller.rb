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
        flash[:success] = 'Depósito adicionado'
        redirect_to financeiro_depositos_url
      else
        render :new
      end
    end

    # GET /financeiro/depositos/new
    def new
      @deposito = Deposito.new
      @cheques = read_cache
      # clear_cache
    end

    # GET /financeiro/depositos/ch
    def search
      if params[:search] && params[:search].size > 0
        @result = Cheque.search(params[:search])

        if @result.size == 1
          write_to_cache(@result.first)
        else
          render :choose
        end
      end

      @cheques = read_cache
      respond_to :js
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
      render :search
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

      def cheque_params
        params.require(:ch).permit!
      end

  end
end
