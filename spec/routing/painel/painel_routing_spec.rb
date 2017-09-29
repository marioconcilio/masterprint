require 'rails_helper'

RSpec.describe 'routing to recados', type: :routing do

  it 'routes /painel/recados to painel/recados#index' do
    expect(get: '/painel/recados').to route_to(
      controller: 'painel/recados',
      action: 'index'
    )
  end

  it 'routes /painel/recados/new to painel/recados#new' do
    expect(get: '/painel/recados/new').to route_to(
      controller: 'painel/recados',
      action: 'new'
    )
  end

  it 'routes /painel/recados to painel/recados#create' do
    expect(post: '/painel/recados').to route_to(
      controller: 'painel/recados',
      action: 'create'
    )
  end

  it 'routes /painel/recados/1/edit to painel/recados#edit' do
    expect(get: '/painel/recados/1/edit').to route_to(
      controller: 'painel/recados',
      action: 'edit',
      id: '1'
    )
  end

  it 'routes /painel/recados/1 to painel/recados#update' do
    expect(patch: '/painel/recados/1').to route_to(
      controller: 'painel/recados',
      action: 'update',
      id: '1'
    )
  end

  it 'routes /painel/recados/1 to painel/recados#destroy' do
    expect(delete: '/painel/recados/1').to route_to(
      controller: 'painel/recados',
      action: 'destroy',
      id: '1'
    )
  end

  it 'does not routes to painel/recados#show' do
    expect(get: '/painel/recados/1').not_to be_routable
  end

end
