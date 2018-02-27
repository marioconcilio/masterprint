class Estoque::TintasController < ApplicationController

  # GET /estoque/tintas
  def index
    @search = Tinta.ransack(params[:q])
    @search_field = :nome_or_marca_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]
    @products = @search.result.page(params[:page])

    respond_to :html, :js
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

  # GET /estoque/tintas/:id/edit
  def edit
    @tinta = Tinta.find(params[:id])
    respond_to :js
  end

  # GET /estoque/tintas/prices
  def prices
    respond_to :js
  end

  # PUT /estoque/tintas/:id
  def update
    @tinta = Tinta.find(params[:id])
    if @tinta.update_attributes(tinta_params)
      flash[:success] = 'Tinta atualizada'
    else
      flash[:danger] = 'Erro ao atualizar tinta'
    end

    if params[:z]
      redirect_to estoque_tintas_path(page: params[:z][:page],
                                      q: { nome_or_marca_cont: params[:z][:q] })
    else
      redirect_to estoque_tintas_path
    end
  end

  private
    def tinta_params
      params[:tinta][:preco_kg].gsub!('.', '')
      params[:tinta][:preco_kg].gsub!(',', '.')
      params[:tinta][:un].gsub!(',', '.')
      params.require(:tinta).permit(:nome, :marca, :preco_kg, :qtde, :moeda, :un)
    end

end
