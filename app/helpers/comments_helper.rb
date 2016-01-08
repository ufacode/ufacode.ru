module CommentsHelper
	
	def rate_comment_button(comment, user, action)
    abc = rate_comment_path(comment, format: :json)
    if action == :like
      updown = 'up'
    else
      updown = 'down'
      flip   = 'fa-flip-horizontal'
    end
    %Q{
      <span class="post-rate comment-#{action} glyphicon glyphicon-thumbs-#{updown} #{flip}" data-url="#{abc}" data-act="#{action}"></span>
    }.html_safe #возвращаемый html элемент (кнопка)
  end

end
