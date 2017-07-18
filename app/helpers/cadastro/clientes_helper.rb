module Cadastro::ClientesHelper

  def total_aberto(id)
    ActiveRecord::Base.connection.execute("select recebimentos_aberto(#{id})").getvalue(0,0)
  end

  def total_vencido(id)
    ActiveRecord::Base.connection.execute("select recebimentos_vencido(#{id})").getvalue(0,0)
  end

  def total_cartorio(id)
    ActiveRecord::Base.connection.execute("select recebimentos_cartorio(#{id})").getvalue(0,0)
  end

  def total_protestado(id)
    ActiveRecord::Base.connection.execute("select recebimentos_protesto(#{id})").getvalue(0,0)
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

  def receber_chart
    column_chart receber_chart_cadastro_cliente_path(@cliente), library: {
      yAxis: {
        labels: {
          format: 'R$ {value:,.0f}'
        }
      },
      tooltip: {
        pointFormat: 'Total: <b>{point.y}</b>',
        valueDecimals: 2,
        valuePrefix: 'R$ '
      }
    }
  end

end
