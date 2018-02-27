class Estoque::BlanquetasController < ApplicationController

  # GET /estoque/blanquetas
  def index
    @search = Blanqueta.joins(:blanqueta_lona).ransack(params[:q])
    @search_field = :nome_or_larg_or_comp_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]
    @products = @search.result.includes(:blanqueta_lona).page(params[:page])

    respond_to :html, :js
  end

  # POST /estoque/blanquetas
  def create
    @blanqueta = Blanqueta.new(blanqueta_params)
    if @blanqueta.save
      flash[:success] = 'Blanqueta adicionada'
      redirect_to estoque_blanquetas_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/blanquetas/new
  def new
    @blanqueta = Blanqueta.new
    respond_to :js
  end

  # GET /estoque/blanquetas/:id/edit
  def edit
    @blanqueta = Blanqueta.find(params[:id])
    respond_to :js
  end

  # PUT /estoque/blanquetas/:id
  def update
    @blanqueta = Blanqueta.find(params[:id])
    if @blanqueta.update_attributes(blanqueta_params)
      flash[:success] = 'Blanqueta atualizada'
    else
      flash[:danger] = 'Erro ao atualizar blanqueta'
    end

    if params[:z]
      redirect_to estoque_blanquetas_path(page: params[:z][:page],
                                          q: { nome_or_larg_or_comp_cont: params[:z][:q] })
    else
      redirect_to estoque_blanquetas_path
    end
  end

  private
    def blanqueta_params
      params.require(:blanqueta).permit(:larg, :comp, :nome, :blanqueta_lona_id, :qtde, :moeda)
    end

end
