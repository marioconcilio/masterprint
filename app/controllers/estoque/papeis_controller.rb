 class Estoque::PapeisController < ApplicationController

  # GET /estoque/papeis
  def index
    @search = Papel.joins(:papel_tipo).ransack(params[:q])
    if params[:tipo]
      @products = @search.result.includes(:papel_tipo).tipo(params[:tipo])
    else
      @products = @search.result.includes(:papel_tipo)
    end

    @logged_in = logged_in?
    respond_to :html, :js
  end

  # POST /estoque/papeis
  def create
    @papel = Papel.new(papel_params)
    if @papel.save
      flash[:success] = 'Papel adicionado'
      redirect_to estoque_papeis_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/papeis/new
  def new
    @papel = Papel.new
    respond_to :js
  end

  # GET /estoque/papeis/:id/movimento
  def movimento
    @papel = Papel.includes(:papel_tipo).find(params[:id])
    respond_to :js
  end

  # PUT /estoque/papel/:id
  def update
    @papel = Papel.includes(:papel_tipo).find(params[:id])

    # update qtde if movimento
    if params[:mov]
      amount = params[:papel][:amount].to_i
      qtde = params[:papel][:qtde].to_i

      if params[:mov] == 'entrada'
        qtde += amount
      elsif params[:mov] == 'saida'
        qtde -= amount
      end

      params[:papel][:qtde] = qtde.to_s
    end

    if @papel.update_attributes(papel_params)
      flash[:success] = 'Papel atualizado'
      redirect_to estoque_papeis_url
    else
      respond_to do |format|
        format.js { render 'movimento' }
      end
    end
  end

  private
    def papel_params
      params[:papel][:peso].gsub!(',', '.') if params[:papel][:peso]
      params.require(:papel).permit(:id,
                                    :papel_tipo_id,
                                    :subtipo,
                                    :grs,
                                    :larg,
                                    :comp,
                                    :fls,
                                    :peso,
                                    :marca,
                                    :qtde)
    end

end
