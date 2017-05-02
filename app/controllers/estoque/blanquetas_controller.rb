class Estoque::BlanquetasController < ApplicationController
  before_action :clear_search_index

  # GET /estoque/blanquetas
  def index
    @search = Blanqueta.joins(:blanqueta_lona).ransack(params[:q])
    @products = @search.result.includes(:blanqueta_lona)
  end

end