class Estoque::QuimicosController < ApplicationController

  # GET /estoque/quimicos
  def index
    @search = Quimico.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /estoque/quimicos
  def create
    @quimico = Quimico.new(quimico_params)
    if @quimico.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_quimicos_url
    else
      respond_to :js
    end
  end

  # GET /estoque/quimicos/new
  def new
    @quimico = Quimico.new
    respond_to :js
  end

  private
    def quimico_params
      params[:quimico][:preco].gsub!('.', '')
      params[:quimico][:preco].gsub!(',', '.')
      params.require(:quimico).permit(:nome, :marca, :preco, :qtde, :moeda, :un)
    end

end
