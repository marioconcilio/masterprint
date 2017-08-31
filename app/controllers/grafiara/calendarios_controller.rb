module Grafiara
  class CalendariosController < ApplicationController

    # GET /grafiara/calendarios
    def index
      @search = Calendario.ransack(params[:q])
      @calendarios = @search.result
      respond_to :html, :js
    end

    # GET /grafiara/calendarios/:id/edit
    def edit
      @calendario = Calendario.find(params[:id])
      respond_to :js
    end

  end
end
