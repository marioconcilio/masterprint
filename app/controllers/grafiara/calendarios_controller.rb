module Grafiara
  class CalendariosController < ApplicationController

    # GET /grafiara/calendarios
    def index
      @search = Calendario.ransack(params[:q])
      @calendarios = @search.result.page(params[:page])
      respond_to :html, :js
    end

    # POST /grafiara/calendarios
    def create
      @calendario = Calendario.new(calendarios_params)
      if @calendario.save
        flash[:success] = 'Calendário adicionado'
        redirect_to grafiara_calendarios_url
      else
        respond_to do |format|
          format.js { render :new }
        end
      end
    end

    # GET /grafiara/calendarios/new
    def new
      @calendario = Calendario.new
    end

    # GET /grafiara/calendarios/:id/edit
    def edit
      @calendario = Calendario.find(params[:id])
    end

    # PUT /grafiara/calendarios/:id
    def update
      @calendario = Calendario.find(params[:id])
      if @calendario.update_attributes(calendarios_params)
        flash[:success] = 'Calendário atualizado'
        redirect_to grafiara_calendarios_url
      else
        respond_to do |format|
          format.js { render 'edit' }
        end
      end
    end

    # DELETE /grafiara/calendario/:id
    def destroy
      Calendario.find(params[:id]).destroy
      flash[:success] = 'Calendário removido'
      redirect_to grafiara_calendarios_url
    end

    private
      def calendarios_params
        params[:grafiara_calendario][:pagina] = nil if params[:grafiara_calendario][:pagina].blank?
        params[:grafiara_calendario][:preco].gsub!('.', '')
        params[:grafiara_calendario][:preco].gsub!(',', '.')
        params.require(:grafiara_calendario).permit!
      end

  end
end
