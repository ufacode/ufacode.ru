#= require jquery
#= require jquery.turbolinks
#= require bootstrap-sprockets
#= require jquery_ujs
#= require turbolinks
#= require nprogress
#= require nprogress-turbolinks
#= require redactor-rails/redactor.min
#= require ./redactor-rails/index
#= require_tree ./plugins/
#= require_tree ./classes/
#= require simple/clean-blog
#= require_tree .

class @App
  constructor: ->
    @notification = new Notification
    @comments     = new Comments

  run: ->
    @setup_ajax()

  setup_ajax: ->
#    $.ajaxSetup
#      data:
#        authenticity_token: authenticity_token

  @always: ->


  @ready: ->
    App.always()
    unless window.app?
      window.app = new App
      window.app.run()

$(document).on 'tubolinks:load', App.ready
