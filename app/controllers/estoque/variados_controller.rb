class Estoque::VariadosController < ApplicationController

  # GET /estoque/variados
  def index
    @search = Variado.ransack(params[:q])
    @search_field = :nome_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]
    @products = @search.result.page(params[:page])

    respond_to :html, :js
  end

  # POST /estoque/variados
  def create
    @variado = Variado.new(variado_params)
    if @variado.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_variados_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/variados/new
  def new
    @variado = Variado.new
    respond_to :js
  end

  # GET /estoque/variados/:id/edit
  def edit
    @variado = Variado.find(params[:id])
    respond_to :js
  end

  # PUT /estoque/variados/:id
  def update
    @variado = Variado.find(params[:id])
    if @variado.update_attributes(variado_params)
      flash[:success] = 'Produto atualizado'
    else
      flash[:danger] = 'Erro ao atualizar produto'
    end

    if params[:z]
      redirect_to estoque_variados_path(page: params[:z][:page],
                                        q: { nome_cont: params[:z][:q] })
    else
      redirect_to estoque_variados_path
    end
  end

  private
    def variado_params
      params[:variado][:preco].gsub!('.', '')
      params[:variado][:preco].gsub!(',', '.')
      params.require(:variado).permit(:nome, :preco, :qtde, :moeda, :un)
    end

end
