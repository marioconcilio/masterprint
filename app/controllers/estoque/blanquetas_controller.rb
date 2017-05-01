class Estoque::BlanquetasController < ApplicationController

  # GET /estoque/blanquetas
  def index
    @blanquetas = Blanqueta.search(params[:search])
  end

end
