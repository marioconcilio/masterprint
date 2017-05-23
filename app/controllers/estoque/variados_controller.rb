class Estoque::VariadosController < ApplicationController

  # GET /estoque/variados
  def index
    @search = Variado.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

end
