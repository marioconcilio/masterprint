class Grafiara::CalendariosController < ApplicationController

  # GET /grafiara/calendarios
  def index
    @search = Grafiara::Calendario.ransack(params[:q])
    @calendarios = @search.result
    respond_to :html, :js
  end

end
