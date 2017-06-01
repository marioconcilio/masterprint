class Financeiro::RecebimentosController < ApplicationController

  # GET /financeiro/recebimentos
  def index
    @search = Recebimento.joins(:cliente).ransack(params[:q])
    @bills = @search.result.includes(:cliente).page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

end
