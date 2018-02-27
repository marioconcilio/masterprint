 class Estoque::PapeisController < ApplicationController

  # GET /estoque/papeis
  def index
    @search = Papel.joins(:papel_tipo).ransack(params[:q])
    @search_field = :papel_tipo_tipo_or_grs_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]

    if params[:tipo]
      @z[:s] = params[:tipo]

      @products = @search.result
        .includes(:papel_tipo)
        .tipo(params[:tipo])
        .page(params[:page])
    else
      @products = @search.result
        .includes(:papel_tipo)
        .page(params[:page])
    end

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

  # GET /estoque/papel/:id/edit
  def edit
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
    else
      flash[:danger] = 'Erro ao atualizar papel'
    end

    if params[:z]
      params[:z][:s] = nil if params[:z][:s].empty?
      redirect_to estoque_papeis_path(page: params[:z][:page],
                                      tipo: params[:z][:s],
                                      q: { papel_tipo_tipo_or_grs_cont: params[:z][:q] })
    else
      redirect_to estoque_papeis_path
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
