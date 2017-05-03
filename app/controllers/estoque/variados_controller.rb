class Estoque::VariadosController < ApplicationController

  # GET /estoque/variados
  def index
    @search = Variado.ransack(params[:q])
    @products = @search.result
  end

end
