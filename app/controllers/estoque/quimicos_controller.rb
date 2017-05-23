class Estoque::QuimicosController < ApplicationController

  # GET /estoque/quimicos
  def index
    @search = Quimico.ransack(params[:q])
    @products = @search.result

    respond_to do |format|
      format.html
      format.js { render 'estoque/index' }
    end
  end

end
