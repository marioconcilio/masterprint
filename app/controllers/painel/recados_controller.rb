class Painel::RecadosController < ApplicationController
  before_action :auth_user!

  # GET /painel/recados
  def index
    @recados = Recado.includes(:remetente).all
    respond_to :html, :js
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

  # GET /painel/recados/:id/edit
  def edit
    @recado = Recado.find(params[:id])
    respond_to :js
  end

  # PUT /painel/recados/:id
  def update
    @recado = Recado.find(params[:id])
    if @recado.update_attributes(recados_params)
      flash[:success] = 'Recado atualizado'
      redirect_to painel_recados_url
    else
      respond_to do |format|
        format.js { render 'edit' }
      end
    end
  end

  private
    def recados_params
      params[:recado][:remetente_id] = current_user.id
      params.require(:recado).permit!
    end

end
