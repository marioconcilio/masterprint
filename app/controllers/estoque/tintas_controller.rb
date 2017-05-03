class Estoque::TintasController < ApplicationController

  # GET /estoque/tintas
  def index
    @search = Tinta.ransack(params[:q])
    @products = @search.result
  end

end
