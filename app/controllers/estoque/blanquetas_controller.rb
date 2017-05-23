class Estoque::BlanquetasController < ApplicationController

  # GET /estoque/blanquetas
  def index
    @search = Blanqueta.joins(:blanqueta_lona).ransack(params[:q])
    @products = @search.result.includes(:blanqueta_lona)

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

end
