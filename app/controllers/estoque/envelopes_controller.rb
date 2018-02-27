class Estoque::EnvelopesController < ApplicationController

  # GET /estoque/envelopes
  def index
    @search = Envelope.ransack(params[:q])
    @search_field = :nome_or_larg_or_comp_cont
    @z = { page: params[:page] }
    @z[:q] = params[:q][@search_field] if params[:q]

    if params[:tipo]
      @z[:s] = params[:tipo]

      @products = @search.result
        .tipo(params[:tipo])
        .page(params[:page])
    else
      @products = @search.result
        .page(params[:page])
    end

    respond_to :html, :js
  end

  # POST /estoque/envelopes
  def create
    @envelope = Envelope.new(envelope_params)
    if @envelope.save
      flash[:success] = 'Envelope adicionado'
      redirect_to estoque_envelopes_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /estoque/envelopes/new
  def new
    @envelope = Envelope.new
    respond_to :js
  end

  # GET /estoque/envelopes/:id/edit
  def edit
    @envelope = Envelope.find(params[:id])
    respond_to :js
  end

  # GET /estoque/envelopes/prices
  def prices
    respond_to :js
  end

  # POST /estoque/envelopes/prices
  def update_prices
    rate = params[:rate].to_f / 100 + 1

    begin
      Envelope.update_all "preco_milheiro = preco_milheiro * #{rate}"
      flash[:success] = 'Preços alterados'

    rescue StandardError
      flash[:error] = 'Erro ao alterar os preços'
    end

    redirect_to estoque_envelopes_url
  end

  # PUT /estoque/envelopes/:id
  def update
    @envelope = Envelope.find(params[:id])
    if @envelope.update_attributes(envelope_params)
      flash[:success] = 'Envelope atualizado'
    else
      flash[:danger] = 'Erro ao atualizar envelope'
    end

    if params[:z]
      params[:z][:s] = nil if params[:z][:s].empty?
      redirect_to estoque_envelopes_path(page: params[:z][:page],
                                         tipo: params[:z][:s],
                                         q: { nome_or_larg_or_comp_cont: params[:z][:q] })
    else
      redirect_to estoque_envelopes_path
    end
  end

  private
    def envelope_params
      params[:envelope][:preco_milheiro].gsub!('.', '')
      params[:envelope][:preco_milheiro].gsub!(',', '.')
      params.require(:envelope).permit(:larg,
                                       :comp,
                                       :grs,
                                       :nome,
                                       :tipo,
                                       :preco_milheiro,
                                       :qtde,
                                       :moeda,
                                       :un)
    end

end
