class Estoque::EnvelopesController < ApplicationController

  # GET /estoque/envelopes
  def index
    @envelopes = Envelope.all
  end

end
