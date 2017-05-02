class Estoque::BlanquetasController < ApplicationController

  # GET /estoque/blanquetas
  def index
    @blanquetas = Blanqueta.joins(:blanqueta_lona).search(params[:search])
  end

end
