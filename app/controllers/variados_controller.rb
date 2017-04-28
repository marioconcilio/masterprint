class VariadosController < ApplicationController

  # GET /variados
  def index
    @variados = Variado.all
  end

end
