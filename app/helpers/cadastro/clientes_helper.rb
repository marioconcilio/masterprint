module Cadastro::ClientesHelper

  def total_aberto(id)
    res = ActiveRecord::Base.connection.execute("select recebimentos_aberto(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def total_vencido(id)
    res = ActiveRecord::Base.connection.execute("select recebimentos_vencido(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def total_cartorio(id)
    res = ActiveRecord::Base.connection.execute("select recebimentos_cartorio(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def total_protestado(id)
    res = ActiveRecord::Base.connection.execute("select recebimentos_protesto(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def cheques_aberto(id)
    res = ActiveRecord::Base.connection.execute("select cheques_aberto(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def cheques_devolvido(id)
    res = ActiveRecord::Base.connection.execute("select cheques_devolvido(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def cheques_depositado(id)
    res = ActiveRecord::Base.connection.execute("select cheques_depositado(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
  end

  def cheques_pago(id)
    res = ActiveRecord::Base.connection.execute("select cheques_pago(#{id})")
    res.getvalue(0, 0).nil? ? 0 : res.getvalue(0, 0).to_f
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
    pie_chart receber_chart_cadastro_cliente_path(@cliente), donut: true,
      library: {
        colors: ['#36A2EB', '#FFCE56', '#FF6384', '#b00'],
        chart: {
          backgroundColor: 'rgba(0, 0, 0, 0)',
        },
        plotOptions: {
          pie: {
            borderColor: '#4dbd74',
            borderWidth: 2,
            connectNulls: true,
            dataLabels: {
              color: '#FFF',
              connectorWidth: 2,
              style: {
                textOutline: 0,
              },
            },
          },
        },
        tooltip: {
          pointFormat: 'Total: <b>{point.y}</b>',
          valueDecimals: 2,
          valuePrefix: 'R$ ',
        },
      }
  end

  def cheques_chart
    pie_chart cheques_chart_cadastro_cliente_path(@cliente), donut: false,
      library: {
        colors: ['#36A2EB', '#FFCE56'],
        chart: {
          backgroundColor: 'rgba(0, 0, 0, 0)',
        },
        plotOptions: {
          pie: {
            borderColor: '#63c2de',
            borderWidth: 2,
            connectNulls: true,
            dataLabels: {
              color: '#FFF',
              connectorWidth: 2,
              style: {
                textOutline: 0,
              },
            },
          },
        },
        tooltip: {
          pointFormat: 'Total: <b>{point.y}</b>',
          valueDecimals: 2,
          valuePrefix: 'R$ ',
        },
      }
  end

end
