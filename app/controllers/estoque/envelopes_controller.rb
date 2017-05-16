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

end
