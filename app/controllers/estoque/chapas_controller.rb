class Estoque::ChapasController < ApplicationController

  # GET /estoque/chapas
  def index
    @search = Chapa.joins(:chapa_marca).ransack(params[:q])
    @products = @search.result.includes(:chapa_marca)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /estoque/chapas
  def create
    @chapa = Chapa.new(chapa_params)
    if @chapa.save
      flash[:success] = 'Chapa adicionada'
      redirect_to estoque_chapas_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/chapas/new
  def new
    @chapa = Chapa.new
    respond_to :js
  end

  # GET /estoque/chapas/:id/edit
  def edit
    @chapa = Chapa.find(params[:id])
    respond_to :js
  end

  # PUT /estoque/chapas/:id
  def update
    @chapa = Chapa.find(params[:id])
    if @chapa.update_attributes(chapa_params)
      flash[:success] = 'Chapa atualizada'
      redirect_to estoque_chapas_url
    else
      respond_to do |format|
        format.js { render :edit }
      end
    end
  end

  private
    def chapa_params
      params.require(:chapa).permit(:larg, :comp, :chapa_marca_id, :qtde, :moeda)
    end

end
