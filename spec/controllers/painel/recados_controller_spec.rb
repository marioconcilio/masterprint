require 'rails_helper'

RSpec.describe Painel::RecadosController, type: :controller do

  context 'logged user' do
    before :all do
      @user = Usuario.create!(id: 0, nome: 'Test User', usuario: 'test', password: 'test123')
    end

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    describe 'GET #index' do
      context 'only show from/to current_user, to all and recently done' do
        let!(:list) do
          # recado from anon to current user
          anon_to_current = FactoryGirl.create(:recado, destinatario: @user)

          # recado from anon to everyone
          anon_to_all = FactoryGirl.create(:recado)

          # recado from anon to anon
          anon_to_anon = FactoryGirl.create(:recado, destinatario: FactoryGirl.create(:usuario))

          # recado from current user to everyone
          current_to_all = FactoryGirl.create(:recado, remetente: @user)

          # recado from current user to anon
          current_to_anon = FactoryGirl.create(:recado, remetente: @user, destinatario: FactoryGirl.create(:usuario))

          # recado done from last week
          recado_old = FactoryGirl.create(:recado_done_old)

          # recado done within current week
          recado_recent = FactoryGirl.create(:recado_done_recent)

          list = [anon_to_current, anon_to_all, current_to_all, current_to_anon, recado_recent]
        end

        before { get :index }

        include_examples 'index'
        it 'should match list' do
          expect(assigns(:recados)).to match_array(list)
        end
      end

      context 'search by titulo' do
        let(:list) { create_list(:recado, 10) }
        let(:random) { list.sample }

        before do
          get :index, params: { q: { titulo_cont: random.titulo } }
        end

        include_examples 'index'
        it 'should find recado' do
          assigns(:recados).each do |r|
            expect(r.titulo).to include(random.titulo)
          end
        end
      end
    end
    # GET #index

    describe 'GET #new' do
      it 'assigns a new recado' do
        get :new
        expect(assigns(:recado)).not_to be_nil
      end
    end
    # GET #new

    describe 'GET #edit' do
      let(:recado) { FactoryGirl.create(:recado) }
      before { get :edit, params: { id: recado } }

      it 'assigns the requested recado to @recado' do
        expect(assigns(:recado)).to eql(recado)
      end

      include_examples 'edit'
    end
    # GET #edit

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:params) { { recado: FactoryGirl.attributes_for(:recado, remetente_id: 0) } }

        it 'creates a new recado' do
          expect {
            post :create, params: params
          }.to change(Recado, :count).by(1)
        end

        it 'redirects to recados#index' do
          post :create, params: params
          expect(response).to redirect_to(painel_recados_path)
        end

        it 'should set success flash' do
          post :create, params: params
          expect(controller).to set_flash[:success]
        end
      end

      context 'with invalid attributes' do
        let(:params) { { recado: FactoryGirl.attributes_for(:invalid_recado, remetente_id: 0) } }

        it 'does not save the new contact' do
          expect{
            post :create, params: params
          }.to_not change(Recado, :count)
        end

        it 're-renders the new action' do
          post :create, params: params
          expect(response).to render_template :new
        end

        it 'should set error flash' do
          post :create, params: params
          expect(controller).to set_flash[:error]
        end
      end
    end
    # POST #create

    describe 'PATCH #update' do
      let!(:recado) { FactoryGirl.create(:recado) }
      let(:params) { { id: recado, recado: recado.attributes } }

      context 'with valid attributes' do
        it 'locates the requested @recado' do
          patch :update, params: params
          expect(assigns(:recado)).to eql(recado)
        end

        it 'changes @recado\'s attributes' do
          # to secure uniqueness, since titulo is generated randomly by FactoryGirl
          token = SecureRandom.uuid
          recado.titulo = token

          patch :update, params: params
          recado.reload
          expect(recado.titulo).to eql(token)
        end

        it 'redirects to recados#index' do
          patch :update, params: params
          expect(response).to redirect_to painel_recados_path
        end

        it 'should set success flash' do
          patch :update, params: params
          expect(controller).to set_flash[:success]
        end
      end

      context 'with invalid attributes' do
        let(:params) { { id: recado, recado: FactoryGirl.attributes_for(:invalid_recado, remetente_id: 0) } }

        it 'locates the requested @recado' do
          patch :update, params: params
          expect(assigns(:recado)).to eql(recado)
        end

        it 'does not change @recado\'s attributes' do
          # to secure uniqueness, since titulo is generated randomly by FactoryGirl
          token = SecureRandom.uuid
          recado.titulo = token
          recado.texto = nil # invalid

          patch :update, params: { id: recado, recado: recado.attributes }
          recado.reload
          expect(recado.titulo).not_to eql(token)
        end

        it 're-renders the edit method' do
          patch :update, params: params
          expect(response).to render_template :edit
        end

        it 'should set error flash' do
          patch :update, params: params
          expect(controller).to set_flash[:error]
        end
      end
    end
    # PATCH #update

    describe 'DELETE #destroy' do
      let!(:list) { create_list(:recado, 10) }
      let!(:recado) { list.sample }

      it 'deletes the recado' do
        expect {
          delete :destroy, params: { id: recado }
        }.to change(Recado, :count).by(-1)
      end

      it 'redirects to recados#index' do
        delete :destroy, params: { id: recado }
        expect(response).to redirect_to painel_recados_path
      end

      it 'should set success flash' do
        delete :destroy, params: { id: recado }
        expect(controller).to set_flash[:success]
      end
    end
    # DELETE #destroy

  end
  # context logged user

  context 'anonymous user' do
    let(:recado) { FactoryGirl.create(:recado) }

    before do
      allow(controller).to receive(:current_user).and_return(nil)
    end

    describe 'GET #index' do
      before { get :index }
      include_examples 'redirect_to 404'
    end

    describe 'GET #new' do
      before { get :new }
      include_examples 'redirect_to 404'
    end

    describe 'GET #edit' do
      before { get :edit, params: {id: recado} }
      include_examples 'redirect_to 404'
    end

    describe 'POST #create' do
      before { post :create }
      include_examples 'redirect_to 404'
    end

    describe 'PUT #update' do
      before { put :update, params: {id: recado} }
      include_examples 'redirect_to 404'
    end

    describe 'DELETE #destroy' do
      before { delete :destroy, params: {id: recado} }
      include_examples 'redirect_to 404'
    end
  end
  # context anonynous user

end
