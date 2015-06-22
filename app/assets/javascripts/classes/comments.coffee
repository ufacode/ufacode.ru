class @Comments
  constructor: ->
    $(document).on 'submit', '#comment_form', @comment_submit.bind(@)
    $(document).on 'click', '.reply', @comment_reply

  vars: ->
    @new_comment = $('#comment_new')
    @form    = $('#comment_form')
    @content = $('#comment_content')

  comment_submit: (e)->
    @vars()
    e.preventDefault()

    if @content.val() == ''
      @content.focus()
      return false

    $.ajax @form.prop('action'),
      method: 'POST'
      data: @form.serialize()
      success: (resp)=>
        parent_id = @form.find('#comment_parent_id').val()
        @new_comment.prepend(@form)
        el = $(resp).appendTo("#comments#{parent_id}")
        @scrollTo(el)
        @content.redactor('code.set', '')
        @content.val('')

    false

  scrollTo: (obj)->
    $('body').animate
      scrollTop: obj.offset().top
    , 500

  comment_reply: (e)->
    that = $(@)
    id   = that.data('id')
    form = $('#comment_form')
    form.find('#comment_parent_id').val(id)
    reply = $("#comment_reply#{id}")
    reply.prepend(form)
    e.preventDefault()
    false
