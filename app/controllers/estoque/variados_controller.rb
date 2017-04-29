class Estoque::VariadosController < ApplicationController

  # GET /estoque/variados
  def index
    @variados = Variado.all
  end

end
