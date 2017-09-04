module Grafiara
  class CasamentosController < ApplicationController

    # GET /grafiara/casamentos
    def index
      @search = Casamento.ransack(params[:q])
      @casamentos = @search.result.page(params[:page])
      respond_to :html, :js
    end

    # POST /grafiara/casamentos
    def create
      @casamento = Casamento.new(casamentos_params)
      if @casamento.save
        flash[:success] = 'Convite adicionado'
        redirect_to grafiara_casamentos_url
      else
        respond_to do |format|
          format.js { render :new }
        end
      end
    end

    # GET /grafiara/casamentos/new
    def new
      @casamento = Casamento.new
    end

    # GET /grafiara/casamentos/:id/edit
    def edit
      @casamento = Casamento.find(params[:id])
    end

    # PUT /grafiara/casamentos/:id
    def update
      @casamento = Casamento.find(params[:id])
      if @casamento.update_attributes(casamentos_params)
        flash[:success] = 'Convite atualizado'
        redirect_to grafiara_casamentos_url
      else
        respond_to do |format|
          format.js { render 'edit' }
        end
      end
    end

    # DELETE /grafiara/casamento/:id
    def destroy
      Casamento.find(params[:id]).destroy
      flash[:success] = 'Convite removido'
      redirect_to grafiara_casamentos_url
    end

    private
      def casamentos_params
        params[:grafiara_casamento][:pagina] = nil if params[:grafiara_casamento][:pagina].blank?
        params[:grafiara_casamento][:preco].gsub!('.', '')
        params[:grafiara_casamento][:preco].gsub!(',', '.')
        params.require(:grafiara_casamento).permit!
      end

  end
end
