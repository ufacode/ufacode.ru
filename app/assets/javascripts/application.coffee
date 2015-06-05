#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require markitup
#= require markitup/sets/html/set
#= require_tree ./plugins/
#= require_tree ./classes/
#= require turbolinks
#= require simple/clean-blog
#= require_tree .

class @App
  constructor: ->
    @notification = new Notification

  run: ->
    @setup_ajax()

  setup_ajax: ->
#    $.ajaxSetup
#      data:
#        authenticity_token: authenticity_token

  @ready: ->
    unless window.app?
      window.app = new App
      window.app.run()

$(document).ready(App.ready)
