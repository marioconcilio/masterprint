require 'rails_helper'

RSpec.describe Tiktak::CalendariosController, type: :controller do

  context 'logged user' do
    before do
      @user = mock_login_test_user
    end

    describe 'GET #index' do
      context 'show all entries' do
        let!(:list) { FactoryGirl.create_list(:tiktak_calendario, 20) } # for pagination

        before { get :index }
        include_examples 'index'

        it 'should match list' do
          expect(assigns(:calendarios)).to match_array(list)
        end
      end

      context 'search by referencia' do
        let!(:list) { FactoryGirl.create_list(:tiktak_calendario, 100) }
        let(:random) { list.sample }

        before do
          get :index, params: { q: { referencia_cont: random.referencia } }
        end

        include_examples 'index'
        it 'should find calendario' do
          assigns(:calendarios).each do |c|
            expect(c.referencia).to include(random.referencia)
          end
        end

      end
    end
    # GET index

    describe 'GET #new' do
      it 'assigns a new calendario' do
        get :new
        expect(assigns(:calendario)).not_to be_nil
      end
    end
    # GET #new

    describe 'GET #edit' do
      let(:calendario) { FactoryGirl.create(:tiktak_calendario) }
      before { get :edit, params: { id: calendario } }

      it 'assigns the requested calendario to @calendario' do
        expect(assigns(:calendario)).to eql(calendario)
      end

      include_examples 'edit'
    end
    # GET #edit

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:params) { { tiktak_calendario: FactoryGirl.attributes_for(:tiktak_calendario) } }

        it 'creates a new calendario' do
          expect {
            post :create, params: params
          }.to change(Tiktak::Calendario, :count).by(1)
        end

        it 'redirects to calendario#index' do
          post :create, params: params
          expect(response).to redirect_to(tiktak_calendarios_path)
        end

        it 'should set success flash' do
          post :create, params: params
          expect(controller).to set_flash[:success]
        end
      end

      context 'with invalid attributes' do
        let(:params) { { tiktak_calendario: FactoryGirl.attributes_for(:invalid_tiktak_calendario) } }

        it 'does not save the new calendario' do
          expect{
            post :create, params: params
          }.to_not change(Tiktak::Calendario, :count)
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
      let!(:calendario) { FactoryGirl.create(:tiktak_calendario) }
      let(:params) { { id: calendario, tiktak_calendario: calendario.attributes } }

      context 'with valid attributes' do
        it 'locates the requested @calendario' do
          patch :update, params: params
          expect(assigns(:calendario)).to eql(calendario)
        end

        it 'changes @calendario\'s attributes' do
          # to secure uniqueness, since referencia is generated randomly by FactoryGirl
          token = SecureRandom.uuid
          calendario.referencia = token

          patch :update, params: params
          calendario.reload
          expect(calendario.referencia).to eql(token)
        end

        it 'redirects to calendario#index' do
          patch :update, params: params
          expect(response).to redirect_to tiktak_calendarios_path
        end

        it 'should set success flash' do
          patch :update, params: params
          expect(controller).to set_flash[:success]
        end
      end

      context 'with invalid attributes' do
        let(:params) { { id: calendario, tiktak_calendario: FactoryGirl.attributes_for(:invalid_tiktak_calendario) } }

        it 'locates the requested @calendario' do
          patch :update, params: params
          expect(assigns(:calendario)).to eql(calendario)
        end

        it 'does not change @calendario\'s attributes' do
          # to secure uniqueness, since referencia is generated randomly by FactoryGirl
          token = SecureRandom.uuid
          calendario.referencia = token
          calendario.descricao = nil # invalid

          patch :update, params: { id: calendario, tiktak_calendario: calendario.attributes }
          calendario.reload
          expect(calendario.referencia).not_to eql(token)
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
      let!(:list) { FactoryGirl.create_list(:tiktak_calendario, 100) }
      let(:calendario) { list.sample }

      it 'deletes the calendario' do
        expect {
          delete :destroy, params: { id: calendario }
        }.to change(Tiktak::Calendario, :count).by(-1)
      end

      it 'redirects to calendario#index' do
        delete :destroy, params: { id: calendario }
        expect(response).to redirect_to tiktak_calendarios_path
      end

      it 'should set success flash' do
        delete :destroy, params: { id: calendario }
        expect(controller).to set_flash[:success]
      end
    end
    # DELETE #destroy

  end
  # context logged user

  context 'anonymous user' do
    let(:calendario) { FactoryGirl.create :tiktak_calendario }

    before do
      allow(controller).to receive(:current_user).and_return(nil)
    end

    describe 'GET #index' do
      before { get :index }
      include_examples 'index'
    end

    describe 'GET #new' do
      before { get :new }
      include_examples 'redirect_to 404'
    end

    describe 'GET #edit' do
      before { get :edit, params: {id: calendario} }
      include_examples 'redirect_to 404'
    end

    describe 'POST #create' do
      before { post :create }
      include_examples 'redirect_to 404'
    end

    describe 'PUT #update' do
      before { put :update, params: {id: calendario} }
      include_examples 'redirect_to 404'
    end

    describe 'DELETE #destroy' do
      before { delete :destroy, params: {id: calendario} }
      include_examples 'redirect_to 404'
    end
  end
  # context anon user

end
