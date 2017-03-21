$(document).on 'turbolinks:load', ->
  $(document).on 'click', '.post-rate', ->
    $rate_element = $(@)
    $.ajax
      url: $rate_element.data('url')
      type: 'POST'
      data: act: $rate_element.data('act')
      success: (data) ->
        $('.post-rating').text String(data)

