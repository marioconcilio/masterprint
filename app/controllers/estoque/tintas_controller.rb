class Estoque::TintasController < ApplicationController

  # GET /estoque/tintas
  def index
    @tintas = Tinta.all
  end

end
