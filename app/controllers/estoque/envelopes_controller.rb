class Estoque::EnvelopesController < ApplicationController

  # GET /estoque/envelopes
  def index
    @search = Envelope.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

  # POST /estoque/envelopes
  def create
    @envelope = Envelope.new(envelope_params)
    if @envelope.save
      flash[:success] = 'Produto adicionado'
      redirect_to estoque_envelopes_url
    else
      respond_to do |format|
        format.js { render 'estoque/new' }
      end
    end
  end

  # GET /estoque/envelopes/new
  def new
    @envelope = Envelope.new

    respond_to do |format|
      format.js { render 'estoque/new' }
    end
  end

  private
    def envelope_params
      params[:envelope][:preco_milheiro].gsub!('.', '')
      params[:envelope][:preco_milheiro].gsub!(',', '.')
      params.require(:envelope).permit(:larg, :comp, :grs, :nome, :tipo, :preco_milheiro, :qtde, :moeda, :un)
    end

end
