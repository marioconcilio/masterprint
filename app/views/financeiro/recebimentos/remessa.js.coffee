$('.modal .modal-content').html '<%= j(render "form_file") %>'
$('.modal .modal-title strong').html 'Remessa'

formAction = $('.modal .modal-content form')[0]
formAction.action = '/financeiro/recebimentos/remessa'

$('.modal').modal()

$(':file').filestyle
  buttonText: 'Escolher Arquivo'
  buttonName: 'btn-primary'
  buttonBefore: false
  icon: false
