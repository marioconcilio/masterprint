class Estoque::CortadoPapeisController < ApplicationController

  # GET /estoque/cortado_papeis
  def index
    @search = CortadoPapel.ransack(params[:q])
    @products = @search.result
    respond_to :html, :js
  end

  # POST /estoque/cortado_papeis
  def create
    @papel = CortadoPapel.new(papel_params)
    if @papel.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_cortado_papeis_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/cortado_papeis/new
  def new
    @papel = CortadoPapel.new
    respond_to :js
  end

  # GET /estoque/cortado_papeis/:id/movimento
  def movimento
    @papel = CortadoPapel.find(params[:id])
    respond_to :js
  end

  # GET /estoque/cortado_papel/:id/edit
  def edit
    @papel = CortadoPapel.find(params[:id])
    respond_to :js
  end

  # PUT /estoque/cortado_papel/:id
  def update
    @papel = CortadoPapel.find(params[:id])

    # update qtde if movimento
    if params[:mov]
      amount = params[:cortado_papel][:amount].to_i
      qtde = params[:cortado_papel][:qtde].to_i

      if params[:mov] == 'entrada'
        qtde += amount
      elsif params[:mov] == 'saida'
        qtde -= amount
      end

      params[:cortado_papel][:qtde] = qtde.to_s
    end

    if @papel.update_attributes(papel_params)
      flash[:success] = 'Papel atualizado'
      redirect_to estoque_cortado_papeis_url
    else
      respond_to do |format|
        format.js { render :edit }
      end
    end
  end

  private
    def papel_params
      if params[:cortado_papel][:preco]
        params[:cortado_papel][:preco].gsub!('.', '')
        params[:cortado_papel][:preco].gsub!(',', '.')
      end

      params.require(:cortado_papel).permit(:nome, :preco, :qtde, :moeda, :un)
    end

end
