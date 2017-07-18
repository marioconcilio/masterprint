module Cadastro::ClientesHelper

  def total_aberto(cliente)
    ActiveRecord::Base.connection.execute("select recebimentos_aberto(#{cliente.id})").getvalue(0,0)
  end

  def total_vencido(cliente)
    ActiveRecord::Base.connection.execute("select recebimentos_vencido(#{cliente.id})").getvalue(0,0)
  end

  def total_cartorio(cliente)
    ActiveRecord::Base.connection.execute("select recebimentos_cartorio(#{cliente.id})").getvalue(0,0)
  end

  def total_protestado(cliente)
    ActiveRecord::Base.connection.execute("select recebimentos_protesto(#{cliente.id})").getvalue(0,0)
  end

  def active_tabpane?(tab)
    params[:tab] = 'dados' unless params[:tab]

    if params[:tab] == tab
      'tab-pane active fade in'
    else
      'tab-pane fade in'
    end
  end

  def active_tab?(tab)
    params[:tab] = 'dados' unless params[:tab]

    if params[:tab] == tab
      'active'
    end
  end

end
