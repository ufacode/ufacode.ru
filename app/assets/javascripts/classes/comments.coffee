class @Comments
  constructor: ->
    @form    = $('#comment_form')
    @content = $('#comment_content')
    $(document).on 'submit', '#comment_form', @comment_submit.bind(@)

  comment_submit: (e)->
    e.preventDefault()

    if @content.val() == ''
      @content.focus()
      return false

    $.ajax @form.prop('action'),
      method: 'POST'
      data: @form.serialize()
      success: (resp)=>
        parent_id = @form.find('#comment_parent_id').val()
#        el = $("#comments#{parent_id}").append(resp)
        el = $(resp).appendTo("#comments#{parent_id}")
        @scrollTo(el)
        @content.redactor('code.set', '')
        @content.val('')

    false

  scrollTo: (obj)->
    $('body').animate
      scrollTop: obj.offset().top
    , 500

