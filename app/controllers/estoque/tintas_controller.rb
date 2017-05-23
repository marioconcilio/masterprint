class Estoque::TintasController < ApplicationController

  # GET /estoque/tintas
  def index
    @search = Tinta.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

end
