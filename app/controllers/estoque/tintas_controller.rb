class Estoque::TintasController < ApplicationController

  # GET /estoque/tintas
  def index
    @search = Tinta.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /estoque/tintas
  def create
    @tinta = Tinta.new(tinta_params)
    if @tinta.save
      flash[:success] = 'Tinta adicionada'
      redirect_to estoque_tintas_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/tintas/new
  def new
    @tinta = Tinta.new
    respond_to :js
  end

  private
    def tinta_params
      params[:tinta][:preco_kg].gsub!('.', '')
      params[:tinta][:preco_kg].gsub!(',', '.')
      params[:tinta][:un].gsub!(',', '.')
      params.require(:tinta).permit(:nome, :marca, :preco_kg, :qtde, :moeda, :un)
    end

end
