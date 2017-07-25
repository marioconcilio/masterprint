class Estoque::EnvelopesController < ApplicationController

  # GET /estoque/envelopes
  def index
    @search = Envelope.ransack(params[:q])
    if params[:tipo]
      @products = @search.result.tipo(params[:tipo])
    else
      @products = @search.result
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

  private
    def envelope_params
      params[:envelope][:preco_milheiro].gsub!('.', '')
      params[:envelope][:preco_milheiro].gsub!(',', '.')
      params.require(:envelope).permit(:larg, :comp, :grs, :nome, :tipo, :preco_milheiro, :qtde, :moeda, :un)
    end

end
