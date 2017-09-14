module Grafiara
  class LutosController < ApplicationController

    # GET /grafiara/lutos
    def index
      @search = Luto.ransack(params[:q])
      @lutos = @search.result.page(params[:page])
      respond_to :html, :js
    end

    # POST /grafiara/lutos
    def create
      @luto = Luto.new(lutos_params)
      if @luto.save
        flash[:success] = 'Estampa adicionada'
        redirect_to grafiara_lutos_url
      else
        respond_to do |format|
          format.js { render :new }
        end
      end
    end

    # GET /grafiara/lutos/new
    def new
      @luto = Luto.new
      respond_to :js
    end

    # GET /grafiara/lutos/:id/edit
    def edit
      @luto = Luto.find(params[:id])
      respond_to :js
    end

    # PUT /grafiara/lutos/:id
    def update
      @luto = Luto.find(params[:id])
      if @luto.update_attributes(lutos_params)
        flash[:success] = 'Estampa atualizada'
        redirect_to grafiara_lutos_url
      else
        respond_to do |format|
          format.js { render :edit }
        end
      end
    end

    private
      def lutos_params
        params[:grafiara_luto][:preco].gsub!('.', '')
        params[:grafiara_luto][:preco].gsub!(',', '.')
        params.require(:grafiara_luto).permit!
      end

  end
end
