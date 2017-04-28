class TintasController < ApplicationController

  # GET /tintas
  def index
    @tintas = Tinta.all
  end

end
