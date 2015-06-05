class @Notification
  constructor: ->
    toastr.options =
      "closeButton": false
      "debug": false
      "positionClass": "toast-bottom-right"
      "onclick": null
      "progressBar": true
      "showDuration": "300"
      "hideDuration": "1000"
      "timeOut": "5000"
      "extendedTimeOut": "1000"
      "showEasing": "swing"
      "hideEasing": "linear"
      "showMethod": "slideDown"
      "hideMethod": "slideUp"
