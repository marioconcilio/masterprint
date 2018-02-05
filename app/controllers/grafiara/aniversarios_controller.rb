module Grafiara
  class AniversariosController < ApplicationController

    # GET /grafiara/aniversarios
    def index
      @search = Aniversario.ransack(params[:q])
      @search_field = :codigo_cont
      @z = { page: params[:page] }
      @z[:q] = params[:q][@search_field] if params[:q]
      @aniversarios = @search.result.page(params[:page])

      respond_to :html, :js
    end

    # POST /grafiara/aniversarios
    def create
      @aniversario = Aniversario.new(aniversarios_params)
      if @aniversario.save
        flash[:success] = 'Convite adicionado'
        redirect_to grafiara_aniversarios_url
      else
        respond_to do |format|
          format.js { render :new }
        end
      end
    end

    # GET /grafiara/aniversarios/new
    def new
      @aniversario = Aniversario.new
      respond_to :js
    end

    # GET /grafiara/aniversarios/:id/edit
    def edit
      @aniversario = Aniversario.find(params[:id])
      respond_to :js
    end

    # PUT /grafiara/aniversarios/:id
    def update
      @aniversario = Aniversario.find(params[:id])
      if @aniversario.update_attributes(aniversarios_params)
        flash[:success] = 'Convite atualizado'
      else
        flash[:danger] = 'Erro ao atualizar convite'
      end

      params[:z][:s] = nil if params[:z][:s].empty?
      redirect_to grafiara_aniversarios_path(page: params[:z][:page],
                                             tipo: params[:z][:s],
                                             q: { codigo_cont: params[:z][:q] })
    end

    private
      def aniversarios_params
        params[:grafiara_aniversario][:pagina] = nil if params[:grafiara_aniversario][:pagina].blank?
        params[:grafiara_aniversario][:preco].gsub!('.', '')
        params[:grafiara_aniversario][:preco].gsub!(',', '.')
        params.require(:grafiara_aniversario).permit!
      end

  end
end
