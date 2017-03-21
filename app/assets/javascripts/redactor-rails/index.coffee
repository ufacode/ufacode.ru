window.init_redactor = ->
  csrf_token = $('meta[name=csrf-token]').attr('content')
  csrf_param = $('meta[name=csrf-param]').attr('content')
  params = undefined
  if csrf_param != undefined and csrf_token != undefined
    params = csrf_param + '=' + encodeURIComponent(csrf_token)
  $('.redactor').redactor
    buttons: [
      'html'
      'formatting'
      'bold'
      'italic'
      'deleted'
      'unorderedlist'
      'orderedlist'
      'outdent'
      'indent'
      'image'
      'link'
      'alignment'
      'horizontalrule'
    ]
    buttonSource: true
    visual: true
    buttonsHide: []
    minHeight: 150
    'imageUpload': '/redactor_rails/pictures?' + params
    'imageGetJson': '/redactor_rails/pictures'
    'fileUpload': '/redactor_rails/documents?' + params
    'fileGetJson': '/redactor_rails/documents'
    'path': '/assets/redactor-rails'
    'css': 'style.css'

$(document).on 'turbolinks:load', window.init_redactor
