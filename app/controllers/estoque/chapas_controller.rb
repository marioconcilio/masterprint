class Estoque::ChapasController < ApplicationController

  # GET /estoque/chapas
  def index
    @chapas = Chapa.all
  end

end
