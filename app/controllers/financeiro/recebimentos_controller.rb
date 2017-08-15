module Financeiro
  class RecebimentosController < ApplicationController
    include RecebimentosHelper
    before_action :auth_user!
    before_action :auth_admin!, except: [:index, :show]

    # GET /financeiro/recebimentos
    def index
      @search = Recebimento.joins(:cliente).ransack(params[:q])
      if params[:rcb_status]
        @bills = @search.result
          .includes(:cliente)
          .s(params[:rcb_status])
          .page(params[:page])
      else
        @bills = @search.result
          .includes(:cliente)
          .page(params[:page])
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
      list = process_remessa(params[:recebimento][:import_file].tempfile)

      begin
        Recebimento.transaction { list.each(&:save!) }
        flash[:success] = "#{list.count} #{'boleto'.pluralize(list.count)} #{'importado'.pluralize(list.count)}"
        redirect_back fallback_location: financeiro_recebimentos_path

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
      list = process_retorno(params[:recebimento][:import_file].tempfile)

      begin
        list.each do |num, sit|
          rec = Recebimento.find(num)
          next if rec.baixado? || rec.protestado? || rec.titulo_maos? || rec.pago?

          status = status_from_sit(sit)
          rec.update(status: status) if status
        end

        # write hash to cache for summary action
        write_to_cache(list)
        flash[:success] = 'Retorno importado!'
        redirect_to summary_financeiro_recebimentos_path

      rescue ActiveRecord::RecordNotFound
        @error = 'Boleto não encontrado'
        respond_to do |format|
          format.js { render :remessa }
        end
      end
    end

    # GET /financeiro/recebimentos/summary
    def summary
      @list = read_cache

      # if cache is not empty
      unless @list.nil?
        @bills = @list.map { |num, sit| Recebimento.find(num) }
        clear_cache
      else
        @message = 'Você deve importar um arquivo de retorno primeiro.'
        render 'shared/custom_message'
      end
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
        flash[:success] = "Boleto atualizado → #{Recebimento.status[params[:recebimento][:status]]}"
      else
        flash[:danger] = "Erro ao atualizar boleto → #{Recebimento.status[params[:recebimento][:status]]}"
      end

      redirect_to financeiro_recebimentos_path
    end

      private
        def recebimento_params
          params.require(:recebimento).permit!
        end

  end
end
