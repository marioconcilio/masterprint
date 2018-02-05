class Estoque::QuimicosController < ApplicationController

  # GET /estoque/quimicos
  def index
    @search = Quimico.ransack(params[:q])
    @search_field = :nome_or_marca_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]
    @products = @search.result.page(params[:page])

    respond_to :html, :js
  end

  # POST /estoque/quimicos
  def create
    @quimico = Quimico.new(quimico_params)
    if @quimico.save
      flash[:success] = 'Químico adicionado'
      redirect_to estoque_quimicos_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/quimicos/new
  def new
    @quimico = Quimico.new
    respond_to :js
  end

  # GET /estoque/quimicos/:id/edit
  def edit
    @quimico = Quimico.find(params[:id])
    respond_to :js
  end

  # PUT /estoque/quimicos/:id
  def update
    @quimico = Quimico.find(params[:id])
    if @quimico.update_attributes(quimico_params)
      flash[:success] = 'Quimico atualizado'
    else
      flash[:danger] = 'Erro ao atualizar quimico'
    end

    params[:z][:s] = nil if params[:z][:s].empty?
    redirect_to estoque_quimicos_path(page: params[:z][:page],
                                       tipo: params[:z][:s],
                                       q: { nome_or_marca_cont: params[:z][:q] })
  end

  private
    def quimico_params
      params[:quimico][:preco].gsub!('.', '')
      params[:quimico][:preco].gsub!(',', '.')
      params.require(:quimico).permit(:nome, :marca, :preco, :qtde, :moeda, :un)
    end

end
