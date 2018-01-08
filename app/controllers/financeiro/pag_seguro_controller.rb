module Financeiro
  class PagSeguroController < ApplicationController
    before_action :auth_admin!

    # GET /financeiro/cartoes
    def index
      @search = PagSeguro.where(['(is_ok is false)
                                  OR (is_ok is true AND data > :date)', date: Date.today.beginning_of_week]).ransack(params[:q])
      @cards = @search.result.page(params[:page])
      @search_field = :valor_bruto_cont
      @z = { page: params[:page] }
      @z[:q] = params[:q][@search_field] if params[:q]

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

      count = 0
      list.each do |c|
        begin
          c.save
          count += 1

        rescue ActiveRecord::RecordNotUnique
        end
      end

      if count > 0
        flash[:success] = "#{count} #{'entrada'.pluralize(count)} #{'importada'.pluralize(count)}"
      else
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

      redirect_to financeiro_cartoes_path(page: params[:z][:page], q: { valor_bruto_cont: params[:z][:q] })
    end

  end
end
