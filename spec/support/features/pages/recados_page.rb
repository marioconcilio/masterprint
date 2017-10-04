module Page
  class RecadosPage
    include Capybara::DSL

    attr_reader :recado

    def initialize(recado=nil)
      @recado = recado
    end

    def visit_page
      visit painel_recados_path
    end

    def all_cards
      all('#rec-cardsview .card-columns .card')
    end

    def all_danger_cards
      all('#rec-cardsview .card-columns .card-danger')
    end

    def all_success_cards
      all('#rec-cardsview .card-columns .card-success')
    end

    def search_for(q)
      within search_form do
        fill_in 'q_titulo_cont', with: q
        find('i.fa.fa-search').click
      end
    end

    def click_on_edit
      edit_button.click
    end

    def click_on_delete
      within form do
        click_on 'Excluir'
      end
    end

    def fill_in_form(title, text)
      within form do
        fill_in 'recado_titulo', with: title
        fill_in 'recado_texto', with: text
        click_on 'Salvar'
      end
    end

    def explaining_error?
      form.has_selector? 'div#error_explanation'
    end

    def at_index?
      index_header.has_content? 'Recados'
    end

    def at_new_recado?
      new_header.has_content? 'NovoRecado'
    end

    def at_editing_recado?
      edit_header.has_content? 'EditandoRecado'
    end

    private
      def painel_recados_path
        '/painel/recados'
      end

      def edit_painel_recado_path
        "/painel/recados/#{@recado.id}/edit"
      end

      def form
        if (@recado)
          find("form#edit_recado_#{@recado.id}")
        else
          find('form#new_recado')
        end
      end

      def search_form
        find('form#recado_search')
      end

      def index_header
        find('h3.card-title.clearfix')
      end

      def new_header
        find('div.card-header')
      end

      def edit_header
        find('div.card-header')
      end

      def edit_button
        find(:xpath, "//a[@href='#{edit_painel_recado_path}']")
      end

  end
end
