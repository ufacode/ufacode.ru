#= require jquery
#= require jquery.turbolinks
#= require bootstrap-sprockets
#= require jquery_ujs
#= require turbolinks
#= require nprogress
#= require nprogress-turbolinks
#= require markitup
#= require markitup/sets/html/set
#= require_tree ./plugins/
#= require_tree ./classes/
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

  @always: ->
    $("textarea").markItUp(mySettings)


  @ready: ->
    App.always()
    unless window.app?
      window.app = new App
      window.app.run()

$(document).ready(App.ready)
