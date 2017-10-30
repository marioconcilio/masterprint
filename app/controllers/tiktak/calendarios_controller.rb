module Tiktak
  class CalendariosController < ApplicationController
    before_action :auth_user!, except: :index

    # GET /tiktak/calendarios
    def index
      @search = Calendario.ransack(params[:q])
      if params[:cal_tipo]
        @calendarios = @search.result.t(params[:cal_tipo]).page(params[:page])
      else
        @calendarios = @search.result.page(params[:page])
      end

      respond_to :html, :js
    end

    # POST /tiktak/calendarios
    def create
      @calendario = Calendario.new(calendarios_params)
      if @calendario.save
        flash[:success] = 'Calendário adicionado'
        redirect_to tiktak_calendarios_url
      else
        flash[:error] = 'Calendário não adicionado'
        render :new
      end
    end

    # GET /tiktak/calendarios/new
    def new
      @calendario = Calendario.new
    end

    # GET /tiktak/calendarios/:id/edit
    def edit
      @calendario = Calendario.find(params[:id])
    end

    # PUT /tiktak/calendarios/:id
    def update
      @calendario = Calendario.find(params[:id])
      if @calendario.update_attributes(calendarios_params)
        flash[:success] = 'Calendário atualizado'
        redirect_to tiktak_calendarios_url
      else
        flash[:error] = 'Calendário não atualizado'
        render 'edit'
      end
    end

    # DELETE /tiktak/calendario/:id
    def destroy
      Calendario.find(params[:id]).destroy
      flash[:success] = 'Calendário removido'
      redirect_to tiktak_calendarios_url
    end

    private
      def calendarios_params
        params[:tiktak_calendario][:preco].gsub!('.', '')
        params[:tiktak_calendario][:preco].gsub!(',', '.')
        params.require(:tiktak_calendario).permit!
      end

  end
end
