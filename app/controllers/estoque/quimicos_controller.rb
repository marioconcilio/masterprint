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
      redirect_to estoque_quimicos_url
    else
      respond_to do |format|
        format.js { render :edit }
      end
    end
  end

  private
    def quimico_params
      params[:quimico][:preco].gsub!('.', '')
      params[:quimico][:preco].gsub!(',', '.')
      params.require(:quimico).permit(:nome, :marca, :preco, :qtde, :moeda, :un)
    end

end
