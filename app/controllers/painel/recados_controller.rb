class Painel::RecadosController < ApplicationController
  before_action :auth_user!

  # GET /painel/recados
  def index
    @search = Recado.where(['(destinatario_id = :id  OR remetente_id = :id OR destinatario_id IS NULL)
                              AND (
                                (done = false)
                                OR
                                (done = true AND updated_at > :date))',
                              { id: current_user.id, date: Date.today.beginning_of_week }])
                    .includes(:remetente)
                    .ransack(params[:q])
    @recados = @search.result
    respond_to :html, :js
  end

  # POST /painel/recados
  def create
    @recado = Recado.new(recados_params)
    if @recado.save
      flash[:success] = 'Recado criado'
      redirect_to painel_recados_url
    else
      flash[:error] = 'Recado não criado'
      render :new
    end
  end

  # GET /painel/recados/new
  def new
    @recado = Recado.new
  end

  # GET /painel/recados/:id/edit
  def edit
    @recado = Recado.find(params[:id])
  end

  # PUT /painel/recados/:id
  def update
    @recado = Recado.find(params[:id])
    if @recado.update_attributes(recados_params)
      flash[:success] = 'Recado atualizado'
      redirect_to painel_recados_url
    else
      flash[:error] = 'Recado não atualizado'
      render :edit
    end
  end

  # DELETE /painel/recado/:id
  def destroy
    Recado.find(params[:id]).destroy
    flash[:success] = 'Recado removido'
    redirect_to painel_recados_url
  end

  private
    def recados_params
      params[:recado][:remetente_id] = current_user.id
      params.require(:recado).permit!
    end

end
