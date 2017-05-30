class Estoque::BlanquetasController < ApplicationController

  # GET /estoque/blanquetas
  def index
    @search = Blanqueta.joins(:blanqueta_lona).ransack(params[:q])
    @products = @search.result.includes(:blanqueta_lona)

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

  # POST /estoque/blanquetas
  def create
    @blanqueta = Blanqueta.new(blanqueta_params)
    if @blanqueta.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_blanquetas_url
    else
      respond_to do |format|
        format.js { render 'estoque/new' }
      end
    end
  end

  # GET /estoque/blanquetas/new
  def new
    @blanqueta = Blanqueta.new

    respond_to do |format|
      format.js { render 'estoque/new' }
    end
  end

  private
    def blanqueta_params
      params.require(:blanqueta).permit(:larg, :comp, :nome, :blanqueta_lona_id, :qtde, :moeda)
    end

end
