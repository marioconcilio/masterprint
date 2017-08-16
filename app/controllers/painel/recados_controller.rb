class Painel::RecadosController < ApplicationController
  before_action :auth_user!

  # GET /painel/recados
  def index
    @recados = Recado.all
  end

end
