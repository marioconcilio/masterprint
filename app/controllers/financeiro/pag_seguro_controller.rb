module Financeiro
  class PagSeguroController < ApplicationController
    before_action :auth_admin!

    # GET /financeiro/cartoes
    def index
      @search = PagSeguro.ransack(params[:q])
      @cards = @search.result.page(params[:page])
      respond_to :html, :js
    end

    # GET /financeiro/cartoes/import
    def import
      @card = PagSeguro.new
      respond_to :js
    end

    # POST /financeiro/cartoes/import
    def import_xml
      list = helpers.pagseguro_import(params[:financeiro_pag_seguro][:import_file].tempfile)

      begin
        PagSeguro.transaction { list.each(&:save!) }
        flash[:success] = "#{list.count} #{'entrada'.pluralize(list.count)} #{'importada'.pluralize(list.count)}"

      rescue ActiveRecord::RecordNotUnique
        flash[:error] = 'Arquivo já processado'
      end

      redirect_back fallback_location: financeiro_cartoes_path
    end

    # GET /financeiro/cartao/:id
    def show
      @card = PagSeguro.find(params[:id])
      respond_to :js
    end

    # PATCH /financeiro/cartao/:id
    def update
      @card = PagSeguro.find(params[:id])

      if @card.update(is_ok: true)
        flash[:success] = 'Pagamento conferido'
      else
        flash[:danger] = 'Erro ao atualizar pagamento'
      end

      redirect_to financeiro_cartoes_path
    end

  end
end
