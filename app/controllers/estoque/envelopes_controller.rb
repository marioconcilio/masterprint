class Estoque::EnvelopesController < ApplicationController

  # GET /estoque/envelopes
  def index
    @search = Envelope.ransack(params[:q])
    @products = @search.result
  end

end
