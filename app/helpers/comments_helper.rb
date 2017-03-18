# frozen_string_literal: true
module CommentsHelper
  def rate_comment_button(comment, _user, action)
    rate_value = rate_comment_path(comment, format: :json)
    if action == :like
      updown = 'up'
    else
      updown = 'down'
      flip   = 'fa-flip-horizontal'
    end
    %(
      <span class="post-rate comment-#{action} glyphicon glyphicon-thumbs-#{updown} #{flip}" data-url="#{rate_value}" data-act="#{action}"></span>
    ).html_safe # возвращаемый html элемент (кнопка)
  end
end
