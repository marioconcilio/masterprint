modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "form_file") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Importar Retorno</h3>'

formAction = $('.modal .modal-content form')[0]
formAction.action = '/financeiro/recebimentos/retorno'

modal = $('.modal')
modal.modal()

$(':file').filestyle
  buttonText: 'Escolher Arquivo'
  buttonName: 'btn-primary'
  buttonBefore: true
  icon: false
