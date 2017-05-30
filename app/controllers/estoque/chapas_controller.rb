class Estoque::ChapasController < ApplicationController

  # GET /estoque/chapas
  def index
    @search = Chapa.joins(:chapa_marca).ransack(params[:q])
    @products = @search.result.includes(:chapa_marca)

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

  # POST /estoque/chapas
  def create
    @chapa = Chapa.new(chapa_params)
    if @chapa.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_chapas_url
    else
      respond_to do |format|
        format.js { render 'estoque/new' }
      end
    end
  end

  # GET /estoque/chapas/new
  def new
    @chapa = Chapa.new

    respond_to do |format|
      format.js { render 'estoque/new' }
    end
  end

  private
    def chapa_params
      params.require(:chapa).permit(:larg, :comp, :chapa_marca_id, :qtde, :moeda)
    end

end
