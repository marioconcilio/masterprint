class Estoque::QuimicosController < ApplicationController

  # GET /estoque/quimicos
  def index
    @search = Quimico.ransack(params[:q])
    @products = @search.result
  end

end
