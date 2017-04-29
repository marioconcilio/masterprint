class Estoque::QuimicosController < ApplicationController

  # GET /estoque/quimicos
  def index
    @quimicos = Quimico.all
  end

end
