class Cadastro::FornecedoresController < ApplicationController
  before_action :auth_user!

  # GET /cadastro/fornecedores
  def index
    @search = Fornecedor.ransack(params[:q])
    @fornecedores = @search.result.page(params[:page])

    respond_to :html, :js
  end

  # POST /cadastro/fornecedores
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    if @fornecedor.save
      flash[:success] = 'Fornecedor adicionado'
      redirect_to cadastro_fornecedores_url
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  # GET /cadastro/fornecedores/new
  def new
    @fornecedor = Fornecedor.new
    respond_to :js
  end

  private
    def fornecedor_params
      params[:cliente][:cep].gsub!(/\D/, '') if params[:cliente][:cep]
      params[:cliente][:id].gsub!(/\D/, '') if params[:cliente][:id]
      params[:cliente][:ie].gsub!(/\D/, '') if params[:cliente][:ie]
      params.require(:cliente).permit!
    end

end
