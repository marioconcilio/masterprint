class Estoque::ChapasController < ApplicationController

  # GET /estoque/chapas
  def index
    @search = Chapa.joins(:chapa_marca).ransack(params[:q])
    @products = @search.result.includes(:chapa_marca)

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

end
