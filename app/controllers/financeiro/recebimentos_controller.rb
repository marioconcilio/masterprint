module Financeiro
  class RecebimentosController < ApplicationController
    include RecebimentosHelper
    before_action :auth_user!

    # GET /financeiro/recebimentos
    def index
      @search = Recebimento.joins(:cliente).ransack(params[:q])
      if params[:status]
        @bills = @search.result.includes(:cliente).status(params[:status]).page(params[:page])
      else
        @bills = @search.result.includes(:cliente).page(params[:page])
      end

      respond_to :html, :js
    end

    # GET /financeiro/recebimentos/remessa
    def remessa
      @recebimento = Recebimento.new
      respond_to :js
    end

    # POST /financeiro/recebimentos/remessa
    def import_remessa
      @recebimento = Recebimento.new
      list = process_remessa(params[:recebimento][:import_file].tempfile)

      begin
        Recebimento.transaction { list.each(&:save!) }
        flash[:success] = 'Remessa importada'
        redirect_to financeiro_recebimentos_url

      rescue ActiveRecord::RecordNotUnique
        @error = 'Remessa já processada'
        respond_to do |format|
          format.js { render :remessa }
        end
      end
    end

    # GET /financeiro/recebimentos/retorno
    def retorno
      @recebimento = Recebimento.new
      respond_to :js
    end

    # POST /financeiro/recebimentos/retorno
    def import_retorno
      @recebimento = Recebimento.new
      puts 'retorno processado'
    end

    # GET /financeiro/recebimentos/:id
    def show
      @recebimento = Recebimento.find(params[:id])
      respond_to :js
    end

    # PATCH /financeiro/recebimentos/:id
    def update
      @recebimento = Recebimento.find(params[:id])
      if @recebimento.update_attributes(recebimento_params)
        flash[:success] = "Boleto atualizado → #{params[:recebimento][:status]}"
      else
        flash[:danger] = "Erro ao atualizar boleto → #{params[:recebimento][:status]}"
      end

      redirect_to financeiro_recebimentos_path
    end

      private
        def recebimento_params
          params.require(:recebimento).permit!
        end

  end
end
