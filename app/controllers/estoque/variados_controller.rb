class Estoque::VariadosController < ApplicationController

  # GET /estoque/variados
  def index
    @search = Variado.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

  # POST /estoque/variados
  def create
    @variado = Variado.new(variado_params)
    if @variado.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_variados_url
    else
      respond_to do |format|
        format.js { render 'estoque/new' }
      end
    end
  end

  # GET /estoque/variados/new
  def new
    @variado = Variado.new

    respond_to do |format|
      format.js { render 'estoque/new' }
    end
  end

  private
    def variado_params
      params[:variado][:preco].gsub!('.', '')
      params[:variado][:preco].gsub!(',', '.')
      params.require(:variado).permit(:nome, :preco, :qtde, :moeda, :un)
    end

end
