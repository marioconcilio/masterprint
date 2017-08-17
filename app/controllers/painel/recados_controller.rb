class Painel::RecadosController < ApplicationController
  before_action :auth_user!

  # GET /painel/recados
  def index
    @recados = Recado.includes(:remetente).all
  end

  # POST /painel/recados
  def create
    @recado = Recado.new(recados_params)
    if @recado.save
      flash[:success] = 'Recado criado'
      redirect_to painel_recados_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /painel/recados/new
  def new
    @recado = Recado.new
    respond_to :js
  end

  private
    def recados_params
      params[:recado][:remetente_id] = current_user.id
      params[:recado][:destinatario_id] = current_user.id
      params.require(:recado).permit!
    end

end
